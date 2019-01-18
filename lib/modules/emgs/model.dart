import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class EmgsApplicationResult {
  @JsonKey(name: 'FullName')
  final String fullName;
  @JsonKey(name: 'TravelDocumentNumber')
  final String travelDocumentNumber;
  @JsonKey(name: 'ApplicationNumber')
  final String applicationNumber;
  @JsonKey(name: 'ApplicationType')
  final String applicationType;
  @JsonKey(name: 'ApplicationStatus')
  final String applicationStatus;

  final double percentage;
  final List<EmgsHistoryRecord> history;

  EmgsApplicationResult(
      this.fullName,
      this.travelDocumentNumber,
      this.applicationNumber,
      this.applicationType,
      this.applicationStatus,
      this.percentage,
      this.history);

  factory EmgsApplicationResult.fromJson(Map<String, dynamic> json) =>
      _$EmgsApplicationResultFromJson(json);

  Map<String, dynamic> toJson() => _$EmgsApplicationResultToJson(this);
}

@JsonSerializable()
class EmgsHistoryRecord {
  @JsonKey(fromJson: _dateTimeFromJson)
  final DateTime date;
  final String status;
  final String remark;

  EmgsHistoryRecord(this.date, this.status, this.remark);

  factory EmgsHistoryRecord.fromJson(Map<String, dynamic> json) =>
      _$EmgsHistoryRecordFromJson(json);

  Map<String, dynamic> toJson() => _$EmgsHistoryRecordToJson(this);

  static DateTime _dateTimeFromJson(String json) {
    if (!json.contains('/')) return DateTime.parse(json);
    var l = json.split('/').map((e) => int.parse(e)).toList();
    return DateTime(l[2], l[1], l[0]);
  }
}
