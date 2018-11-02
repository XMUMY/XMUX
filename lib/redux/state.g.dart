// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainAppState _$MainAppStateFromJson(Map<String, dynamic> json) {
  return MainAppState(
      AcState.fromJson(json['acState'] as Map<String, dynamic>),
      AuthState.fromJson(json['authState'] as Map<String, dynamic>),
      QueryState.fromJson(json['queryState'] as Map<String, dynamic>),
      SettingState.fromJson(json['settingState'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MainAppStateToJson(MainAppState instance) =>
    <String, dynamic>{
      'acState': instance.acState,
      'authState': instance.authState,
      'queryState': instance.queryState,
      'settingState': instance.settingState
    };

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
          ?.toList(),
      (json['courses'] as List)
          ?.map((e) =>
              e == null ? null : Course.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['assignments'] as List)
          ?.map((e) => e == null
              ? null
              : LessonAssignments.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$AcStateToJson(AcState instance) => <String, dynamic>{
      'status': instance.status,
      'timestamp': instance.timestamp?.toIso8601String(),
      'timetable': instance.timetable,
      'exams': instance.exams,
      'examResult': instance.examResult,
      'courses': instance.courses,
      'assignments': instance.assignments
    };

AuthState _$AuthStateFromJson(Map<String, dynamic> json) {
  return AuthState(
      json['campusID'] as String,
      json['campusIDPassword'] as String,
      json['ePaymentPassword'] as String,
      json['moodleKey'] as String);
}

Map<String, dynamic> _$AuthStateToJson(AuthState instance) => <String, dynamic>{
      'campusID': instance.campusID,
      'campusIDPassword': instance.campusIDPassword,
      'ePaymentPassword': instance.ePaymentPassword,
      'moodleKey': instance.moodleKey
    };

QueryState _$QueryStateFromJson(Map<String, dynamic> json) {
  return QueryState((json['ePaymentRecords'] as List)
      ?.map((e) =>
          e == null ? null : BillingRecord.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$QueryStateToJson(QueryState instance) =>
    <String, dynamic>{'ePaymentRecords': instance.ePaymentRecords};

SettingState _$SettingStateFromJson(Map<String, dynamic> json) {
  return SettingState(json['enableFunctionsUnderDev'] as bool ?? false);
}

Map<String, dynamic> _$SettingStateToJson(SettingState instance) =>
    <String, dynamic>{
      'enableFunctionsUnderDev': instance.enableFunctionsUnderDev
    };
