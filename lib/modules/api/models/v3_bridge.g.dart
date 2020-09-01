// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v3_bridge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
    json['name'] as String,
    json['credit'] as int,
    json['lecturer'] as String,
  );
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'name': instance.name,
      'credit': instance.credit,
      'lecturer': instance.lecturer,
    };

Timetable _$TimetableFromJson(Map<String, dynamic> json) {
  return Timetable(
    (json['timetable'] as List)
        ?.map((e) => e == null
            ? null
            : TimetableClass.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timestampFromJson(json['recentUpdate'] as int),
  );
}

Map<String, dynamic> _$TimetableToJson(Timetable instance) => <String, dynamic>{
      'timetable': instance.timetable,
      'recentUpdate': timestampToJson(instance.recentUpdate),
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

TranscriptSession _$TranscriptSessionFromJson(Map<String, dynamic> json) {
  return TranscriptSession(
    json['session'] as String,
    (json['courses'] as List)
        ?.map((e) => e == null
            ? null
            : TranscriptCourse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['gpa'] as num)?.toDouble(),
    (json['cGpa'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TranscriptSessionToJson(TranscriptSession instance) =>
    <String, dynamic>{
      'session': instance.session,
      'courses': instance.courses,
      'gpa': instance.gpa,
      'cGpa': instance.cGpa,
    };

TranscriptCourse _$TranscriptCourseFromJson(Map<String, dynamic> json) {
  return TranscriptCourse(
    json['code'] as String,
    json['name'] as String,
    json['credit'] as int,
    json['grade'] as String,
    (json['point'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TranscriptCourseToJson(TranscriptCourse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'credit': instance.credit,
      'grade': instance.grade,
      'point': instance.point,
    };

StudentAttendanceBrief _$StudentAttendanceBriefFromJson(
    Map<String, dynamic> json) {
  return StudentAttendanceBrief(
    json['cid'] as String,
    json['name'] as String,
    json['timestampS'] == null
        ? null
        : DateTime.parse(json['timestampS'] as String),
    json['total'] as int,
    json['attended'] as int ?? 0,
  );
}

StudentAttendanceDetail _$StudentAttendanceDetailFromJson(
    Map<String, dynamic> json) {
  return StudentAttendanceDetail(
    json['cid'] as String,
    json['name'] as String,
    json['timestampS'] == null
        ? null
        : DateTime.parse(json['timestampS'] as String),
    json['total'] as int,
    json['attended'] as int ?? 0,
    (json['students'] as List)
        ?.map((e) => e == null
            ? null
            : StudentAttendance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

StudentAttendance _$StudentAttendanceFromJson(Map<String, dynamic> json) {
  return StudentAttendance(
    json['uid'] as String,
    json['name'] as String,
    _$enumDecodeNullable(_$StudentAttendanceStatusEnumMap, json['status']),
  );
}

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

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentAttendance on _StudentAttendance, Store {
  final _$selectedAtom = Atom(name: '_StudentAttendance.selected');

  @override
  bool get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(bool value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  @override
  String toString() {
    return '''
selected: ${selected}
    ''';
  }
}
