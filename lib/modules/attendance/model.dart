import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

enum AttendanceStatus { marked, success, failed }

@JsonSerializable()
class AttendanceRecord {
  final AttendanceStatus status;
  final String message;
  @JsonKey(fromJson: _timestampFromJson)
  final DateTime timestamp;

  AttendanceRecord(this.status, this.message, this.timestamp);

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRecordFromJson(json);

  static DateTime _timestampFromJson(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  Map<String, dynamic> toJson() => _$AttendanceRecordToJson(this);
}
