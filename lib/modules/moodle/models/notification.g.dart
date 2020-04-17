// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
    json['id'] as int,
    json['useridfrom'] as int,
    json['useridto'] as int,
    json['subject'] as String,
    json['smallmessage'] as String,
    json['fullmessage'] as String,
    json['fullmessagehtml'] as String,
    timestampFromJson(json['timecreated'] as int),
  );
}
