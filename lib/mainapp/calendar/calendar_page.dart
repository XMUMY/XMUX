import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/mainapp/calendar/assignment.dart';
import 'package:xmux/mainapp/calendar/exams.dart';
import 'package:xmux/mainapp/calendar/timetable.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/state.dart';
import 'package:xmux/translations/translation.dart';

class CalendarPage extends StatelessWidget {
  List<dynamic> _sortTimetable(List<dynamic> timetable) {
    var pos = max(
        timetable
            .map((c) => c["dayOfWeek"])
            .toList()
            .indexOf(DateTime.now().weekday - 1),
        0);
    return timetable.sublist(pos)..addAll(timetable.sublist(0, pos));
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              leading: StoreConnector<MainAppState, VoidCallback>(
                converter: (store) =>
                    () => store.dispatch(OpenDrawerAction(true)),
                builder: (context, callback) => IconButton(
                    icon: Icon(Icons.view_list), onPressed: callback),
              ),
              title: Text(MainLocalizations.of(context).get("Calendar")),
              actions: <Widget>[
                IconButton(
                    icon: Icon(FontAwesomeIcons.calendarAltO),
                    tooltip: MainLocalizations
                        .of(context)
                        .get("Calendar/CalendarImage"),
                    onPressed: () {
                      Navigator
                          .of(context)
                          .pushNamed("/Calendar/CalendarImage");
                    })
              ],
              bottom: TabBar(isScrollable: false, tabs: <Tab>[
                Tab(
                  text: MainLocalizations.of(context).get("Calendar/Classes"),
                ),
                Tab(
                  text: MainLocalizations.of(context).get("Calendar/Exams"),
                ),
                Tab(
                  text:
                      MainLocalizations.of(context).get("Calendar/Assignments"),
                ),
              ]),
            ),
            body: StoreConnector<MainAppState, ACState>(
                builder: (BuildContext context, acState) =>
                    TabBarView(children: <Widget>[
                      TimeTablePage(_sortTimetable(acState.timetable)),
                      ExamsPage(acState.exams),
                      AssignmentPage(acState.assignments),
                    ]),
                converter: (s) => s.state.acState)),
      );
}
