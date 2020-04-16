import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/calendar/assignment.dart';
import 'package:xmux/mainapp/calendar/attendance.dart';
import 'package:xmux/mainapp/calendar/exam.dart';
import 'package:xmux/mainapp/calendar/timetable.dart';
import 'package:xmux/modules/attendance/attendance.dart';
import 'package:xmux/redux/redux.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var showAttendance = AttendanceApi().available;
    var tabLength = 1;
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
          title: Text(i18n('Calendar', context)),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.calendarAlt),
              tooltip: i18n('Calendar/Academic', context),
              onPressed: () => Navigator.of(context, rootNavigator: true)
                  .pushNamed('/Calendar/CalendarImage'),
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: <Tab>[
              Tab(text: i18n('Calendar/Classes', context)),
              if (store.state.user.isStudent) ...{
                Tab(text: i18n('Calendar/Exams', context)),
                Tab(text: i18n('Calendar/Assignments', context)),
              },
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
              if (showAttendance) AttendancePage(),
            ],
          ),
        ),
      ),
    );
  }
}
