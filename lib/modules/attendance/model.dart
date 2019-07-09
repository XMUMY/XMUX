import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

enum AttendStatus { marked, duplicated, failed }
enum AttendanceStatus { marked, success, failed }

@JsonSerializable()
class AttendanceRecord {
  final AttendanceStatus status;
  // TODO: Use cid instead.
  @JsonKey(name: 'courseid')
  final String cid;
  final String message;
  @JsonKey(fromJson: _timestampFromJson)
  final DateTime timestamp;

  AttendanceRecord(this.status, this.cid, this.message, this.timestamp);

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRecordFromJson(json);

  static DateTime _timestampFromJson(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  Map<String, dynamic> toJson() => _$AttendanceRecordToJson(this);
}

@JsonSerializable()
class AttendResult {
  final AttendStatus status;
  final String message;
  final String id;

  AttendResult(this.status, this.message, this.id);

  factory AttendResult.fromJson(Map<String, dynamic> json) =>
      _$AttendResultFromJson(json);

  Map<String, dynamic> toJson() => _$AttendResultToJson(this);
}
