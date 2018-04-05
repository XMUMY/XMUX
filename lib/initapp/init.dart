import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/loginapp/login_handler.dart';
import 'package:xmux/mainapp/calendar/calendar_handler.dart';
import 'package:xmux/redux/actions.dart';

Future<String> init() async {
  String appDocDir;
  Map<String, dynamic> initMap;

  // Check if local state is available.
  try {
    appDocDir = (await getApplicationDocumentsDirectory()).path;
    initMap =
        jsonDecode(await (new File('$appDocDir/state.dat')).readAsString());

    // Init store from initMap
    mainAppStore.dispatch(new InitAction(initMap));
  } catch (e) {
    FirebaseAuth.instance.signOut();
    return "NotLogin";
  }

  CalendarHandler.acUpdate();
  CalendarHandler.assignmentUpdate();

  if ((await LoginHandler.firebaseLogin()) != "success") {
    FirebaseAuth.instance.signOut();
    return "LoginError";
  }

  return "Finished";
}
