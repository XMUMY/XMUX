// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return Lesson(
      json['courseCode'] as String,
      json['courseName'] as String,
      json['l  @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)ecturer']
          as String,
      json['classRoom'] as String,
      json['weeks'] == null
          ? null
          : Lesson._weeksFromJson(json['weeks'] as String),
      json['dayOfWeek'] as int,
      json['startTimeOfDay'] == null
          ? null
          : Lesson._timeOfDayFromJson(json['startTimeOfDay'] as String),
      json['endTimeOfDay'] == null
          ? null
          : Lesson._timeOfDayFromJson(json['endTimeOfDay'] as String));
}

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'courseCode': instance.courseCode,
      'courseName': instance.courseName,
      'lecturer': instance.lecturer,
      'classRoom': instance.classroom,
      'weeks':
          instance.weeks == null ? null : Lesson._weeksToJson(instance.weeks),
      'dayOfWeek': instance.dayOfWeek,
      'startTimeOfDay': instance.startTimeOfDay == null
          ? null
          : Lesson._timeOfDayToJson(instance.startTimeOfDay),
      'endTimeOfDay': instance.endTimeOfDay == null
          ? null
          : Lesson._timeOfDayToJson(instance.endTimeOfDay)
    };
