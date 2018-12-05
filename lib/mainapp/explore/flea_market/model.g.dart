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
      (json['photos'] as List)?.map((e) => e as String)?.toList())
    ..key = json['key'] as String;
}

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(json['from'] as String, json['comment'] as String);
}

Map<String, dynamic> _$CommentToJson(Comment instance) =>
    <String, dynamic>{'from': instance.from, 'comment': instance.comment};
