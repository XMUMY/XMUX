import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/main_app/calendar/assignment.dart';
import 'package:xmux/main_app/calendar/attendance.dart';
import 'package:xmux/main_app/calendar/exam.dart';
import 'package:xmux/main_app/calendar/notification.dart';
import 'package:xmux/main_app/calendar/timetable.dart';
import 'package:xmux/modules/attendance/attendance.dart';
import 'package:xmux/redux/redux.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var showAttendance = AttendanceApi().available;
    var tabLength = 2;
    if (store.state.user.isStudent) tabLength += 2;
    if (showAttendance) tabLength++;

    return DefaultTabController(
      length: tabLength,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          leading: StoreConnector<MainAppState, VoidCallback>(
            converter: (store) => () => store.dispatch(OpenDrawerAction(true)),
            builder: (context, callback) =>
                IconButton(icon: Icon(Icons.view_list), onPressed: callback),
          ),
          title: Text(S.of(context).Calendar),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.calendarAlt),
              tooltip: S.of(context).Calendar_Academic,
              onPressed: () => Navigator.of(context, rootNavigator: true)
                  .pushNamed('/Calendar/CalendarImage'),
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: <Tab>[
              Tab(text: S.of(context).Calendar_Classes),
              if (store.state.user.isStudent) ...{
                Tab(text: S.of(context).Calendar_Exams),
                Tab(text: S.of(context).Calendar_Assignments),
              },
              Tab(text: S.of(context).Calendar_Notifications),
              if (showAttendance) Tab(text: S.of(context).Calendar_Attendance),
            ],
          ),
        ),
        body: StoreBuilder<MainAppState>(
          builder: (BuildContext context, store) => TabBarView(
            children: <Widget>[
              TimeTablePage(store.state.queryState.timetable),
              if (store.state.user.isStudent) ...{
                ExamsPage(store.state.acState.exams),
                AssignmentPage(store.state.queryState.assignments),
              },
              NotificationPage(),
              if (showAttendance) AttendancePage(),
            ],
          ),
        ),
      ),
    );
  }
}
