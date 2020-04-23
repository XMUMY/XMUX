part of 'models_v2.dart';

/// Response data for /ac
@JsonSerializable(createToJson: false)
class AcData {
  final List<Exam> exams;

  AcData({this.exams});

  static AcData fromJson(Map<String, dynamic> json) => _$AcDataFromJson(json);
}

@JsonSerializable()
class Exam {
  @JsonKey(name: 'Exam (Academic Session)')
  final String session;
  @JsonKey(name: 'Exam Date', fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime date;
  @JsonKey(name: 'Exam Time', fromJson: DurationOfDay.parse)
  final DurationOfDay durationOfDay;
  @JsonKey(name: 'Exam Venue')
  final String venue;
  @JsonKey(name: 'Course Name')
  final String courseName;

  /// Type of exam: 'Open Book' / 'Closed Book'
  @JsonKey(name: 'Exam Type')
  final String type;

  /// Status of current exam: 'Allowed' / ''
  @JsonKey(name: 'Status')
  final String status;

  Exam(this.session, this.date, this.durationOfDay, this.venue, this.courseName,
      this.type, this.status);

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  Map<String, dynamic> toJson() => _$ExamToJson(this);

  static DateTime _dateFromJson(String json) => DateTime.parse(json);

  static String _dateToJson(DateTime date) => date.toString();
}
