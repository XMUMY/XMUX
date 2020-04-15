import 'package:json_annotation/json_annotation.dart';

import '../common.dart';

part 'assignment.g.dart';

@JsonSerializable()
class Course {
  final int id;
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
  final int id;
  final String name;
  @JsonKey(
      name: 'duedate', fromJson: timestampFromJson, toJson: timestampToJson)
  final DateTime dueDate;
  @JsonKey(
      name: 'allowsubmissionsfromdate',
      fromJson: timestampFromJson,
      toJson: timestampToJson)
  final DateTime allowSubmissionFromDate;

  final String intro;
  @JsonKey(name: 'introattachments')
  final List<IntroAttachment> introAttachments;

  Assignment(this.id, this.name, this.dueDate, this.allowSubmissionFromDate,
      this.intro, this.introAttachments);

  static Assignment fromJson(Map<String, dynamic> json) =>
      _$AssignmentFromJson(json);

  Map<String, dynamic> toJson() => _$AssignmentToJson(this);
}

@JsonSerializable()
class IntroAttachment {
  @JsonKey(name: 'filename')
  final String name;
  @JsonKey(name: 'fileurl')
  final String url;

  IntroAttachment(this.name, this.url);

  static IntroAttachment fromJson(Map<String, dynamic> json) =>
      _$IntroAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$IntroAttachmentToJson(this);
}
