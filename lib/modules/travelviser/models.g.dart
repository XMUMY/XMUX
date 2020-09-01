// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelviserUser _$TravelviserUserFromJson(Map<String, dynamic> json) {
  return TravelviserUser(
    json['id'] as int,
    json['username'] as String,
    json['email'] as String,
    json['id_organization'] as int,
  );
}

BookingRecord _$BookingRecordFromJson(Map<String, dynamic> json) {
  return BookingRecord(
    json['key'] as String,
    json['id_route'] as int,
    json['id_trip'] as int,
    json['dt_ticket'] as String,
    json['trip'] as String,
    json['route'] as String,
    json['embark'] as String,
    json['disembark'] as String,
    json['dt_board'] as String,
  );
}

Route _$RouteFromJson(Map<String, dynamic> json) {
  return Route(
    json['id'] as int,
    json['name'] as String,
    Route.dayOfWeekFromJson(json['journey_days'] as String),
  );
}

Trip _$TripFromJson(Map<String, dynamic> json) {
  return Trip(
    json['id'] as int,
    json['title'] as String,
  );
}

WayPoint _$WayPointFromJson(Map<String, dynamic> json) {
  return WayPoint(
    json['id'] as int,
    json['name'] as String,
  );
}
