import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/loginapp/loginhandler.dart';

final FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
FirebaseUser firebaseUser;
final gPersonalInfoState globalPersonalInfoState = new gPersonalInfoState();
final CalendarState globalCalendarState = new CalendarState();

Future<String> init() async {
  String dir, loginInfo;
  try {
    dir = (await getApplicationDocumentsDirectory()).path;
    loginInfo = await (new File('$dir/login.dat')).readAsString();
  } catch (e) {
    return "NotLogin";
  }
  Map loginInfoJson = JSON.decode(loginInfo);
  var response = await http.post(BackendApiConfig.address + "/refresh", body: {
    "id": loginInfoJson["campusId"],
    "cpass": loginInfoJson["password"],
    "epass": loginInfoJson["ePaymentPassword"] == null
        ? ""
        : loginInfoJson["ePaymentPassword"],
  });
  Map resJson = JSON.decode(response.body);

  if (resJson.containsKey("error") ||
      (await LoginHandler.firebaseLogin()).containsKey("error")) {
    FirebaseAuth.instance.signOut();
    return "LoginError";
  }

  globalPersonalInfoState.id = loginInfoJson["campusId"];
  globalPersonalInfoState.password = loginInfoJson["password"];
  globalPersonalInfoState.ePaymentPassword = loginInfoJson["ePaymentPassword"];
  globalPersonalInfoState.fullName = resJson["moodle"]["fullname"];
  globalPersonalInfoState.avatarURL = resJson["moodle"]["userpictureurl"];
  globalCalendarState.classesData = resJson["timetable"];
  globalCalendarState.examsData = resJson["exam"];
  globalCalendarState.assignmentData = resJson["assignment"];
  globalCalendarState.paymentData = resJson["bill"];

  return "Finished";
}

class gPersonalInfoState {
  String id, password, ePaymentPassword;
  String fullName, avatarURL;

  gPersonalInfoState(
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
