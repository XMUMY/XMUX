// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v3_lost_and_found.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LostAndFoundBrief _$LostAndFoundBriefFromJson(Map<String, dynamic> json) {
  return LostAndFoundBrief(
    json['id'] as String,
    json['uid'] as String,
    _$enumDecodeNullable(_$LostAndFoundTypeEnumMap, json['type']),
    json['name'] as String,
    json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    json['location'] as String,
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

const _$LostAndFoundTypeEnumMap = {
  LostAndFoundType.lost: 0,
  LostAndFoundType.found: 1,
};

LostAndFoundDetail _$LostAndFoundDetailFromJson(Map<String, dynamic> json) {
  return LostAndFoundDetail(
    json['id'] as String,
    json['uid'] as String,
    _$enumDecodeNullable(_$LostAndFoundTypeEnumMap, json['type']),
    json['name'] as String,
    json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    json['location'] as String,
    json['description'] as String,
    (json['contacts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    (json['pictures'] as List)?.map((e) => e as String)?.toList(),
    json['comment'] as String,
  );
}
