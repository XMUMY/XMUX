import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:sentry/sentry.dart' as sentry_lib;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/main_app.dart';
import 'package:xmux/modules/api/xmux_api.dart';
import 'package:xmux/modules/firebase/firebase.dart';
import 'package:xmux/modules/xia/xia.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart' as v2;
import 'package:xmux/redux/redux.dart';

/// Main initialization progress.
void init() async {
  // Register sentry to capture errors. (Release mode only)
  if (!kIsWeb && bool.fromEnvironment('dart.vm.product'))
    FlutterError.onError = (e) =>
        sentry.captureException(exception: e.exception, stackTrace: e.stack);

  // Create APIv3 Client.
  XmuxApi(BackendApiConfig.address);
  // Select XMUX API server. (Deprecated)
  v2.XMUXApi([BackendApiConfig.address]);

  // Mobile specific initialization.
  if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) await mobileInit();

  // Init XiA async.
  XiA.init(ApiKeyConfig.dialogflowToken)
      .then((x) => xiA = x)
      .catchError((e) => sentry.captureException(exception: e));

  // Register SystemChannel to handle lifecycle message. (Deprecated)
  SystemChannels.lifecycle.setMessageHandler((msg) async {
    print('SystemChannels/LifecycleMessage: $msg');
    // Update language for XMUX API.
    if (msg == AppLifecycleState.resumed.toString())
      v2.XMUXApi.instance.configure();
    return msg;
  });

  // Check if local state is available.
  try {
    var prefs = await SharedPreferences.getInstance();
    var state = prefs.getString('state');
    Map<String, dynamic> initMap = jsonDecode(state);

    // Init store from initMap
    store.dispatch(InitAction(initMap));
  } catch (e) {
    // campusId.toLowerCase() will called on null if user not login yet.
    logout();
    return;
  }
  XmuxApi.instance.configure(
      authorization: Authorization.basic(
          store.state.user.campusId, store.state.user.password));

  FirebaseAuth.instance.currentUser().then((u) => firebase.user = u);
  postInit();
}

/// Post initialization after authentication.
void postInit() async {
  try {
    // Set user info for sentry report.
    sentry.userContext = sentry_lib.User(id: store.state.user.campusId);

    if (Platform.isAndroid) await androidPostInit();
    if (Platform.isIOS) await iOSPostInit();
  } catch (e) {
    sentry.captureException(exception: e);
  } finally {
    store.dispatch(UpdateHomepageAnnouncementsAction());
    store.dispatch(UpdateTimetableAction());
    store.dispatch(UpdateUserProfileAction());
    if (store.state.user.isStudent) {
      store.dispatch(UpdateAssignmentsAction());
      store.dispatch(UpdateInfoAction());
      store.dispatch(UpdateAcAction());
      store.dispatch(UpdateCoursesAction());
    }
    runApp(MainApp());
  }
}

// Return `false` to stop main initialization progress.
Future<bool> mobileInit() async {
  // Get package Info.
  packageInfo = await PackageInfo.fromPlatform();

  // Register sentry again with release info. (Release mode only)
  if (bool.fromEnvironment('dart.vm.product'))
    FlutterError.onError = (e) => sentry.capture(
          event: sentry_lib.Event(
              exception: e.exception,
              stackTrace: e.stack,
              release: packageInfo.version),
        );

  // Init firebase services.
  firebase = await Firebase.init();

  // Version check.
  var currentBuild = int.tryParse(packageInfo?.buildNumber ?? '0') ?? 0;
  var minBuild = firebase.remoteConfigs.versions?.minBuildSupported ?? 0;
  if (currentBuild < minBuild) {
    logout(message: 'deprecated');
    return false;
  }

  // Register FirebaseAuth state listener.
  FirebaseAuth.instance.onAuthStateChanged.listen((user) {
    if (user == null && firebase.user != null) logout();
    if (user != null) {
      firebase.user = user;
      XmuxApi.instance.configure(
          authorization: Authorization()
            ..bearerRefresher = () async => (await user.getIdToken()).token);

      // APIv2 JWT configure. (Deprecated)
      v2.XMUXApi.instance.getIdToken =
          () async => (await firebase.user.getIdToken()).token;
    }
  });

  // Configure FCM.
  firebase.messaging.configure();
  return true;
}

Future<Null> androidPostInit() async {
  // Use Mountain View on Android.
  ThemeConfig.defaultTheme = ThemeConfig.defaultTheme.copyWith(
      pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
  }));
  ThemeConfig.defaultDarkTheme = ThemeConfig.defaultDarkTheme.copyWith(
      pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
  }));

  DeviceInfoPlugin()
      .androidInfo
      .then((deviceInfo) async => XmuxApi.instance.refreshDevice(
            deviceInfo.androidId,
            deviceInfo.model,
            '${deviceInfo.manufacturer} ${deviceInfo.model}',
            pushChannel: 'fcm',
            pushKey: await firebase.messaging.getToken(),
          ));
}

Future<Null> iOSPostInit() async {
  DeviceInfoPlugin()
      .iosInfo
      .then((deviceInfo) async => XmuxApi.instance.refreshDevice(
            deviceInfo.identifierForVendor,
            deviceInfo.model,
            deviceInfo.name,
            pushChannel: 'fcm',
            pushKey: await firebase.messaging.getToken(),
          ));
}
