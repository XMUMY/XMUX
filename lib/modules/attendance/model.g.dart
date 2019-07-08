// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceRecord _$AttendanceRecordFromJson(Map<String, dynamic> json) {
  return AttendanceRecord(
      _$enumDecodeNullable(_$AttendanceStatusEnumMap, json['status']),
      json['message'] as String,
      json['timestamp'] == null
          ? null
          : AttendanceRecord._timestampFromJson(json['timestamp'] as int));
}

Map<String, dynamic> _$AttendanceRecordToJson(AttendanceRecord instance) =>
    <String, dynamic>{
      'status': _$AttendanceStatusEnumMap[instance.status],
      'message': instance.message,
      'timestamp': instance.timestamp?.toIso8601String()
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$AttendanceStatusEnumMap = <AttendanceStatus, dynamic>{
  AttendanceStatus.marked: 'marked',
  AttendanceStatus.success: 'success',
  AttendanceStatus.failed: 'failed'
};
