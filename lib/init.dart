import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:event_bus/event_bus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/identity/login.dart';
import 'package:xmux/identity/loginhandler.dart';
import 'package:xmux/translate.dart';

final FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
FirebaseUser firebaseUser;
PersonalInfoState globalPersonalInfoState = new PersonalInfoState();
CalendarState globalCalendarState = new CalendarState();
EventBus actionEventBus = new EventBus();

Future<bool> init() async {
  String dir, loginInfo;
  try {
    dir = (await getApplicationDocumentsDirectory()).path;
    loginInfo = await (new File('$dir/login.dat')).readAsString();
  } catch (e) {
    runLoginApp();
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
    FirebaseAuth.instance.signOut();
    runLoginApp();
    return false;
  }

  await LoginHandler.firebaseLogin();

  globalPersonalInfoState.id = loginInfoJson["campusId"];
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

void runLoginApp() {
  runApp(
    new MaterialApp(
      theme: defaultTheme,
      home: new LoginPage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        LoginLocalizationsDelegate.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CN'),
        const Locale('en', 'US'),
      ],
    ),
  );
}

class PersonalInfoState {
  String id, password, ePaymentPassword;
  String fullName, avatarURL;

  PersonalInfoState(
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
