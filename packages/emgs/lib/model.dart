import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class EmgsApplicationResult {
  @JsonKey(name: 'applicant_fullname')
  final String fullName;
  @JsonKey(name: 'applicant_traveldocno')
  final String travelDocumentNumber;
  @JsonKey(name: 'applicant_id')
  final String applicationId;
  @JsonKey(name: 'type')
  final String applicationType;
  @JsonKey(name: 'state')
  final String applicationStatus;
  @JsonKey(name: 'status_historys')
  final List<EmgsHistoryRecord> history;

  const EmgsApplicationResult({
    required this.fullName,
    required this.travelDocumentNumber,
    required this.applicationId,
    required this.applicationType,
    required this.applicationStatus,
    required this.history,
  });

  factory EmgsApplicationResult.fromJson(Map<String, dynamic> json) =>
      _$EmgsApplicationResultFromJson(json);

  Map<String, dynamic> toJson() => _$EmgsApplicationResultToJson(this);

  double get percentage =>
      history.reduce((a, b) => a.percentage > b.percentage ? a : b).percentage;
}

@JsonSerializable()
class EmgsHistoryRecord {
  @JsonKey(
    name: 'created_at',
    fromJson: _dateTimeFromJson,
    toJson: _dateTimeToJson,
  )
  final DateTime date;
  @JsonKey(name: 'status_title')
  final String status;
  final String remark;
  @JsonKey(name: 'complete', fromJson: double.parse, toJson: _percentageToJson)
  final double percentage;

  const EmgsHistoryRecord({
    required this.date,
    required this.status,
    required this.remark,
    required this.percentage,
  });

  factory EmgsHistoryRecord.fromJson(Map<String, dynamic> json) =>
      _$EmgsHistoryRecordFromJson(json);

  Map<String, dynamic> toJson() => _$EmgsHistoryRecordToJson(this);

  static DateTime _dateTimeFromJson(String json) =>
      DateFormat('d/M/y').parse(json);

  static String _dateTimeToJson(DateTime date) =>
      DateFormat('d/M/y').format(date);

  static String _percentageToJson(double percentage) => percentage.toString();
}
