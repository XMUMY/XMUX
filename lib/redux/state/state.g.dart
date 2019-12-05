// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainAppState _$MainAppStateFromJson(Map<String, dynamic> json) {
  return MainAppState(
    AcState.fromJson(json['acState'] as Map<String, dynamic>),
    User.fromJson(json['user'] as Map<String, dynamic>),
    QueryState.fromJson(json['queryState'] as Map<String, dynamic>),
    SettingState.fromJson(json['settingState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MainAppStateToJson(MainAppState instance) =>
    <String, dynamic>{
      'acState': instance.acState,
      'user': instance.user,
      'queryState': instance.queryState,
      'settingState': instance.settingState,
    };

AcState _$AcStateFromJson(Map<String, dynamic> json) {
  return AcState(
    json['status'] as String,
    json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    json['info'] == null
        ? null
        : Info.fromJson(json['info'] as Map<String, dynamic>),
    (json['timetable'] as List)
        ?.map((e) =>
            e == null ? null : Lesson.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['exams'] as List)
        ?.map(
            (e) => e == null ? null : Exam.fromJson(e as Map<String, dynamic>))
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
        ?.toList(),
  );
}

Map<String, dynamic> _$AcStateToJson(AcState instance) => <String, dynamic>{
      'status': instance.status,
      'timestamp': instance.timestamp?.toIso8601String(),
      'info': instance.info,
      'timetable': instance.timetable,
      'exams': instance.exams,
      'examResult': instance.examResult,
      'courses': instance.courses,
      'assignments': instance.assignments,
    };

SettingState _$SettingStateFromJson(Map<String, dynamic> json) {
  return SettingState(
    json['enableFunctionsUnderDev'] as bool ?? false,
  );
}

Map<String, dynamic> _$SettingStateToJson(SettingState instance) =>
    <String, dynamic>{
      'enableFunctionsUnderDev': instance.enableFunctionsUnderDev,
    };

QueryState _$QueryStateFromJson(Map<String, dynamic> json) {
  return QueryState(
    (json['ePaymentRecords'] as List)
        ?.map((e) => e == null
            ? null
            : BillingRecord.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['emgsApplicationResult'] == null
        ? null
        : EmgsApplicationResult.fromJson(
            json['emgsApplicationResult'] as Map<String, dynamic>),
    json['timetable'] == null
        ? null
        : GetTimetableResp.fromJson(json['timetable'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QueryStateToJson(QueryState instance) =>
    <String, dynamic>{
      'ePaymentRecords': instance.ePaymentRecords,
      'emgsApplicationResult': instance.emgsApplicationResult,
      'timetable': instance.timetable,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['campusId'] as String,
    json['password'] as String,
    json['ePaymentPassword'] as String,
    json['moodleKey'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'campusId': instance.campusId,
      'password': instance.password,
      'ePaymentPassword': instance.ePaymentPassword,
      'moodleKey': instance.moodleKey,
    };
