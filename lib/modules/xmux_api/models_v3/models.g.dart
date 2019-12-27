// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResp _$LoginRespFromJson(Map<String, dynamic> json) {
  return LoginResp(
    json['customToken'] as String,
  );
}

GetTimetableResp _$GetTimetableRespFromJson(Map<String, dynamic> json) {
  return GetTimetableResp(
    (json['timetable'] as List)
        ?.map((e) => e == null
            ? null
            : TimetableClass.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['recentUpdateS'] == null
        ? null
        : DateTime.parse(json['recentUpdateS'] as String),
  );
}

Map<String, dynamic> _$GetTimetableRespToJson(GetTimetableResp instance) =>
    <String, dynamic>{
      'timetable': instance.timetable,
      'recentUpdateS': instance.recentUpdate?.toIso8601String(),
    };

TimetableClass _$TimetableClassFromJson(Map<String, dynamic> json) {
  return TimetableClass(
    json['cid'] as String,
    json['name'] as String,
    json['lecturer'] as String,
    json['room'] as String,
    json['day'] as int,
    TimetableClass._timeOfDayFromJson(json['start'] as String),
    TimetableClass._timeOfDayFromJson(json['end'] as String),
    json['startDay'] == null
        ? null
        : DateTime.parse(json['startDay'] as String),
    json['endDay'] == null ? null : DateTime.parse(json['endDay'] as String),
  );
}

Map<String, dynamic> _$TimetableClassToJson(TimetableClass instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'name': instance.name,
      'lecturer': instance.lecturer,
      'room': instance.room,
      'day': instance.day,
      'start': TimetableClass._timeOfDayToJson(instance.start),
      'end': TimetableClass._timeOfDayToJson(instance.end),
      'startDay': instance.startDay?.toIso8601String(),
      'endDay': instance.endDay?.toIso8601String(),
    };

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return Device(
    json['deviceId'] as String,
    json['deviceModel'] as String,
    json['deviceName'] as String,
    json['lastSeenS'] == null
        ? null
        : DateTime.parse(json['lastSeenS'] as String),
  );
}

StudentAttendanceBrief _$StudentAttendanceBriefFromJson(
    Map<String, dynamic> json) {
  return StudentAttendanceBrief(
    json['cid'] as String,
    json['name'] as String,
    json['timestampS'] == null
        ? null
        : DateTime.parse(json['timestampS'] as String),
    json['total'] as int,
    json['attended'] as int,
  );
}

Map<String, dynamic> _$StudentAttendanceBriefToJson(
        StudentAttendanceBrief instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'name': instance.name,
      'timestampS': instance.timestamp?.toIso8601String(),
      'total': instance.total,
      'attended': instance.attended,
    };

StudentAttendanceDetail _$StudentAttendanceDetailFromJson(
    Map<String, dynamic> json) {
  return StudentAttendanceDetail(
    json['cid'] as String,
    json['name'] as String,
    json['timestampS'] == null
        ? null
        : DateTime.parse(json['timestampS'] as String),
    json['total'] as int,
    json['attended'] as int,
    (json['students'] as List)
        ?.map((e) => e == null
            ? null
            : StudentAttendance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StudentAttendanceDetailToJson(
        StudentAttendanceDetail instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'name': instance.name,
      'timestampS': instance.timestamp?.toIso8601String(),
      'total': instance.total,
      'attended': instance.attended,
      'students': instance.students,
    };

StudentAttendance _$StudentAttendanceFromJson(Map<String, dynamic> json) {
  return StudentAttendance(
    json['uid'] as String,
    json['name'] as String,
    _$enumDecodeNullable(_$StudentAttendanceStatusEnumMap, json['status']),
  );
}

Map<String, dynamic> _$StudentAttendanceToJson(StudentAttendance instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'status': _$StudentAttendanceStatusEnumMap[instance.status],
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

const _$StudentAttendanceStatusEnumMap = {
  StudentAttendanceStatus.none: 'none',
  StudentAttendanceStatus.waiting: 'waiting',
  StudentAttendanceStatus.attended: 'attended',
  StudentAttendanceStatus.failed: 'failed',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentAttendance on _StudentAttendance, Store {
  final _$selectedAtom = Atom(name: '_StudentAttendance.selected');

  @override
  bool get selected {
    _$selectedAtom.context.enforceReadPolicy(_$selectedAtom);
    _$selectedAtom.reportObserved();
    return super.selected;
  }

  @override
  set selected(bool value) {
    _$selectedAtom.context.conditionallyRunInAction(() {
      super.selected = value;
      _$selectedAtom.reportChanged();
    }, _$selectedAtom, name: '${_$selectedAtom.name}_set');
  }
}
