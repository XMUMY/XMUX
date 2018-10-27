import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/loginapp/login_handler.dart';
import 'package:xmux/modules/backend_handler/backend_handler.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';

export 'init_page.dart';

enum InitResult { notLogin, loginError, finished }

Future<InitResult> init() async {
  // Get package Info.
  packageInfo = await PackageInfo.fromPlatform();

  // Select backend server.
  backend = BackendHandler(BackendApiConfig.addresses);
  await BackendHandler.selectingBackend;

  // Select XMUX API server.
  xmuxApi = XMUXApi(BackendApiConfig.addresses);
  await XMUXApi.selectingServer;

  // Register SystemChannel to handle lifecycle message.
  SystemChannels.lifecycle.setMessageHandler((msg) {
    print('SystemChannels/LifecycleMessage: $msg');
    if (msg == AppLifecycleState.resumed.toString()) xmuxApi.configure();
  });

  // Init FCM.
  initFCM();

  String appDocDir;
  Map<String, dynamic> initMap;

  // Check if local state is available.
  try {
    appDocDir = (await getApplicationDocumentsDirectory()).path;
    initMap = jsonDecode(await (File('$appDocDir/state.dat')).readAsString());

    // Init store from initMap
    mainAppStore.dispatch(InitAction(initMap));
  } catch (e) {
    FirebaseAuth.instance.signOut();
    return InitResult.notLogin;
  }

  // If haven't login.
  if (mainAppStore.state.authState.campusID == null ||
      mainAppStore.state.authState.campusIDPassword == null)
    return InitResult.notLogin;

  if ((await LoginHandler.firebaseLogin()) != "success") {
    FirebaseAuth.instance.signOut();
    return InitResult.loginError;
  }

  mainAppStore.dispatch(UpdateAcAction());
  mainAppStore.dispatch(UpdateCoursesAction());
  mainAppStore.dispatch(UpdateAssignmentsAction());

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
      .then((token) => print("FCM: Token got: " + token));
}
