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
      json['price'] == null ? null : Item._priceFromJson(json['price'] as Map),
      json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      (json['photos'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'from': instance.from,
      'name': instance.name,
      'description': instance.description,
      'price':
          instance.price == null ? null : Item._priceToJson(instance.price),
      'timestamp': instance.timestamp?.toIso8601String(),
      'photos': instance.photos
    };

Price _$PriceFromJson(Map<String, dynamic> json) {
  return Price(
      (json['value'] as num)?.toDouble(), json['currencies'] as String);
}

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'value': instance.value,
      'currencies': instance.currencies
    };

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(json['from'] as String, json['comment'] as String);
}
