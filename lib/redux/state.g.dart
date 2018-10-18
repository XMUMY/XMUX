// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainAppState _$MainAppStateFromJson(Map<String, dynamic> json) {
  return MainAppState(
      json['authState'] == null
          ? null
          : AuthState.fromJson(json['authState'] as Map<String, dynamic>),
      json['settingState'] == null
          ? null
          : SettingState.fromJson(json['settingState'] as Map<String, dynamic>),
      json['acState'] == null
          ? null
          : AcState.fromJson(json['acState'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MainAppStateToJson(MainAppState instance) =>
    <String, dynamic>{
      'authState': instance.authState,
      'settingState': instance.settingState,
      'acState': instance.acState
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
          ?.toList());
}

Map<String, dynamic> _$AcStateToJson(AcState instance) => <String, dynamic>{
      'status': instance.status,
      'timestamp': instance.timestamp?.toIso8601String(),
      'timetable': instance.timetable,
      'exams': instance.exams,
      'examResult': instance.examResult
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

SettingState _$SettingStateFromJson(Map<String, dynamic> json) {
  return SettingState(json['enableFunctionsUnderDev'] as bool);
}

Map<String, dynamic> _$SettingStateToJson(SettingState instance) =>
    <String, dynamic>{
      'enableFunctionsUnderDev': instance.enableFunctionsUnderDev
    };
