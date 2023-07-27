import 'package:device_calendar/device_calendar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmus_client/generated/aaos.pb.dart';

import '../../component/empty_error.dart';
import '../../component/floating_card.dart';
import '../../component/spannable_grid.dart';
import '../../global.dart';
import '../../redux/action/action.dart';
import '../../redux/state/state.dart';
import '../../util/platform.dart';
import '../../util/screen.dart';
import '../../util/tab.dart';

class TimetablePage extends StatelessWidget implements TabEntry {
  const TimetablePage({Key? key}) : super(key: key);

  @override
  String get path => 'Timetable';

  @override
  String get label => LocaleKeys.Calendar_Classes.tr();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Timetable>(
      distinct: true,
      converter: (s) => s.state.queries.timetable,
      builder: (context, timetable) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: context.isBetween(Breakpoint.extraSmall)
              ? ListTimetable(timetable: timetable)
              : GridTimetable(timetable: timetable),
        );
      },
    );
  }
}

class ListTimetable extends StatelessWidget {
  final Timetable timetable;
  final List<Timetable_Class> _classes;
  final DateTime _lastUpdate;

  ListTimetable({
    Key? key,
    required this.timetable,
  })  : _classes = sortTimetable(timetable.classes),
        _lastUpdate = timetable.lastUpdate.toDateTime().toLocal(),
        super(key: key);

  /// Sort timetable according to the end of class and now.
  static List<Timetable_Class> sortTimetable(List<Timetable_Class> timetable) {
    final now = DateTime.now();
    final currentMinute = now.weekday * 1440 + now.hour * 60 + now.minute;

    int getClassMinute(Timetable_Class c) =>
        c.day * 1440 +
        c.end.toDateTime().toLocal().hour * 60 +
        c.end.toDateTime().toLocal().minute;

    var before = <Timetable_Class>[];
    var after = <Timetable_Class>[];

    timetable.sort((a, b) => getClassMinute(a) - getClassMinute(b));
    for (var i in timetable) {
      getClassMinute(i) < currentMinute ? before.add(i) : after.add(i);
    }

    return after..addAll(before);
  }

  Future<void> _handleUpdate() async {
    var action = UpdateTimetableAction();
    store.dispatch(action);
    await action.future;
  }

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    final lastUpdateText = Center(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          '${DateFormat.yMMMd(languageCode).format(_lastUpdate)} '
          '${DateFormat.Hms(languageCode).format(_lastUpdate)}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );

    Widget body;
    if (_classes.isNotEmpty) {
      body = ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: context.padBody, vertical: 4),
        itemCount: _classes.length + 1,
        itemBuilder: (_, index) => index == _classes.length
            ? lastUpdateText
            : _Card(lesson: _classes[index]),
      );
    } else {
      body = const EmptyErrorList();
    }

    return RefreshIndicator(
      onRefresh: _handleUpdate,
      child: body,
    );
  }
}

class GridTimetable extends StatelessWidget {
  final Timetable timetable;

