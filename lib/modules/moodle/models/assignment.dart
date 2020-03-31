import 'package:json_annotation/json_annotation.dart';

import '../common.dart';

part 'assignment.g.dart';

@JsonSerializable()
class Course {
  final String id;
  @JsonKey(name: 'fullname')
  final String fullName;
  @JsonKey(name: 'shortname')
  final String shortName;
  final List<Assignment> assignments;

  Course(this.id, this.fullName, this.shortName, this.assignments);

  static Course fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class Assignment {
  final String id;
  final String name;
  @JsonKey(
      name: 'duedate', fromJson: timestampFromJson, toJson: timestampToJson)
  final DateTime dueDate;
  @JsonKey(
      name: 'allowsubmissionsfromdate',
      fromJson: timestampFromJson,
      toJson: timestampToJson)
  final DateTime allowSubmissionFromDate;

  Assignment(this.id, this.name, this.dueDate, this.allowSubmissionFromDate);

  static Assignment fromJson(Map<String, dynamic> json) =>
      _$AssignmentFromJson(json);

  Map<String, dynamic> toJson() => _$AssignmentToJson(this);
}
