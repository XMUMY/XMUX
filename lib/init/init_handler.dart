import 'dart:convert';

import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:sentry/sentry.dart' as sentry_lib;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xmux/config.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/main_app/main_app.dart';
import 'package:xmux/modules/api/xmux_api.dart' as v3;
import 'package:xmux/modules/attendance/attendance.dart';
import 'package:xmux/modules/firebase/firebase.dart';
import 'package:xmux/modules/rpc/authorization.dart';
import 'package:xmux/modules/xia/xia.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart' as v2;
import 'package:xmux/redux/redux.dart';
import 'package:xmux/theme.dart';

/// Main initialization progress.
void init() async {
  // Register sentry to capture errors. (Release mode only)
  if (P.isVM && bool.fromEnvironment('dart.vm.product'))
    FlutterError.onError = (e) =>
        sentry.captureException(exception: e.exception, stackTrace: e.stack);

  // Create APIv3 Client.
  v3.XmuxApi(BackendApiConfig.address);
  // Select XMUX API server. (Deprecated)
  v2.XMUXApi([BackendApiConfig.address]);
  // Init XiA async.
  XiA.init(ApiKeyConfig.dialogflowToken)
      .then((x) => xiA = x)
      .catchError((e) => sentry.captureException(exception: e));

  // Initialization for non web application.
  if (P.isWeb || P.isDesktop)
    await webInit();
  else
    await ioInit();

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
    // RegExp cannot match user if not login yet.
    logout();
    return;
  }

  postInit();
}

/// Post initialization after authentication.
void postInit() async {
  try {
    // Attach campus ID and password to RPC client.
    rpc.authorization.mergeFrom(Authorization.basic(
      store.state.user.campusId,
      store.state.user.password,
    ));

    // Attach ID and password to XmuxApi.
    v3.XmuxApi.instance.configure(
      authorization: v3.Authorization.basic(
        store.state.user.campusId,
        store.state.user.password,
      ),
    );
    // Attach ID and password to MoodleApi.
    moodleApi.login(
      store.state.user.campusId,
      store.state.user.password,
    );
    // Attach ID and password to AttendanceApi.
    AttendanceApi(
      address: BackendApiConfig.attendanceAddress,
      uid: store.state.user.campusId,
      password: store.state.user.password,
    );
    // Set user info for sentry report.
    sentry.userContext = sentry_lib.User(id: store.state.user.campusId);

    if (P.isAndroid) await androidPostInit();
    if (P.isIOS) await iOSPostInit();
  } catch (e) {
    sentry.captureException(exception: e);
  } finally {
    store.dispatch(UpdateHomepageAnnouncementsAction());
    store.dispatch(UpdateTimetableAction());
    store.dispatch(SyncUserProfileAction());
    if (store.state.user.isStudent) {
      store.dispatch(UpdateAssignmentsAction());
      store.dispatch(UpdateCoursesAction());
      store.dispatch(UpdateExamsAction());
      store.dispatch(UpdateTranscriptAction());
    }
    runApp(MainApp());
  }
}

/// Initialization for VM based application.
Future<void> ioInit() async {
  await Future.wait([
    () async {
      // Initialize package info if supported.
      if (P.isMobile || P.isMacOS)
        packageInfo = await PackageInfo.fromPlatform();
    }(),
    () async {
      await Firebase.init();
    }()
  ]);

  // Register sentry again with release info. (Release mode only)
  if (packageInfo != null && bool.fromEnvironment('dart.vm.product'))
    FlutterError.onError = (e) => sentry.capture(
          event: sentry_lib.Event(
              exception: e.exception,
              stackTrace: e.stack,
              release: packageInfo.version),
        );

  // Minimal version check.
  var currentBuild = int.tryParse(packageInfo?.buildNumber ?? '0') ?? 0;
  var minBuild = Firebase.remoteConfigs.versions?.minBuildSupported ?? 0;
  if (currentBuild < minBuild) {
    logout(message: LocaleKeys.General_Deprecation);
    return;
  }

  // TODO: Consider web.
  // Register FirebaseAuth state listener.
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (FirebaseAuth.instance.currentUser != null && user == null) logout();

    v3.XmuxApi.instance.configure(
        authorization: v3.Authorization()
          ..bearerRefresher = () async => await user.getIdToken());

    // APIv2 JWT configure. (Deprecated)
    v2.XMUXApi.instance.getIdToken = () async => await user.getIdToken();
  });

  // Configure FCM.
  Firebase.messaging.configure();
  return;
}

/// Initialization for web based application.
Future<void> webInit() async {
  await Firebase.initWeb();
}

Future<void> androidPostInit() async {
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
      .then((deviceInfo) async => v3.XmuxApi.instance.refreshDevice(
            deviceInfo.androidId,
            deviceInfo.model,
            '${deviceInfo.manufacturer} ${deviceInfo.model}',
            pushChannel: 'fcm',
            pushKey: await Firebase.messaging.getToken(),
          ));
}

Future<void> iOSPostInit() async {
  DeviceInfoPlugin()
      .iosInfo
      .then((deviceInfo) async => v3.XmuxApi.instance.refreshDevice(
            deviceInfo.identifierForVendor,
            deviceInfo.model,
            deviceInfo.name,
            pushChannel: 'fcm',
            pushKey: await Firebase.messaging.getToken(),
          ));
}
