import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/empty_error_button.dart';
import 'package:xmux/components/empty_error_page.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/components/spannable_grid.dart';
import 'package:xmux/config.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/calendar/attendance.dart';
import 'package:xmux/mainapp/calendar/sign_in_button.dart';
import 'package:xmux/modules/algorithms/edit_distance.dart';
import 'package:xmux/modules/api/xmux_api.dart'
    show GetTimetableResp, TimetableClass;
import 'package:xmux/modules/attendance/attendance.dart';
import 'package:xmux/modules/common/translation_mapper.dart' show weekdays;
import 'package:xmux/redux/redux.dart';

part 'timetable_grid.dart';

class TimeTablePage extends StatelessWidget {
  final List<TimetableClass> timetable;
  final DateTime recentUpdate;

  TimeTablePage(GetTimetableResp resp)
      : this.timetable = (resp == null || resp.timetable == null)
            ? null
            : sortTimetable(resp.timetable),
        this.recentUpdate = resp?.recentUpdate?.toLocal();

  Future<Null> _handleUpdate() async {
    var action = UpdateTimetableAction();
    store.dispatch(action);
    await action.future;
  }

  /// Sort timetable according to the end of class and now.
  static List<TimetableClass> sortTimetable(List<TimetableClass> timetable) {
    var now = DateTime.now();
    var nowMin = now.weekday * 1440 + now.hour * 60 + now.minute;

    int _getLessonMin(TimetableClass l) =>
        l.day * 1440 + l.end.hour * 60 + l.end.minute;

    var before = <TimetableClass>[];
    var after = <TimetableClass>[];

    timetable.sort((a, b) => _getLessonMin(a) - _getLessonMin(b));
    for (var i in timetable)
      _getLessonMin(i) < nowMin ? before.add(i) : after.add(i);

    return after..addAll(before);
  }

  @override
  Widget build(BuildContext context) {
    if (timetable == null) return EmptyErrorButton(onRefresh: _handleUpdate);
    if (timetable.isEmpty) return EmptyErrorPage();

    if (MediaQuery.of(context).size.width >= 700)
      return TimeTableGrid(timetable);

    var languageCode = Localizations.localeOf(context).languageCode;
    var lastUpdate = Center(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          "${i18n('Calendar/LastUpdate', context)} "
          '${DateFormat.yMMMd(languageCode).format(recentUpdate)} '
          '${DateFormat.Hms(languageCode).format(recentUpdate)}',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );

    return RefreshIndicator(
      onRefresh: _handleUpdate,
      child: ListView.builder(
        itemCount: timetable.length + 1,
        itemBuilder: (_, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 250),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: index == timetable.length
                    ? lastUpdate
                    : LessonCard(timetable[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  /// Lesson information.
  final TimetableClass lesson;

  /// Whether the card is inside a TimetableGrid.
  final bool isInGrid;

  LessonCard(this.lesson, {this.isInGrid = false}) {
    // Ensure attendance API with current user.
    AttendanceApi(
      address: BackendApiConfig.attendanceAddress,
      uid: store.state.user.campusId,
    );
  }

  // Colors from monday to friday.
  static const List<Color> dayColor = [
    const Color(0xFFF48FB1),
    const Color(0xFFFFCC80),
    const Color(0xFFA5D6A7),
    const Color(0xFF90CAF9),
    const Color(0xFFE1BEE7),
  ];

  @override
  Widget build(BuildContext context) {
    var header = Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white10
            : LessonCard.dayColor[lesson.day - 1],
        borderRadius: BorderRadius.vertical(top: Radius.circular(7)),
      ),
      child: Center(
        child: Text(
          isInGrid
              ? '${lesson.cid} ${lesson.room}'
              : '${weekdays(context, lesson.day)} '
                  '${lesson.start.format(context)} - '
                  '${lesson.end.format(context)} '
                  '${lesson.room}',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );

    var body = ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Text(
          lesson.name,
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.start,
        ),
        Divider(height: 8, color: Colors.transparent),
        Row(
          children: <Widget>[
            Expanded(
              child: isInGrid
                  ? Text(lesson.lecturer)
                  : Text(
                      '${lesson.cid} \n'
                      '${lesson.lecturer}',
                    ),
            ),
            SignInButton(lesson),
          ],
        ),
      ],
    );

    return FloatingCard(
      onTap: () => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => LessonDialog(lesson),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          header,
          if (isInGrid) Expanded(child: body) else body,
        ],
      ),
    );
  }
}

class LessonDialog extends StatelessWidget {
  final TimetableClass lesson;

  const LessonDialog(this.lesson);

  int get lessonCredit {
    return store.state.acState.courses?.firstWhere(
        (c) => c.courseName.indexOf(lesson.name) != -1, orElse: () {
      var editDistances = store.state.acState.courses
          .map((c) => editDistance(c.courseName, lesson.name))
          .toList();
      return store.state.acState
          .courses[editDistances.indexOf(editDistances.reduce(min))];
    })?.credit;
  }

  @override
  Widget build(BuildContext context) {
    var title = Text(
      lesson.name,
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.center,
    );

    var info = Text(
      '${i18n('Calendar/ClassCard/Code', context)}: ${lesson.cid}\n'
      '${i18n('Calendar/ClassCard/Credit', context)}: $lessonCredit\n'
      '${i18n('Calendar/ClassCard/Time', context)}: ${weekdays(context, lesson.day)} '
      '${lesson.start.format(context)} - '
      '${lesson.end.format(context)}\n'
      '${i18n('Calendar/ClassCard/Room', context)}: ${lesson.room}\n'
      '${i18n('Calendar/ClassCard/Lecturer', context)}: ${lesson.lecturer.split(',').join(', ')}',
    );

    Widget history;
    var showHistory = AttendanceApi().available;
    if (showHistory)
      history = FutureBuilder<List<AttendanceRecord>>(
        future: AttendanceApi().getHistory(cid: lesson.cid),
        builder: (ctx, snap) {
          switch (snap.connectionState) {
            case ConnectionState.done:
              if (!snap.hasError)
                return ListView(
                  children: snap.data
                      .map((e) => Text(
                          '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(e.timestamp)} '
                          '${DateFormat.Hms(Localizations.localeOf(context).languageCode).format(e.timestamp)} '
                          '${AttendanceHistoryItem.parseMessage(context, e)}'))
                      .toList(),
                );
              else
                return Center(child: CircularProgressIndicator());
              break;
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      );

    return SizedBox(
      width: min(MediaQuery.of(context).size.width / 1.3, 350),
      child: SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        title: title,
        titlePadding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        children: <Widget>[
          info,
          if (showHistory) ...{
            Divider(),
            Text(S.of(context).Calendar_Attendance),
            history,
          }
        ],
      ),
    );
  }
}
