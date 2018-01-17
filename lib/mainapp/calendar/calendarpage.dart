import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xmux/mainapp/calendar/assignment.dart';
import 'package:xmux/mainapp/calendar/exams.dart';
import 'package:xmux/mainapp/calendar/timetable.dart';
import 'package:xmux/config.dart';
import 'package:xmux/mainapp/events/actions.dart';
import 'package:xmux/initapp/init.dart';
import 'package:xmux/translations/translation.dart';

class CalendarPage extends StatefulWidget {
  static Future updateCalendarData() async {
    var response =
        await http.post(BackendApiConfig.address + "/refresh", body: {
      "id": globalPersonalInfoState.id,
      "cpass": globalPersonalInfoState.password,
      "epass": globalPersonalInfoState.ePaymentPassword == null
          ? ""
          : globalPersonalInfoState.ePaymentPassword,
    });
    Map resJson = JSON.decode(response.body);

    globalCalendarState.classesData = resJson["timetable"];
    globalCalendarState.examsData = resJson["exam"];
    globalCalendarState.assignmentData = resJson["assignment"];
    globalCalendarState.paymentData = resJson["bill"];
  }

  @override
  _CalendarPageState createState() => new _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
              icon: new Icon(Icons.view_list),
              onPressed: () {
                actionEventBus.fire(new OpenDrawer(true));
              }),
          title: new Text(MainLocalizations.of(context).get("calendar")),
          bottom: new TabBar(isScrollable: false, tabs: <Tab>[
            new Tab(
              text: MainLocalizations.of(context).get("calendar/classes"),
            ),
            new Tab(
              text: MainLocalizations.of(context).get("calendar/exams"),
            ),
            new Tab(
              text: MainLocalizations.of(context).get("calendar/assignments"),
            ),
          ]),
        ),
        body: new TabBarView(children: <Widget>[
          globalCalendarState.classesData == null
              ? new _ErrorPage()
              : new ClassesPage(globalCalendarState.classesData),
          globalCalendarState.examsData == null
              ? new _ErrorPage()
              : new ExamsPage(globalCalendarState.examsData),
          globalCalendarState.assignmentData == null
              ? new _ErrorPage()
              : new AssignmentPage(globalCalendarState.assignmentData),
        ]),
      ),
    );
  }
}

class _ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Card(
        color: Colors.white,
        child: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.error,
                size: 60.0,
                color: Theme.of(context).errorColor,
              ),
              new Divider(
                height: 20.0,
                color: Theme.of(context).cardColor,
              ),
              new Text(
                "Oh ! Nothing is here !\n\nPlease check:\n You are logined successfully.\nYour have connected to internet.",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
