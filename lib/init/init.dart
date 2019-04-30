import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/init/login_handler.dart';
import 'package:xmux/modules/xia/xia.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';

export 'init_app.dart';

enum InitResult { notLogin, loginError, finished }

Future<InitResult> init() async {
  // Register sentry to capture errors. (Release mode only)
  if (bool.fromEnvironment('dart.vm.product'))
    FlutterError.onError = (e) =>
        sentry.captureException(exception: e.exception, stackTrace: e.stack);

  // Get package Info.
  packageInfo = await PackageInfo.fromPlatform();

  // Select XMUX API server.
  XMUXApi(BackendApiConfig.addresses);
  await XMUXApi.selectingServer;

  // Register SystemChannel to handle lifecycle message.
  SystemChannels.lifecycle.setMessageHandler((msg) {
    print('SystemChannels/LifecycleMessage: $msg');
    // Update language for XMUX API.
    if (msg == AppLifecycleState.resumed.toString())
      XMUXApi.instance.configure();
  });

  // Init XiA.
  xiA = await XiA.init(ApiKeyConfig.dialogflowToken).catchError((e) {});

  // Init FCM.
  initFCM();

  String appDocDir;
  Map<String, dynamic> initMap;

  // Check if local state is available.
  try {
    appDocDir = (await getApplicationDocumentsDirectory()).path;
    initMap = jsonDecode(await (File('$appDocDir/state.dat')).readAsString());

    // Init store from initMap
    store.dispatch(InitAction(initMap));
  } catch (e) {
    FirebaseAuth.instance.signOut();
    return InitResult.notLogin;
  }

  // If haven't login.
  if (store.state.authState.campusID == null ||
      store.state.authState.campusIDPassword == null)
    return InitResult.notLogin;

  if ((await LoginHandler.firebaseLogin()) != "success") {
    FirebaseAuth.instance.signOut();
    return InitResult.loginError;
  }

  XMUXApi.instance.getIdToken = firebaseUser.getIdToken;

  try {
    await XMUXApi.instance.getUser(firebaseUser.uid);
    await XMUXApi.instance.updateUser(User(
        firebaseUser.uid, firebaseUser.displayName, firebaseUser.photoUrl));
  } catch (e) {
    await LoginHandler.login(
        store.state.authState.campusID, store.state.authState.campusIDPassword);
    await LoginHandler.createUser();
  }

  if (Platform.isAndroid) {
    var deviceInfo = await DeviceInfoPlugin().androidInfo;
    var token = await firebaseMessaging.getToken();
    XMUXApi.instance.device(deviceInfo.fingerprint, token, deviceInfo.model);
  } else {
    var deviceInfo = await DeviceInfoPlugin().iosInfo;
    var token = await firebaseMessaging.getToken();
    XMUXApi.instance
        .device(deviceInfo.identifierForVendor, token, deviceInfo.model);
  }

  refreshData();

  return InitResult.finished;
}

void initFCM() {
  // Request notification Permission
  firebaseMessaging.requestNotificationPermissions();

  // Configure FCM.
  firebaseMessaging.configure();

  // Get FCM token.
  firebaseMessaging
      .getToken()
      .then((token) => print("FCM/Token got: " + token));
}

/// Refresh data from source.
void refreshData() {
  store.dispatch(UpdateInfoAction());
  store.dispatch(UpdateHomepageAnnouncementsAction());
  store.dispatch(UpdateAcAction());
  store.dispatch(UpdateCoursesAction());
  store.dispatch(UpdateAssignmentsAction());
}
