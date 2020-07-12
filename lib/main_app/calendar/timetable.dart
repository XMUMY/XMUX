import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:device_calendar/device_calendar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/empty_error_page.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/components/page_routes.dart';
import 'package:xmux/components/spannable_grid.dart';
import 'package:xmux/config.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/main_app/calendar/attendance.dart';
import 'package:xmux/main_app/calendar/sign_in_button.dart';
import 'package:xmux/modules/algorithms/edit_distance.dart';
import 'package:xmux/modules/api/xmux_api.dart' show Timetable, TimetableClass;
import 'package:xmux/modules/attendance/attendance.dart';
import 'package:xmux/redux/redux.dart';

part 'timetable_grid.dart';

class TimeTablePage extends StatelessWidget {
  final List<TimetableClass> timetable;
  final DateTime recentUpdate;

  TimeTablePage(Timetable resp)
      : this.timetable = sortTimetable(resp?.timetable ?? List()),
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
    if (MediaQuery.of(context).size.width >= 700)
      return TimeTableGrid(timetable);

    var languageCode = Localizations.localeOf(context).languageCode;
    var lastUpdate = Center(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          "${LocaleKeys.Calendar_LastUpdate.tr()} "
          '${DateFormat.yMMMd(languageCode).format(recentUpdate)} '
          '${DateFormat.Hms(languageCode).format(recentUpdate)}',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );

    Widget body = ListView.builder(
      itemCount: timetable.isEmpty ? 0 : timetable.length + 1,
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
    );

    body = Scrollbar(child: body);

    if (timetable.isEmpty)
      body = Stack(children: [
        body,
        EmptyErrorPage(),
      ]);

    return RefreshIndicator(
      displacement: 40 + Scaffold.of(context).appBarMaxHeight,
      onRefresh: _handleUpdate,
      child: body,
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
      padding: const EdgeInsets.all(10),
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
              : '${'General_Weekday${lesson.day}'.tr()} '
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
      onTap: () => showBlurDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => LessonDialog(lesson),
      ),
      margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
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
    return store.state.queryState.courses
        ?.firstWhere((c) => c.name.indexOf(lesson.name) != -1, orElse: () {
      var editDistances = store.state.queryState.courses
          .map((c) => editDistance(c.name, lesson.name))
          .toList();
      return store.state.queryState
          .courses[editDistances.indexOf(editDistances.reduce(min))];
    })?.credit;
  }

  void addToCalendar(BuildContext context) async {
    var plugin = DeviceCalendarPlugin();
    if (!(await plugin.requestPermissions()).isSuccess) return;
    var calendars = await plugin.retrieveCalendars();

    var id = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        title: Text(LocaleKeys.Calendar_AddToCalendar.tr()),
        children: <Widget>[
          for (var c in calendars.data)
            ListTile(
              title: Text(c.name),
              onTap: () => Navigator.of(context).pop(c.id),
            ),
        ],
      ),
    );
    if (id == null || id.isEmpty) return;

    var date = DateTime.now();
    // Find next weekday matched the lesson.
    while (date.weekday != lesson.day) date = date.add(Duration(days: 1));

    var start = DateTime(
      date.year,
      date.month,
      date.day,
      lesson.start.hour,
      lesson.start.minute,
    );
    var end = DateTime(
      date.year,
      date.month,
      date.day,
      lesson.end.hour,
      lesson.end.minute,
    );
    await plugin.createOrUpdateEvent(Event(
      id,
      title: lesson.name,
      start: start,
      end: end,
      recurrenceRule: RecurrenceRule(
        RecurrenceFrequency.Weekly,
        endDate: lesson.endDay,
      ),
    ));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var title = Text(
      lesson.name,
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.center,
    );

    var info = Text(
      '${LocaleKeys.Calendar_ClassCardCode.tr()}: ${lesson.cid}\n'
      '${LocaleKeys.Calendar_ClassCardCredit.tr()}: $lessonCredit\n'
      '${LocaleKeys.Calendar_ClassCardTime.tr()}: ${'General_Weekday${lesson.day}'.tr()} '
      '${lesson.start.format(context)} - '
      '${lesson.end.format(context)}\n'
      '${LocaleKeys.Calendar_ClassCardRoom.tr()}: ${lesson.room}\n'
      '${LocaleKeys.Calendar_ClassCardLecturer.tr()}: ${lesson.lecturer.split(',').join(', ')}',
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
      width: min(MediaQuery.of(context).size.width, 600),
      child: SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        title: title,
        titlePadding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        children: <Widget>[
          info,
          if (P.isMobile)
            RaisedButton(
              onPressed: () => addToCalendar(context),
              child: Text(LocaleKeys.Calendar_AddToCalendar.tr()),
            ),
          if (showHistory) ...{
            Divider(),
            Text(LocaleKeys.Calendar_Attendance.tr()),
            history,
          }
        ],
      ),
    );
  }
}
