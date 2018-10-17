// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfoState _$PersonalInfoStateFromJson(Map<String, dynamic> json) {
  return PersonalInfoState();
}

Map<String, dynamic> _$PersonalInfoStateToJson(PersonalInfoState instance) =>
    <String, dynamic>{};

SettingState _$SettingStateFromJson(Map<String, dynamic> json) {
  return SettingState();
}

Map<String, dynamic> _$SettingStateToJson(SettingState instance) =>
    <String, dynamic>{};

AcState _$AcStateFromJson(Map<String, dynamic> json) {
  return AcState(
      json['status'] as String,
      json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      (json['timetable'] as List)
          ?.map((e) =>
              e == null ? null : Lesson.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['exams'] as List)
          ?.map((e) =>
              e == null ? null : Exam.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['examResult'] as List)
          ?.map((e) => e == null
              ? null
              : SessionExamResult.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$AcStateToJson(AcState instance) => <String, dynamic>{
      'status': instance.status,
      'timestamp': instance.timestamp?.toIso8601String(),
      'timetable': instance.timetable,
      'exams': instance.exams,
      'examResult': instance.examResult
    };
