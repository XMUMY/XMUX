// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v3_bridge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
