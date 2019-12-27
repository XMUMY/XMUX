import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'attendance.dart';
part 'models.g.dart';

@JsonSerializable(createToJson: false)
class LoginResp {
  final String customToken;

  LoginResp(this.customToken);

  static LoginResp fromJson(Map<String, dynamic> json) =>
      _$LoginRespFromJson(json);
}

@JsonSerializable()
class GetTimetableResp {
  final List<TimetableClass> timetable;

  @JsonKey(name: 'recentUpdateS')
  final DateTime recentUpdate;

  GetTimetableResp(this.timetable, this.recentUpdate);

  static GetTimetableResp fromJson(Map<String, dynamic> json) =>
      _$GetTimetableRespFromJson(json);

  Map<String, dynamic> toJson() => _$GetTimetableRespToJson(this);
}

@JsonSerializable()
class TimetableClass {
  final String cid;
  final String name;
  final String lecturer;
  final String room;
  final int day;

  @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
  final TimeOfDay start;
  @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
  final TimeOfDay end;

  final DateTime startDay;
  final DateTime endDay;

  TimetableClass(this.cid, this.name, this.lecturer, this.room, this.day,
      this.start, this.end, this.startDay, this.endDay);

  static TimetableClass fromJson(Map<String, dynamic> json) =>
      _$TimetableClassFromJson(json);

  Map<String, dynamic> toJson() => _$TimetableClassToJson(this);

  static TimeOfDay _timeOfDayFromJson(String json) =>
      TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(json));

  static String _timeOfDayToJson(TimeOfDay timeOfDay) =>
      '${timeOfDay.hour}:${timeOfDay.minute}';
}

@JsonSerializable(createToJson: false)
class Device {
  final String deviceId;
  final String deviceModel;
  final String deviceName;
  @JsonKey(name: 'lastSeenS')
  final DateTime lastSeen;

  Device(this.deviceId, this.deviceModel, this.deviceName, this.lastSeen);

  static Device fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}
