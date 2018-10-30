part of 'models_v2.dart';

/// Response data for /ac
@JsonSerializable(createToJson: false)
class AcData {
  final List<Lesson> timetable;
  final List<Exam> exams;
  final List<SessionExamResult> examResult;
  final List<Course> courses;

  AcData({this.timetable, this.exams, this.examResult, this.courses});

  static AcData fromJson(Map<String, dynamic> json) => _$AcDataFromJson(json);
}

@JsonSerializable()
class Lesson {
  final String courseCode;
  final String courseName;
  final String lecturer;
  @JsonKey(name: "classRoom")
  final String classroom;
  @JsonKey(fromJson: _weeksFromJson, toJson: _weeksToJson)
  final String weeks;

  /// Day of week. 0-6 => Monday-Sunday
  final int dayOfWeek;
  @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
  final TimeOfDay startTimeOfDay;
  @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
  final TimeOfDay endTimeOfDay;

  Lesson(this.courseCode, this.courseName, this.lecturer, this.classroom,
      this.weeks, this.dayOfWeek, this.startTimeOfDay, this.endTimeOfDay);

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  Map<String, dynamic> toJson() => _$LessonToJson(this);

  /// Parse weeks from json.
  static String _weeksFromJson(String weeks) =>
      weeks.substring(6, weeks.length - 1);

  /// Export weeks to json.
  static String _weeksToJson(String weeks) => "(Week " + weeks + ")";

  /// Parse TimeOfDay from json.
  static TimeOfDay _timeOfDayFromJson(String timeOfDay) => TimeOfDay(
        hour: int.parse(timeOfDay.split(":")[0]),
        minute: int.parse(timeOfDay.split(":")[1]),
      );

  /// Export TimeOfDay to json.
  static String _timeOfDayToJson(TimeOfDay timeOfDay) =>
      timeOfDay.hour.toString() + ":" + timeOfDay.minute.toString();
}

@JsonSerializable()
class Exam {
  @JsonKey(name: "Exam (Academic Session)")
  final String session;
  @JsonKey(name: "Exam Date", fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime date;
  @JsonKey(
      name: "Exam Time",
      fromJson: DurationOfDay.parse,
      toJson: DurationOfDay.toJson)
  final DurationOfDay durationOfDay;
  @JsonKey(name: "Exam Venue")
  final String venue;
  @JsonKey(name: "Course Name")
  final String courseName;

  /// Type of exam: "Open Book" / "Closed Book"
  @JsonKey(name: "Exam Type")
  final String type;

  /// Status of current exam: "Allowed" / ""
  @JsonKey(name: "Status")
  final String status;

  Exam(this.session, this.date, this.durationOfDay, this.venue, this.courseName,
      this.type, this.status);

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  Map<String, dynamic> toJson() => _$ExamToJson(this);

  static DateTime _dateFromJson(String json) => DateTime.parse(json);

  static String _dateToJson(DateTime date) => date.toString();
}

@JsonSerializable()
class SessionExamResult {
  final String academicSession;
  final List<CourseExamResult> result;
  @JsonKey(name: 'GPA')
  final String gpa;
  @JsonKey(name: 'CGPA')
  final String cGpa;

  SessionExamResult(this.academicSession, this.result, this.gpa, this.cGpa);

  factory SessionExamResult.fromJson(Map<String, dynamic> json) =>
      _$SessionExamResultFromJson(json);

  Map<String, dynamic> toJson() => _$SessionExamResultToJson(this);
}

@JsonSerializable()
class CourseExamResult {
  final String courseCode;
  final String courseName;
  final int credit;
  final String grade;
  final double gradePoint;
  final String registrationType;

  CourseExamResult(this.courseCode, this.courseName, this.credit, this.grade,
      this.gradePoint, this.registrationType);

  factory CourseExamResult.fromJson(Map<String, dynamic> json) =>
      _$CourseExamResultFromJson(json);

  Map<String, dynamic> toJson() => _$CourseExamResultToJson(this);
}

@JsonSerializable()
class Course {
  @JsonKey(name: 'Course Name (by group)')
  final String courseName;
  @JsonKey(name: 'Credit', fromJson: _creditFromJson, toJson: _creditToJson)
  final int credit;
  @JsonKey(name: 'Lecturer')
  final String lecturer;
  @JsonKey(name: 'Registration Type')
  final String registrationType;

  Course(
    this.courseName,
    this.credit,
    this.lecturer,
    this.registrationType,
  );

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  static int _creditFromJson(String credit) => int.parse(credit);

  static String _creditToJson(int credit) => credit.toString();
}
