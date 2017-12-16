import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:event_bus/event_bus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/identity/login.dart';

final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
EventBus updateEventBus = new EventBus();
PersonalInfoState globalPersonalInfoState = new PersonalInfoState();
CalendarState globalCalendarState = new CalendarState();

Future<bool> init() async {
  String dir, loginInfo;
  try {
    dir = (await getApplicationDocumentsDirectory()).path;
    loginInfo = await (new File('$dir/login.dat')).readAsString();
  } catch (e) {
    runLoginPage();
    return false;
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
  if (resJson.containsKey("error")) {
    runLoginPage();
    return false;
  }

  globalPersonalInfoState.campusId = loginInfoJson["campusId"];
  globalPersonalInfoState.password = loginInfoJson["password"];
  globalPersonalInfoState.ePaymentPassword = loginInfoJson["ePaymentPassword"];
  globalPersonalInfoState.fullName = resJson["moodle"]["fullname"];
  globalPersonalInfoState.avatarURL = resJson["moodle"]["userpictureurl"];
  globalCalendarState.classesData = resJson["timetable"];
  globalCalendarState.examsData = resJson["exam"];
  globalCalendarState.assignmentData = resJson["assignment"];
  globalCalendarState.paymentData = resJson["bill"];

  return true;
}

void runLoginPage() {
  runApp(new MaterialApp(
    theme: defaultTheme,
    home: new LoginPage(),
  ));
}

class PersonalInfoState {
  String campusId, password, ePaymentPassword;
  String fullName, avatarURL;

  PersonalInfoState(
      {this.campusId,
      this.password,
      this.ePaymentPassword,
      this.fullName,
      this.avatarURL});

  void clear() {
    this.campusId = null;
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

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.black,
        body: new Stack(
          children: <Widget>[
            new DecoratedBox(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new AssetImage('res/initpage.jpg'),
                ),
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "X",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 120.0,
                    ),
                  ),
                  new Divider(
                    height: 16.0,
                  ),
                  new SizedBox(
                    width: 100.0,
                    child: const LinearProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
