// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
      json['from'] as String,
      json['name'] as String,
      json['description'] as String,
      json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      json['mainPicture'] as String);
}
