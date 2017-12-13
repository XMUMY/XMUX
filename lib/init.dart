import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/identity/login.dart';

EventBus loginEventBus = new EventBus();
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
    "epass": loginInfoJson["ePaymentPassword"],
  });
  Map resJson = JSON.decode(response.body);
  if (resJson.containsKey("error")) {
    runLoginPage();
    return false;
  }

  globalPersonalInfoState.campusId = loginInfoJson["campusId"];
  globalPersonalInfoState.password = loginInfoJson["password"];
  globalPersonalInfoState.ePaymentPassword =
      loginInfoJson["ePaymentPassword"] == null
          ? null
          : loginInfoJson["ePaymentPassword"];
  globalCalendarState.classesData = resJson["timetable"];
  globalCalendarState.examsData = resJson["exam"];
  globalCalendarState.assignmentData = resJson["assignment"];
  globalCalendarState.paymentData =
      resJson["bill"] == null ? null : resJson["bill"];

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
}

class CalendarState {
  Map classesData, examsData, paymentData;
  List assignmentData;

  CalendarState(
      {this.classesData,
      this.examsData,
      this.paymentData,
      this.assignmentData});
}

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.purple[900],
        body: new Center(
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
              new Column(),
            ],
          ),
        ),
      ),
    );
  }
}
