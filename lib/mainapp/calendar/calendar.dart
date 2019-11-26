import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/calendar/assignment.dart';
import 'package:xmux/mainapp/calendar/exam.dart';
import 'package:xmux/mainapp/calendar/timetable.dart';
import 'package:xmux/redux/redux.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              icon: Icon(FontAwesomeIcons.history),
              tooltip: i18n('Calendar/AttendanceHistory', context),
              onPressed: () => Navigator.of(context, rootNavigator: true)
                  .pushNamed('/Calendar/AttendanceHistory'),
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.calendarAlt),
              tooltip: i18n('Calendar/Academic', context),
              onPressed: () => Navigator.of(context, rootNavigator: true)
                  .pushNamed('/Calendar/CalendarImage'),
            )
          ],
          bottom: TabBar(isScrollable: false, tabs: <Tab>[
            Tab(
              text: i18n('Calendar/Classes', context),
            ),
            Tab(
              text: i18n('Calendar/Exams', context),
            ),
            Tab(
              text: i18n('Calendar/Assignments', context),
            ),
          ]),
        ),
        body: StoreBuilder<MainAppState>(
          builder: (BuildContext context, store) => TabBarView(
            children: <Widget>[
              TimeTablePage(store.state.queryState.timetable),
              ExamsPage(store.state.acState.exams),
              AssignmentPage(store.state.acState.assignments),
            ],
          ),
        ),
      ),
    );
  }
}
