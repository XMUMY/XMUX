import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/loginapp/login_handler.dart';
import 'package:xmux/modules/xia/xia.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';

export 'init_page.dart';

enum InitResult { notLogin, loginError, finished }

Future<InitResult> init() async {
  // Register sentry to capture errors. (Release mode only)
  if (bool.fromEnvironment('dart.vm.product'))
    FlutterError.onError = (e) =>
        sentry.captureException(exception: e.exception, stackTrace: e.stack);

  // Get package Info.
  packageInfo = await PackageInfo.fromPlatform();

  // Select XMUX API server.
  xmuxApi = XMUXApi(BackendApiConfig.addresses);
  await XMUXApi.selectingServer;

  // Register SystemChannel to handle lifecycle message.
  SystemChannels.lifecycle.setMessageHandler((msg) {
    print('SystemChannels/LifecycleMessage: $msg');
    if (msg == AppLifecycleState.resumed.toString()) xmuxApi.configure();
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

  xmuxApi.configure(jwt: await firebaseUser.getIdToken());

  store.dispatch(UpdateAcAction());
  store.dispatch(UpdateCoursesAction());
  store.dispatch(UpdateAssignmentsAction());
  store.dispatch(UpdateHomepageAnnouncementsAction());

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
