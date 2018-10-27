part of 'models_v2.dart';

@JsonSerializable(createToJson: false)
class MoodleData {
  final List<LessonAssignments> assignments;

  MoodleData({this.assignments});

  static MoodleData fromJson(Map<String, dynamic> json) =>
      _$MoodleDataFromJson(json);
}

@JsonSerializable()
class LessonAssignments {
  @JsonKey(name: 'fullname')
  final String courseFullName;
  @JsonKey(name: 'shortname')
  final String courseShortName;
  final List<Assignment> assignments;

  factory LessonAssignments.fromJson(Map<String, dynamic> json) =>
      _$LessonAssignmentsFromJson(json);

  Map<String, dynamic> toJson() => _$LessonAssignmentsToJson(this);

  LessonAssignments(
      this.courseFullName, this.courseShortName, this.assignments);
}

@JsonSerializable()
class Assignment {
  final int id;
  final String name;
  @JsonKey(
      name: 'duedateTimestamp',
      fromJson: _timestampFromJson,
      toJson: _timestampToJson)
  final DateTime timestamp;

  Assignment(this.id, this.name, this.timestamp);

  factory Assignment.fromJson(Map<String, dynamic> json) =>
      _$AssignmentFromJson(json);

  Map<String, dynamic> toJson() => _$AssignmentToJson(this);

  static DateTime _timestampFromJson(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp);

  static int _timestampToJson(DateTime timestamp) =>
      timestamp.millisecondsSinceEpoch;
}
