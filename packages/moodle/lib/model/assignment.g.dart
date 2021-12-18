// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignmentCourse _$AssignmentCourseFromJson(Map<String, dynamic> json) =>
    AssignmentCourse(
      json['id'] as int,
      json['fullname'] as String,
      json['shortname'] as String,
      (json['assignments'] as List<dynamic>)
          .map((e) => Assignment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssignmentCourseToJson(AssignmentCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullName,
      'shortname': instance.shortName,
      'assignments': instance.assignments,
    };

Assignment _$AssignmentFromJson(Map<String, dynamic> json) => Assignment(
      json['id'] as int,
      json['name'] as String,
      timestampToDateTime(json['duedate'] as int),
      timestampToDateTime(json['allowsubmissionsfromdate'] as int),
      json['intro'] as String,
      (json['introattachments'] as List<dynamic>)
          .map((e) => IntroAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssignmentToJson(Assignment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duedate': dateTimeToTimestamp(instance.dueDate),
      'allowsubmissionsfromdate':
          dateTimeToTimestamp(instance.allowSubmissionFromDate),
      'intro': instance.intro,
      'introattachments': instance.introAttachments,
    };

IntroAttachment _$IntroAttachmentFromJson(Map<String, dynamic> json) =>
    IntroAttachment(
      json['filename'] as String,
      json['fileurl'] as String,
    );

Map<String, dynamic> _$IntroAttachmentToJson(IntroAttachment instance) =>
    <String, dynamic>{
      'filename': instance.name,
      'fileurl': instance.url,
    };
