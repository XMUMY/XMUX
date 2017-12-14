import 'package:flutter/material.dart';
import 'package:xmux/calendar/assignment.dart';
import 'package:xmux/calendar/exams.dart';
import 'package:xmux/calendar/payment.dart';
import 'package:xmux/calendar/timetable.dart';
import 'package:xmux/init.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => new _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  String id, password, ePassword;

  @override
  void initState() {
    updateEventBus.on(CalendarState).listen((CalendarState e) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: new Scaffold(
        appBar: new AppBar(
          title: const Text('Calendar'),
          bottom: new TabBar(isScrollable: true, tabs: <Tab>[
            new Tab(
              text: "Classes",
            ),
            new Tab(
              text: "Exams",
            ),
            new Tab(
              text: "Payment",
            ),
            new Tab(
              text: "Assignment",
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
          globalCalendarState.paymentData == null
              ? new _ErrorPage()
              : new PaymentPage(globalCalendarState.paymentData),
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
