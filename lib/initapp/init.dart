import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/loginapp/loginhandler.dart';
import 'package:xmux/mainapp/calendar/calendarhandler.dart';
import 'package:xmux/redux/actions.dart';

Future<String> init() async {
  String appDocDir;
  Map<String, Map> initMap;

  // Check if local state is available.
  try {
    appDocDir = (await getApplicationDocumentsDirectory()).path;
    initMap =
        JSON.decode(await (new File('$appDocDir/state.dat')).readAsString());

    // Init store from initMap
    mainAppStore.dispatch(new InitAction(initMap));
  } catch (e) {
    FirebaseAuth.instance.signOut();
    return "NotLogin";
  }

  CalendarHandler.acUpdate();
  CalendarHandler.assignmentUpdate();

  var response = await http.post(BackendApiConfig.address + "/refresh", body: {
    "id": mainAppStore.state.personalInfoState.uid,
    "cpass": mainAppStore.state.personalInfoState.password,
    "epass": mainAppStore.state.settingState.ePaymentPassword ?? ""
  });
  Map resJson = JSON.decode(response.body);

  if (resJson.containsKey("error") ||
      (await LoginHandler.firebaseLogin()).containsKey("error")) {
    FirebaseAuth.instance.signOut();
    return "LoginError";
  }

  return "Finished";
}