  const GridTimetable({
    Key? key,
    required this.timetable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final classes = timetable.classes;
    final periods = Iterable<int>.generate(13)
        .map((i) => SpannableGridCell(
              id: i,
              column: 1,
              row: i + 2,
              columnFlex: 1,
              child: Column(
                children: <Widget>[
                  const Divider(height: 1),
                  Expanded(
                    child: Center(
                      child: Text(
                        '${i + 8} - ${i + 9}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  const Divider(height: 1),
                ],
              ),
            ))
        .toList();
    final weekdayCells = Iterable<int>.generate(6)
        .map((i) => SpannableGridCell(
            id: i.toString(),
            column: i + 2,
            row: 1,
            child: Row(
              children: [
                const VerticalDivider(width: 1),
                Expanded(
                  child: Center(
                    child: Text(
                      'Weekdays.${i + 1}'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                const VerticalDivider(width: 1),
              ],
            )))
        .toList();
    final timetableCells = classes
        .map((c) => SpannableGridCell(
              id: c.hashCode,
              column: c.day + 1,
              row: c.begin.toDateTime().toLocal().hour - 6,
              rowSpan: c.end.toDateTime().toLocal().hour -
                  c.begin.toDateTime().toLocal().hour,
              columnFlex: 2,
              rowFlex: 2,
              child: _Card(lesson: c, isInGrid: true),
            ))
        .toList();

    return SingleChildScrollView(
      child: SizedBox(
        height: Breakpoint.large.minWidth,
        child: SpannableGrid(
          rows: 14,
          columns: 7,
          spacing: 1,
          cells: [
            ...timetableCells,
            ...weekdayCells,
            ...periods,
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final Timetable_Class lesson;
  final bool isInGrid;

  const _Card({
    Key? key,
    required this.lesson,
    this.isInGrid = false,
  }) : super(key: key);

  // Colors from monday to sunday.
  static const List<Color> colors = [
    Color(0xFFF48FB1),
    Color(0xFFFFCC80),
    Color(0xFFA5D6A7),
    Color(0xFF90CAF9),
    Color(0xFFCE93D8),
    Color(0xFFC5CAE9),
    Color(0xFFC5CAE9),
  ];

  @override
  Widget build(BuildContext context) {
    final header = Container(
      padding: const EdgeInsets.all(10),
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.white10
          : colors[lesson.day - 1],
      child: Center(
        child: Text(
          '${!isInGrid ? 'Weekdays.${lesson.day}'.tr() : ''} '
          '${TimeOfDay.fromDateTime(lesson.begin.toDateTime().toLocal()).format(context)} - '
          '${TimeOfDay.fromDateTime(lesson.end.toDateTime().toLocal()).format(context)} '
          '${lesson.room}',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );

    final body = ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: <Widget>[
        Text(
          lesson.name,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.start,
        ),
        const Divider(height: 8, color: Colors.transparent),
        Text(
          '${lesson.cid} \n'
          '${lesson.lecturer}',
        ),
      ],
    );

    return FloatingCard(
      onTap: () => showDialog(
        context: context,
        builder: (context) => _Dialog(lesson),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4),
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

class _Dialog extends StatelessWidget {
  final Timetable_Class lesson;

  const _Dialog(this.lesson);

  // int get lessonCredit {
  //   return store.state.queryState.courses.courses
  //       ?.firstWhere((c) => c.name.indexOf(lesson.name) != -1, orElse: () {
  //     var editDistances = store.state.queryState.courses.courses
  //         .map((c) => editDistance(c.name, lesson.name))
  //         .toList();
  //     return store.state.queryState.courses
  //         .courses[editDistances.indexOf(editDistances.reduce(min))];
  //   })?.credit;
  // }

  void _addToCalendar(BuildContext context) async {
    final plugin = DeviceCalendarPlugin();
    if (!(await plugin.requestPermissions()).isSuccess) return;

    final calendars = await plugin.retrieveCalendars();
    final calendarsData = calendars.data;
    if (calendarsData == null) return;

    final id = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        title: Text(LocaleKeys.Calendar_CalendarCardAddToSystem.tr()),
        contentPadding: const EdgeInsets.all(8),
        children: <Widget>[
          for (var c in calendarsData)
            ListTile(
              title: Text(c.name ?? ''),
              onTap: () => Navigator.of(context).pop(c.id),
            ),
        ],
      ),
    );
    if (id == null || id.isEmpty) return;

    var date = DateTime.now();
    // Find next weekday matched the lesson.
    while (date.weekday != lesson.day) {
      date = date.add(const Duration(days: 1));
    }

    var begin = TZDateTime(
      getLocation('Asia/Kuala_Lumpur'),
      date.year,
      date.month,
      date.day,
      lesson.begin.toDateTime().toLocal().hour,
      lesson.begin.toDateTime().toLocal().minute,
    );
    var end = TZDateTime(
      getLocation('Asia/Kuala_Lumpur'),
      date.year,
      date.month,
      date.day,
      lesson.end.toDateTime().toLocal().hour,
      lesson.end.toDateTime().toLocal().minute,
    );

    // TODO: Avoid add when class is ended.
    await plugin.createOrUpdateEvent(Event(
      id,
      title: lesson.name,
      description: lesson.room,
      start: begin,
      end: end,
      recurrenceRule: RecurrenceRule(
        RecurrenceFrequency.Weekly,
        endDate: lesson.end.toDateTime(),
      ),
      availability: Availability.Free,
    ));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var title = Text(
      lesson.name,
      style: Theme.of(context).textTheme.titleLarge,
      textAlign: TextAlign.center,
    );

    var info = Text(
      '${LocaleKeys.Calendar_CalendarCardCode.tr()}: ${lesson.cid}\n'
      // '${LocaleKeys.Calendar_ClassCardCredit.tr()}: $lessonCredit\n'
      '${LocaleKeys.Calendar_CalendarCardTime.tr()}: ${'Weekdays.${lesson.day}'.tr()} '
      '${TimeOfDay.fromDateTime(lesson.begin.toDateTime().toLocal()).format(context)} - '
      '${TimeOfDay.fromDateTime(lesson.end.toDateTime().toLocal()).format(context)}\n'
      '${LocaleKeys.Calendar_CalendarCardRoom.tr()}: ${lesson.room}\n'
      '${LocaleKeys.Calendar_CalendarCardLecturer.tr()}: ${lesson.lecturer.split(',').join(', ')}',
    );

    // Widget history;
    // var showHistory = AttendanceApi().available;
    // if (showHistory) {
    //   history = FutureBuilder<List<AttendanceRecord>>(
    //     future: AttendanceApi().getHistory(cid: lesson.cid),
    //     builder: (ctx, snap) {
    //       switch (snap.connectionState) {
    //         case ConnectionState.done:
    //           if (!snap.hasError) {
    //             return ListView(
    //               children: snap.data
    //                   .map((e) => Text(
    //                       '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(e.timestamp)} '
    //                       '${DateFormat.Hms(Localizations.localeOf(context).languageCode).format(e.timestamp)} '
    //                       '${AttendanceHistoryItem.parseMessage(context, e)}'))
    //                   .toList(),
    //             );
    //           }
    //           return Center(child: CircularProgressIndicator());
    //         default:
    //           return Center(child: CircularProgressIndicator());
    //       }
    //     },
    //   );
    // }

    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      title: title,
      titlePadding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      contentPadding: const EdgeInsets.all(12),
      children: <Widget>[
        info,
        if (isMobile)
          TextButton(
            onPressed: () => _addToCalendar(context),
            child: Text(LocaleKeys.Calendar_CalendarCardAddToSystem.tr()),
          ),
        // if (showHistory) ...{
        //   Divider(),
        //   Text(LocaleKeys.Calendar_Attendance.tr()),
        //   history,
        // }
      ],
    );
  }
}
