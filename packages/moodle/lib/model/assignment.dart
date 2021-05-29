import 'package:json_annotation/json_annotation.dart';

import 'common.dart';

part 'assignment.g.dart';

@JsonSerializable()
class AssignmentCourse {
  final int id;
  @JsonKey(name: 'fullname')
  final String fullName;
  @JsonKey(name: 'shortname')
  final String shortName;
  final List<Assignment> assignments;

  AssignmentCourse(this.id, this.fullName, this.shortName, this.assignments);

  static AssignmentCourse fromJson(Map<String, dynamic> json) =>
      _$AssignmentCourseFromJson(json);

  Map<String, dynamic> toJson() => _$AssignmentCourseToJson(this);
}

@JsonSerializable()
class Assignment {
  final int id;
  final String name;

  @JsonKey(
    name: 'duedate',
    fromJson: timestampToDateTime,
    toJson: dateTimeToTimestamp,
  )
  final DateTime dueDate;

  @JsonKey(
    name: 'allowsubmissionsfromdate',
    fromJson: timestampToDateTime,
    toJson: dateTimeToTimestamp,
  )
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
