// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignmentCourse _$AssignmentCourseFromJson(Map<String, dynamic> json) {
  return AssignmentCourse(
    json['id'] as int,
    json['fullname'] as String,
    json['shortname'] as String,
    (json['assignments'] as List)
        ?.map((e) =>
            e == null ? null : Assignment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AssignmentCourseToJson(AssignmentCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullName,
      'shortname': instance.shortName,
      'assignments': instance.assignments,
    };

Assignment _$AssignmentFromJson(Map<String, dynamic> json) {
  return Assignment(
    json['id'] as int,
    json['name'] as String,
    timestampFromJson(json['duedate'] as int),
    timestampFromJson(json['allowsubmissionsfromdate'] as int),
    json['intro'] as String,
    (json['introattachments'] as List)
        ?.map((e) => e == null
            ? null
            : IntroAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AssignmentToJson(Assignment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duedate': timestampToJson(instance.dueDate),
      'allowsubmissionsfromdate':
          timestampToJson(instance.allowSubmissionFromDate),
      'intro': instance.intro,
      'introattachments': instance.introAttachments,
    };

IntroAttachment _$IntroAttachmentFromJson(Map<String, dynamic> json) {
  return IntroAttachment(
    json['filename'] as String,
    json['fileurl'] as String,
  );
}

Map<String, dynamic> _$IntroAttachmentToJson(IntroAttachment instance) =>
    <String, dynamic>{
      'filename': instance.name,
      'fileurl': instance.url,
    };
