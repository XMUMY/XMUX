part of 'timetable.dart';

class TimeTableGrid extends StatelessWidget {
  final List<TimetableClass> timetable;

  const TimeTableGrid(this.timetable);

  @override
  Widget build(BuildContext context) {
    var periods = Iterable<int>.generate(13)
        .map((i) => SpannableGridCell(
              id: i,
              column: 1,
              row: i + 2,
              child: Column(
                children: <Widget>[
                  Divider(height: 1),
                  Expanded(
                    child: Center(
                      child: Text(
                        '${i + 8} - ${i + 9}',
                      ),
                    ),
                  ),
                  Divider(height: 1),
                ],
              ),
            ))
        .toList();
    var weekdayCells = Iterable<int>.generate(5)
        .map((i) => SpannableGridCell(
              id: weekdays(context, i + 1),
              column: i + 2,
              row: 1,
              child: Center(
                child: Text(
                  weekdays(context, i + 1),
                ),
              ),
            ))
        .toList();
    var timetableCells = timetable
        .map((c) => SpannableGridCell(
              id: c.hashCode,
              column: c.day + 1,
              row: c.start.hour - 6,
              rowSpan: c.end.hour - c.start.hour,
              rowFlex: 2,
              child: DecoratedBox(
                decoration:
                    BoxDecoration(color: LessonCard.dayColor[c.day - 1]),
                child: Center(
                  child: Text(
                    c.name,
                  ),
                ),
              ),
            ))
        .toList();

    return SingleChildScrollView(
      child: SpannableGrid(
        rows: 14,
        columns: 6,
        spacing: 1,
        cells: [
          ...timetableCells,
          ...weekdayCells,
          ...periods,
        ],
      ),
    );
  }
}
