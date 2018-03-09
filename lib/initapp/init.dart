import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:xmux/config.dart';
import 'package:xmux/loginapp/loginhandler.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/state.dart';

final FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
FirebaseUser firebaseUser;
final GPersonalInfoState globalPersonalInfoState = new GPersonalInfoState();
final CalendarState globalCalendarState = new CalendarState();

Future<String> init(Store<MainAppState> store) async {
  String appDocDir;
  Map<String, Map> initMap;

  // Check if local state is available.
  try {
    appDocDir = (await getApplicationDocumentsDirectory()).path;
    initMap =
        JSON.decode(await (new File('$appDocDir/state.dat')).readAsString());
  } catch (e) {
    FirebaseAuth.instance.signOut();
    return "NotLogin";
  }

  // Init store from initMap
  store.dispatch(new InitAction(initMap));

  var response = await http.post(BackendApiConfig.address + "/refresh", body: {
    "id": store.state.personalInfoState.uid,
    "cpass": store.state.personalInfoState.password,
    "epass": store.state.settingState.ePaymentPassword ?? ""
  });
  Map resJson = JSON.decode(response.body);

  if (resJson.containsKey("error") ||
      (await LoginHandler.firebaseLogin()).containsKey("error")) {
    FirebaseAuth.instance.signOut();
    return "LoginError";
  }

  globalPersonalInfoState.id = store.state.personalInfoState.uid;
  globalPersonalInfoState.password = store.state.personalInfoState.password;
  globalPersonalInfoState.ePaymentPassword =
      store.state.settingState.ePaymentPassword;
  globalPersonalInfoState.fullName = resJson["moodle"]["fullname"];
  globalPersonalInfoState.avatarURL = resJson["moodle"]["userpictureurl"];
  globalCalendarState.classesData = resJson["timetable"];
  globalCalendarState.examsData = resJson["exam"];
  globalCalendarState.assignmentData = resJson["assignment"];
  globalCalendarState.paymentData = resJson["bill"];

  return "Finished";
}

class GPersonalInfoState {
  String id, password, ePaymentPassword;
  String fullName, avatarURL;

  GPersonalInfoState(
      {this.id,
      this.password,
      this.ePaymentPassword,
      this.fullName,
      this.avatarURL});

  void clear() {
    this.id = null;
    this.password = null;
    this.ePaymentPassword = null;
    this.fullName = null;
    this.avatarURL = null;
  }
}

class CalendarState {
  Map classesData, examsData, paymentData;
  List assignmentData;

  CalendarState(
      {this.classesData,
      this.examsData,
      this.paymentData,
      this.assignmentData});

  void clear() {
    this.classesData = null;
    this.examsData = null;
    this.paymentData = null;
    this.assignmentData = null;
  }
}
