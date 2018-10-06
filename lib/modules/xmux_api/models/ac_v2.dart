part of 'models_v2.dart';

/// Class for each lesson.
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
      weeks.substring(6, weeks.length - 2);

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

class Exam {}

class SessionExamResult {}

class CourseExamResult {}
