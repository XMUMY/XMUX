import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:xmus_client/generated/aaos.pb.dart';

import '../../component/empty_error.dart';
import '../../component/floating_card.dart';
import '../../component/spannable_grid.dart';
import '../../redux/state/state.dart';
import '../../util/screen.dart';

class TimetablePage extends StatelessWidget {
  const TimetablePage({Key? key}) : super(key: key);

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

    int _getClassMinute(Timetable_Class c) =>
        c.day * 1440 +
        c.end.toDateTime().toLocal().hour * 60 +
        c.end.toDateTime().toLocal().minute;

    var before = <Timetable_Class>[];
    var after = <Timetable_Class>[];

    timetable.sort((a, b) => _getClassMinute(a) - _getClassMinute(b));
    for (var i in timetable) {
      _getClassMinute(i) < currentMinute ? before.add(i) : after.add(i);
    }

    return after..addAll(before);
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
          style: Theme.of(context).textTheme.caption,
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
      onRefresh: () async {},
      child: Scrollbar(child: body),
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
                        style: Theme.of(context).textTheme.subtitle1,
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
                      'Weekday ${i + 1}',
                      style: Theme.of(context).textTheme.subtitle1,
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
          // TODO
          '${!isInGrid ? 'WEEKDAY ${lesson.day}' : ''} '
          '${TimeOfDay.fromDateTime(lesson.begin.toDateTime().toLocal()).format(context)} - '
          '${TimeOfDay.fromDateTime(lesson.end.toDateTime().toLocal()).format(context)} '
          '${lesson.room}',
          style: context.isBetween(Breakpoint.small)
              ? Theme.of(context).textTheme.subtitle1
              : Theme.of(context).textTheme.headline6,
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
          style: Theme.of(context).textTheme.subtitle1,
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
      onTap: () {},
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
