// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceRecord _$AttendanceRecordFromJson(Map<String, dynamic> json) {
  return AttendanceRecord(
    _$enumDecodeNullable(_$AttendanceStatusEnumMap, json['status']),
    json['courseid'] as String,
    json['message'] as String,
    AttendanceRecord._timestampFromJson(json['timestamp'] as int),
  );
}

Map<String, dynamic> _$AttendanceRecordToJson(AttendanceRecord instance) =>
    <String, dynamic>{
      'status': _$AttendanceStatusEnumMap[instance.status],
      'courseid': instance.cid,
      'message': instance.message,
      'timestamp': instance.timestamp?.toIso8601String(),
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

const _$AttendanceStatusEnumMap = {
  AttendanceStatus.marked: 'marked',
  AttendanceStatus.success: 'success',
  AttendanceStatus.failed: 'failed',
};

AttendResult _$AttendResultFromJson(Map<String, dynamic> json) {
  return AttendResult(
    _$enumDecodeNullable(_$AttendStatusEnumMap, json['status']),
    json['message'] as String,
    json['id'] as String,
  );
}

Map<String, dynamic> _$AttendResultToJson(AttendResult instance) =>
    <String, dynamic>{
      'status': _$AttendStatusEnumMap[instance.status],
      'message': instance.message,
      'id': instance.id,
    };

const _$AttendStatusEnumMap = {
  AttendStatus.marked: 'marked',
  AttendStatus.duplicated: 'duplicated',
  AttendStatus.failed: 'failed',
};
