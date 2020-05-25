// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingEvent _$UpcomingEventFromJson(Map<String, dynamic> json) {
  return UpcomingEvent(
    json['id'] as int,
    json['name'] as String,
    json['description'] as String,
    timestampFromJson(json['timestart'] as int),
  );
}

Map<String, dynamic> _$UpcomingEventToJson(UpcomingEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'timestart': timestampToJson(instance.timeStart),
    };
