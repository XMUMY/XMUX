// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryState _$QueryStateFromJson(Map<String, dynamic> json) {
  return QueryState(
    assignments: (json['assignments'] as List)
        ?.map((e) => e == null
            ? null
            : AssignmentCourse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    emgsApplicationResult: json['emgsApplicationResult'] == null
        ? null
        : EmgsApplicationResult.fromJson(
            json['emgsApplicationResult'] as Map<String, dynamic>),
    timetable: json['timetable'] == null
        ? null
        : Timetable.fromJson(json['timetable'] as Map<String, dynamic>),
    courses: json['courses'] == null
        ? null
        : Courses.fromJson(json['courses'] as Map<String, dynamic>),
    exams: json['exams'] == null
        ? null
        : Exams.fromJson(json['exams'] as Map<String, dynamic>),
    transcript: json['transcript'] == null
        ? null
        : Transcript.fromJson(json['transcript'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QueryStateToJson(QueryState instance) =>
    <String, dynamic>{
      'assignments': instance.assignments,
      'emgsApplicationResult': instance.emgsApplicationResult,
      'timetable': instance.timetable,
      'courses': instance.courses,
      'exams': instance.exams,
      'transcript': instance.transcript,
    };
