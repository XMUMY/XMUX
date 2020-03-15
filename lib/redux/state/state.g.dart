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
    _$enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']),
    json['enableFunctionsUnderDev'] as bool ?? false,
  );
}

Map<String, dynamic> _$SettingStateToJson(SettingState instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode],
      'enableFunctionsUnderDev': instance.enableFunctionsUnderDev,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
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
    json['profile'] == null
        ? null
        : Profile.fromJson(json['profile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'campusId': instance.campusId,
      'password': instance.password,
      'ePaymentPassword': instance.ePaymentPassword,
      'moodleKey': instance.moodleKey,
      'profile': instance.profile,
    };
