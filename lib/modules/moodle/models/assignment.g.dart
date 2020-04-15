// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
    json['id'] as int,
    json['fullname'] as String,
    json['shortname'] as String,
    (json['assignments'] as List)
        ?.map((e) =>
            e == null ? null : Assignment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
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
    };
