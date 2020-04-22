import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'v3_bridge.g.dart';

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

@JsonSerializable()
class TranscriptSession {
  final String session;
  final List<TranscriptCourse> courses;
  final double gpa;
  final double cGpa;

  TranscriptSession(this.session, this.courses, this.gpa, this.cGpa);

  static TranscriptSession fromJson(Map<String, dynamic> json) =>
      _$TranscriptSessionFromJson(json);

  Map<String, dynamic> toJson() => _$TranscriptSessionToJson(this);
}

@JsonSerializable()
class TranscriptCourse {
  final String code;
  final String name;
  final int credit;
  final String grade;
  final double point;

  TranscriptCourse(this.code, this.name, this.credit, this.grade, this.point);

  static TranscriptCourse fromJson(Map<String, dynamic> json) =>
      _$TranscriptCourseFromJson(json);

  Map<String, dynamic> toJson() => _$TranscriptCourseToJson(this);
}

enum StudentAttendanceStatus { none, waiting, attended, failed }

@JsonSerializable(createToJson: false)
class StudentAttendanceBrief {
  final String cid;
  final String name;
  @JsonKey(name: 'timestampS')
  final DateTime timestamp;
  final int total;
  @JsonKey(defaultValue: 0)
  final int attended;

  StudentAttendanceBrief(
      this.cid, this.name, this.timestamp, this.total, this.attended);

  static StudentAttendanceBrief fromJson(Map<String, dynamic> json) =>
      _$StudentAttendanceBriefFromJson(json);
}

@JsonSerializable(createToJson: false)
class StudentAttendanceDetail {
  final String cid;
  final String name;
  @JsonKey(name: 'timestampS')
  final DateTime timestamp;
  final int total;
  @JsonKey(defaultValue: 0)
  final int attended;
  final List<StudentAttendance> students;

  StudentAttendanceDetail(this.cid, this.name, this.timestamp, this.total,
      this.attended, this.students);

  static StudentAttendanceDetail fromJson(Map<String, dynamic> json) =>
      _$StudentAttendanceDetailFromJson(json);
}

extension StudentAttendanceListWithCount on List<StudentAttendance> {
  /// Get selected student count.
  int get selectedCount =>
      this.fold<int>(0, (sum, s) => s.selected ? sum + 1 : sum);
}

@JsonSerializable(createToJson: false)
class StudentAttendance extends _StudentAttendance with _$StudentAttendance {
  StudentAttendance(String uid, String name, StudentAttendanceStatus status)
      : super(uid, name, status);

  factory StudentAttendance.fromJson(Map<String, dynamic> json) =>
      _$StudentAttendanceFromJson(json);
}

abstract class _StudentAttendance with Store {
  final String uid;
  final String name;
  final StudentAttendanceStatus status;

  @JsonKey(ignore: true)
  @observable
  bool selected = false;

  _StudentAttendance(this.uid, this.name, this.status);
}
