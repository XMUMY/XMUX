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
              columnFlex: 1,
              child: Column(
                children: <Widget>[
                  Divider(height: 1),
                  Expanded(
                    child: Center(
                      child: Text(
                        '${i + 8} - ${i + 9}',
                        style: Theme.of(context).textTheme.subtitle1,
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
              id: i.toString().hashCode,
              column: i + 2,
              row: 1,
              child: Center(
                child: Text(
                  'General_Weekday${i + 1}'.tr(),
                  style: Theme.of(context).textTheme.subtitle1,
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
              columnFlex: 2,
              rowFlex: 3,
              child: LessonCard(
                c,
                isInGrid: true,
              ),
            ))
        .toList();

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: Scaffold.of(context).appBarMaxHeight),
      child: SizedBox(
        height: 1111,
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
      ),
    );
  }
}
