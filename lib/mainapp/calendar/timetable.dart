import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/calendar/sign_in_button.dart';
import 'package:xmux/modules/common/blur_box.dart';
import 'package:xmux/modules/error_widgets/error_widgets.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';

class TimeTablePage extends StatelessWidget {
  final List<Lesson> classes;

  TimeTablePage(List<Lesson> timetable)
      : this.classes = timetable == null ? null : _sortTimetable(timetable);

  Widget _buildLastUpdateString(BuildContext context) => Center(
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: Text(
            i18n('Calendar/LastUpdate', context) +
                DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
                    .format(mainAppStore.state.acState.timestamp) +
                ' ' +
                DateFormat.Hms(Localizations.localeOf(context).languageCode)
                    .format(mainAppStore.state.acState.timestamp),
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      );

  Future<Null> _handleUpdate(BuildContext context) async {
    var action = UpdateAcAction(context: context);
    mainAppStore.dispatch(action);
    await action.listener;
  }

  static List<Lesson> _sortTimetable(List<Lesson> timetable) {
    var now = DateTime.now();
    var nowMin = now.weekday * 1440 + now.hour * 60 + now.minute;

    int _getLessonMin(Lesson l) =>
        (l.dayOfWeek + 1) * 1440 +
        l.endTimeOfDay.hour * 60 +
        l.endTimeOfDay.minute;

    var before = <Lesson>[];
    var after = <Lesson>[];

    for (var i in timetable)
      _getLessonMin(i) < nowMin ? before.add(i) : after.add(i);

    return after..addAll(before);
  }

  @override
  Widget build(BuildContext context) => classes == null
      ? ErrorWidgets.emptyErrorButton(onRefresh: () => _handleUpdate(context))
      : classes.isEmpty
          ? ErrorWidgets.emptyErrorPage
          : RefreshIndicator(
              onRefresh: () => _handleUpdate(context),
              child: ListView.builder(
                itemCount: classes.length + 1,
                itemBuilder: (_, int index) => index == classes.length
                    ? _buildLastUpdateString(context)
                    : _ClassCard(classes[index]),
              ),
            );
}

class _ClassCard extends StatefulWidget {
  // Colors from monday to friday.
  static const List<Color> dayColor = [
    const Color(0xFFF48FB1),
    const Color(0xFFFFCC80),
    const Color(0xFFA5D6A7),
    const Color(0xFF90CAF9),
    const Color(0xFFE1BEE7),
  ];

  // Single class object.
  final Lesson lesson;

  _ClassCard(this.lesson);

  @override
  _ClassCardState createState() => _ClassCardState();
}

class _ClassCardState extends State<_ClassCard> {
  double _elevation = 1.0;

  void _showClassDetail() => showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (context, animation, _) {
        return Center(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(widget.lesson.courseName),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, _, child) {
        return GaussianBlurBox(
          sigma: animation.value * 3,
          child: FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.elasticOut,
                  reverseCurve: Curves.fastOutSlowIn)),
              child: child,
            ),
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showClassDetail,
      onTapDown: (_) => setState(() => _elevation = 3.0),
      onTapUp: (_) => setState(() => _elevation = 1.0),
      onTapCancel: () => setState(() => _elevation = 1.0),
      child: Card(
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        elevation: _elevation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: _ClassCard.dayColor[widget.lesson.dayOfWeek],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(7.0))),
              child: Center(
                child: Text(
                  '${i18n('Weekdays/${widget.lesson.dayOfWeek + 1}', context)} '
                      '${widget.lesson.startTimeOfDay.format(context)} - '
                      '${widget.lesson.endTimeOfDay.format(context)} '
                      '${widget.lesson.classroom}',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      widget.lesson.courseName,
                      style: Theme.of(context).textTheme.subhead,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${widget.lesson.courseCode} '
                                  'Week ${widget.lesson.weeks}\n'
                                  '${widget.lesson.lecturer}',
                            ),
                          ],
                        ),
                      ),
                      SignInButton(widget.lesson),
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
