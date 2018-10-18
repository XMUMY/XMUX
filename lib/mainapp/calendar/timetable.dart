import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/error_widgets/error_widgets.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';
import 'package:xmux/translations/translation.dart';

class TimeTablePage extends StatelessWidget {
  final List<Lesson> classes;

  TimeTablePage(List<Lesson> timetable)
      : this.classes = timetable == null ? null : _sortTimetable(timetable);

  static List<Lesson> _sortTimetable(List<Lesson> timetable) {
    var pos = max(
        timetable
            .map((c) => c.dayOfWeek)
            .toList()
            .indexOf(DateTime.now().weekday - 1),
        0);
    return timetable.sublist(pos)..addAll(timetable.sublist(0, pos));
  }

  // Handle refresh.
  Future<Null> _handleUpdate() async {
    var action = UpdateAcAction();
    mainAppStore.dispatch(action);
    await action.listener;
  }

  Widget _buildLastUpdateString(BuildContext context) => Center(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            MainLocalizations.of(context).get("Calendar/LastUpdate") +
                DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
                    .format(mainAppStore.state.acState.timestamp) +
                " " +
                DateFormat.Hms(Localizations.localeOf(context).languageCode)
                    .format(mainAppStore.state.acState.timestamp),
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => classes == null
      ? ErrorWidgets.emptyErrorButton(onRefresh: _handleUpdate)
      : classes.isEmpty
          ? ErrorWidgets.emptyErrorPage
          : RefreshIndicator(
              onRefresh: _handleUpdate,
              child: ListView.builder(
                  itemCount: classes.length + 1,
                  itemBuilder: (_, int index) {
                    if (index == classes.length)
                      // Build last update string.
                      return _buildLastUpdateString(context);
                    else
                      // Build class card.
                      return _ClassCard(classes[index]);
                  }),
            );
}

class _ClassCard extends StatelessWidget {
  // Colors from monday to friday.
  static final List<Color> dayColor = [
    Colors.pink[200],
    Colors.orange[300],
    Colors.green[200],
    Colors.blue[200],
    Colors.purple[300],
  ];

  // Single class object.
  final Lesson theClass;

  _ClassCard(this.theClass);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  MainLocalizations.of(context).get(
                          "Weekdays/" + (theClass.dayOfWeek + 1).toString()) +
                      " " +
                      theClass.startTimeOfDay.format(context) +
                      " - " +
                      theClass.endTimeOfDay.format(context) +
                      " " +
                      theClass.classroom,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              color: dayColor[theClass.dayOfWeek],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      theClass.courseName,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              theClass.courseCode +
                                  " " +
                                  theClass.weeks +
                                  "\n" +
                                  theClass.lecturer,
                            ),
                          ],
                        ),
                      ),
//                      SignInButton(theClass),
                    ],
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
