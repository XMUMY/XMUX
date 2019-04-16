library common.period_of_date;

class PeriodOfDate {
  final DateTime start;
  final DateTime end;

  PeriodOfDate({this.start, this.end});

  String toJson() => '${start.toString()}-${end.toString()}';
}
