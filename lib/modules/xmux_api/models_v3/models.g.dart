// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResp _$LoginRespFromJson(Map<String, dynamic> json) {
  return LoginResp(
    json['customToken'] as String,
  );
}

GetTimetableResp _$GetTimetableRespFromJson(Map<String, dynamic> json) {
  return GetTimetableResp(
    (json['timetable'] as List)
        ?.map((e) => e == null
            ? null
            : TimetableClass.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['recentUpdateS'] == null
        ? null
        : DateTime.parse(json['recentUpdateS'] as String),
  );
}

Map<String, dynamic> _$GetTimetableRespToJson(GetTimetableResp instance) =>
    <String, dynamic>{
      'timetable': instance.timetable,
      'recentUpdateS': instance.recentUpdate?.toIso8601String(),
    };

TimetableClass _$TimetableClassFromJson(Map<String, dynamic> json) {
  return TimetableClass(
    json['cid'] as String,
    json['name'] as String,
    json['lecturer'] as String,
    json['room'] as String,
    json['day'] as int,
    TimetableClass._timeOfDayFromJson(json['start'] as String),
    TimetableClass._timeOfDayFromJson(json['end'] as String),
    json['startDay'] == null
        ? null
        : DateTime.parse(json['startDay'] as String),
    json['endDay'] == null ? null : DateTime.parse(json['endDay'] as String),
  );
}

Map<String, dynamic> _$TimetableClassToJson(TimetableClass instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'name': instance.name,
      'lecturer': instance.lecturer,
      'room': instance.room,
      'day': instance.day,
      'start': TimetableClass._timeOfDayToJson(instance.start),
      'end': TimetableClass._timeOfDayToJson(instance.end),
      'startDay': instance.startDay?.toIso8601String(),
      'endDay': instance.endDay?.toIso8601String(),
    };

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return Device(
    json['deviceId'] as String,
    json['deviceModel'] as String,
    json['deviceName'] as String,
    json['lastSeenS'] == null
        ? null
        : DateTime.parse(json['lastSeenS'] as String),
  );
}

StudentAttendanceBrief _$StudentAttendanceBriefFromJson(
    Map<String, dynamic> json) {
  return StudentAttendanceBrief(
    json['cid'] as String,
    json['name'] as String,
    json['timestampS'] == null
        ? null
        : DateTime.parse(json['timestampS'] as String),
    json['total'] as int,
    json['attended'] as int,
  );
}

Map<String, dynamic> _$StudentAttendanceBriefToJson(
        StudentAttendanceBrief instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'name': instance.name,
      'timestampS': instance.timestamp?.toIso8601String(),
      'total': instance.total,
      'attended': instance.attended,
    };
