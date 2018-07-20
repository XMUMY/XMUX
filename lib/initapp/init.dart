import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/loginapp/login_handler.dart';
import 'package:xmux/mainapp/calendar/calendar_handler.dart';
import 'package:xmux/modules/backend_handler/backend_handler.dart';
import 'package:xmux/redux/actions.dart';

enum InitResult { notLogin, loginError, finished }

Future<InitResult> init() async {
  // Select backend server.
  backend = BackendHandler(BackendApiConfig.addresses);
  await BackendHandler.selectingBackend.timeout(Duration(seconds: 5));
  // Init FCM.
  initFCM();
  // Get package Info.
  packageInfo = await PackageInfo.fromPlatform();

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
  if (mainAppStore.state.personalInfoState.uid == null ||
      mainAppStore.state.personalInfoState.password == null)
    return InitResult.notLogin;

  if ((await LoginHandler.firebaseLogin()) != "success") {
    FirebaseAuth.instance.signOut();
    return InitResult.loginError;
  }

  CalendarHandler.acUpdate().timeout(Duration(seconds: 10));
  CalendarHandler.assignmentUpdate().timeout(Duration(seconds: 10));

  return InitResult.finished;
}

void initGlobalVars() {}

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
