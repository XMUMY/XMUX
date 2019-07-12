import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/blur_box.dart';
import 'package:xmux/components/empty_error_button.dart';
import 'package:xmux/components/empty_error_page.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/calendar/sign_in_button.dart';
import 'package:xmux/modules/algorithms/algorithms.dart' show editDistance;
import 'package:xmux/modules/attendance/attendance.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';

class TimeTablePage extends StatelessWidget {
  final List<Lesson> classes;

  TimeTablePage(List<Lesson> timetable)
      : this.classes = timetable == null ? null : sortTimetable(timetable);

  Widget _buildLastUpdateString(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Text(
          "${i18n('Calendar/LastUpdate', context)} "
          '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(store.state.acState.timestamp)} '
          '${DateFormat.Hms(Localizations.localeOf(context).languageCode).format(store.state.acState.timestamp)}',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }

  Future<Null> _handleUpdate(BuildContext context) async {
    var action = UpdateAcAction(context: context);
    store.dispatch(action);
    await action.listener;
  }

  /// Sort timetable according to the end of class and now.
  static List<Lesson> sortTimetable(List<Lesson> timetable) {
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
      ? EmptyErrorButton(onRefresh: () => _handleUpdate(context))
      : classes.isEmpty
          ? EmptyErrorPage()
          : RefreshIndicator(
              onRefresh: () => _handleUpdate(context),
              child: ListView.builder(
                itemCount: classes.length + 1,
                itemBuilder: (_, int index) => index == classes.length
                    ? _buildLastUpdateString(context)
                    : LessonCard(classes[index]),
              ),
            );
}

class LessonCard extends StatefulWidget {
  // Colors from monday to friday.
  static const List<Color> dayColor = [
    const Color(0xFFF48FB1),
    const Color(0xFFFFCC80),
    const Color(0xFFA5D6A7),
    const Color(0xFF90CAF9),
    const Color(0xFFE1BEE7),
  ];

  /// Lesson information.
  final Lesson lesson;

  LessonCard(this.lesson);

  @override
  _LessonCardState createState() => _LessonCardState();

  int get lessonCredit {
    return store.state.acState.courses?.firstWhere(
        (c) => c.courseName.indexOf(lesson.courseName) != -1, orElse: () {
      var editDistances = store.state.acState.courses
          .map((c) => editDistance(c.courseName, lesson.courseName))
          .toList();
      return store.state.acState
          .courses[editDistances.indexOf(editDistances.reduce(min))];
    })?.credit;
  }
}

class _LessonCardState extends State<LessonCard> {
  double _elevation = 1.0;

  void _showClassDetail() {
    // Prevent pop twice.
    var isPopping = false;
    // TODO: Optimize performance for GaussianBlur.
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: Duration(milliseconds: 400),
      barrierColor: Colors.black12.withOpacity(0.2),
      pageBuilder: (context, _, __) => _buildDialogWidgets(),
      transitionBuilder: (context, animation, _, child) {
        return GestureDetector(
          onTap: () {
            if (!isPopping) Navigator.of(context).pop();
            isPopping = true;
          },
          child: GaussianBlurBox(
            sigma: (animation.value * 30).round() / 10,
            centered: true,
            child: FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween<double>(
                  begin: 0.7,
                  end: 1.0,
                ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.elasticOut,
                    reverseCurve: Curves.fastOutSlowIn)),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDialogWidgets() {
    var list = [
      Text(
          '${i18n('Calendar/ClassCard/Code', context)}: ${widget.lesson.courseCode}\n'
          '${i18n('Calendar/ClassCard/Credit', context)}: ${widget.lessonCredit}\n'
          '${i18n('Calendar/ClassCard/Weeks', context)}: ${widget.lesson.weeks}\n'
          '${i18n('Calendar/ClassCard/Time', context)}: ${i18n('Weekdays/${widget.lesson.dayOfWeek + 1}', context)} '
          '${widget.lesson.startTimeOfDay.format(context)} - '
          '${widget.lesson.endTimeOfDay.format(context)}\n'
          '${i18n('Calendar/ClassCard/Room', context)}: ${widget.lesson.classroom}\n'
          '${i18n('Calendar/ClassCard/Lecturer', context)}: ${widget.lesson.lecturer}'),
      Divider(),
      Text('${i18n('Calendar/SignIn/Status', context)}'),
      FutureBuilder<List<AttendanceRecord>>(
        future: AttendanceApi(BackendApiConfig.signInAddress).getHistory(
            store.state.authState.campusID,
            cid: widget.lesson.courseCode),
        builder: (ctx, snap) {
          switch (snap.connectionState) {
            case ConnectionState.done:
              if (!snap.hasError)
                return ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: snap.data
                      .map((e) => Text(
                          '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(e.timestamp)} '
                          '${DateFormat.Hms(Localizations.localeOf(context).languageCode).format(e.timestamp)} '
                          '${e.message}'))
                      .toList(),
                );
              else
                return Center(child: CircularProgressIndicator());
              break;
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 8.0),
            width: MediaQuery.of(context).size.width / 1.3,
            child: Text(
              widget.lesson.courseName,
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: min(MediaQuery.of(context).size.height / 2, 350.0),
            width: MediaQuery.of(context).size.width / 1.3,
            child: ListView(
              padding: EdgeInsets.all(15.0),
              children: list,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showClassDetail,
      onTapDown: (_) => setState(() => _elevation = 4.0),
      onTapUp: (_) => setState(() => _elevation = 1.0),
      onTapCancel: () => setState(() => _elevation = 1.0),
      child: Card(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        elevation: _elevation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white10
                      : LessonCard.dayColor[widget.lesson.dayOfWeek],
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
                              '${widget.lesson.courseCode}  '
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
