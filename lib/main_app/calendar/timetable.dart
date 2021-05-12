import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:device_calendar/device_calendar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/empty_error.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/components/spannable_grid.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/main_app/calendar/attendance.dart';
import 'package:xmux/main_app/calendar/sign_in_button.dart';
import 'package:xmux/modules/algorithms/edit_distance.dart';
import 'package:xmux/modules/attendance/attendance.dart';
import 'package:xmux/modules/rpc/clients/aaos.pb.dart';
import 'package:xmux/redux/redux.dart';

part 'timetable_grid.dart';

class TimeTablePage extends StatelessWidget {
  final List<Timetable_Class> _classes;
  final DateTime _lastUpdate;

  TimeTablePage(Timetable timetable)
      : _classes = sortTimetable(timetable.classes),
        _lastUpdate = timetable.lastUpdate.toDateTime().toLocal();

  Future<Null> _handleUpdate() async {
    var action = UpdateTimetableAction();
    store.dispatch(action);
    await action.future;
  }

  /// Sort timetable according to the end of class and now.
  static List<Timetable_Class> sortTimetable(List<Timetable_Class> timetable) {
    var now = DateTime.now();
    var nowMin = now.weekday * 1440 + now.hour * 60 + now.minute;

    int _getClassMin(Timetable_Class l) =>
        l.day * 1440 +
        l.end.toDateTime().toLocal().hour * 60 +
        l.end.toDateTime().toLocal().minute;

    var before = <Timetable_Class>[];
    var after = <Timetable_Class>[];

    timetable.sort((a, b) => _getClassMin(a) - _getClassMin(b));
    for (var i in timetable)
      _getClassMin(i) < nowMin ? before.add(i) : after.add(i);

    return after..addAll(before);
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 720)
      return TimeTableGrid(_classes);

    var languageCode = Localizations.localeOf(context).languageCode;
    var lastUpdateText = Center(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          "${LocaleKeys.Calendar_LastUpdate.tr()} "
          '${DateFormat.yMMMd(languageCode).format(_lastUpdate)} '
          '${DateFormat.Hms(languageCode).format(_lastUpdate)}',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );

    Widget body;
    if (_classes.isNotEmpty) {
      body = ListView.builder(
        itemCount: _classes.length + 1,
        itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
          position: index,
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: index == _classes.length
                  ? lastUpdateText
                  : ClassCard(_classes[index]),
            ),
          ),
        ),
      );
    } else {
      body = EmptyErrorList();
    }

    return RefreshIndicator(
      displacement: 40 + Scaffold.of(context).appBarMaxHeight,
      onRefresh: _handleUpdate,
      child: Scrollbar(child: body),
    );
  }
}

class ClassCard extends StatelessWidget {
  // Colors from monday to friday.
  static const List<Color> dayColor = [
    const Color(0xFFF48FB1),
    const Color(0xFFFFCC80),
    const Color(0xFFA5D6A7),
    const Color(0xFF90CAF9),
    const Color(0xFFE1BEE7),
    const Color(0xFFE1BFFF),
  ];

  /// Class information.
  final Timetable_Class _cls;

  /// Whether the card is inside a [TimetableGrid].
  final bool isInGrid;

  ClassCard(this._cls, {this.isInGrid = false});

  @override
  Widget build(BuildContext context) {
    var header = Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white10
            : ClassCard.dayColor[_cls.day - 1],
        borderRadius: BorderRadius.vertical(top: Radius.circular(7)),
      ),
      child: Center(
        child: Text(
          isInGrid
              ? '${_cls.cid} ${_cls.room}'
              : '${'General_Weekday${_cls.day}'.tr()} '
                  '${TimeOfDay.fromDateTime(_cls.begin.toDateTime().toLocal()).format(context)} - '
                  '${TimeOfDay.fromDateTime(_cls.end.toDateTime().toLocal()).format(context)} '
                  '${_cls.room}',
          style: Theme.of(context)
              .textTheme
              .headline6
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
          _cls.name,
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.start,
        ),
        Divider(height: 8, color: Colors.transparent),
        Row(
          children: <Widget>[
            Expanded(
              child: isInGrid
                  ? Text(_cls.lecturer)
                  : Text(
                      '${_cls.cid} \n'
                      '${_cls.lecturer}',
                    ),
            ),
            SignInButton(_cls),
          ],
        ),
      ],
    );

    return FloatingCard(
      onTap: () => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => _ClassDialog(_cls),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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

class _ClassDialog extends StatelessWidget {
  final Timetable_Class _cls;

  const _ClassDialog(this._cls);

  int get lessonCredit {
    return store.state.queryState.courses.courses
        ?.firstWhere((c) => c.name.indexOf(_cls.name) != -1, orElse: () {
      var editDistances = store.state.queryState.courses.courses
          .map((c) => editDistance(c.name, _cls.name))
          .toList();
      return store.state.queryState.courses
          .courses[editDistances.indexOf(editDistances.reduce(min))];
    })?.credit;
  }

  void _addToCalendar(BuildContext context) async {
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
    while (date.weekday != _cls.day) date = date.add(Duration(days: 1));

    var begin = DateTime(
      date.year,
      date.month,
      date.day,
      _cls.begin.toDateTime().toLocal().hour,
      _cls.begin.toDateTime().toLocal().minute,
    );
    var end = DateTime(
      date.year,
      date.month,
      date.day,
      _cls.end.toDateTime().toLocal().hour,
      _cls.end.toDateTime().toLocal().minute,
    );
    await plugin.createOrUpdateEvent(Event(
      id,
      title: _cls.name,
      description: _cls.room,
      start: begin,
      end: end,
      recurrenceRule: RecurrenceRule(
        RecurrenceFrequency.Weekly,
        endDate: _cls.end.toDateTime(),
      ),
    ));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var title = Text(
      _cls.name,
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.center,
    );

    var info = Text(
      '${LocaleKeys.Calendar_ClassCardCode.tr()}: ${_cls.cid}\n'
      '${LocaleKeys.Calendar_ClassCardCredit.tr()}: $lessonCredit\n'
      '${LocaleKeys.Calendar_ClassCardTime.tr()}: ${'General_Weekday${_cls.day}'.tr()} '
      '${TimeOfDay.fromDateTime(_cls.begin.toDateTime().toLocal()).format(context)} - '
      '${TimeOfDay.fromDateTime(_cls.end.toDateTime().toLocal()).format(context)}\n'
      '${LocaleKeys.Calendar_ClassCardRoom.tr()}: ${_cls.room}\n'
      '${LocaleKeys.Calendar_ClassCardLecturer.tr()}: ${_cls.lecturer.split(',').join(', ')}',
    );

    Widget history;
    var showHistory = AttendanceApi().available;
    if (showHistory)
      history = FutureBuilder<List<AttendanceRecord>>(
        future: AttendanceApi().getHistory(cid: _cls.cid),
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
              return Center(child: CircularProgressIndicator());
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
              onPressed: () => _addToCalendar(context),
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
