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

  EmgsApplicationResult(
      this.fullName,
      this.travelDocumentNumber,
      this.applicationNumber,
      this.applicationType,
      this.applicationStatus,
      this.percentage);

  factory EmgsApplicationResult.fromJson(Map<String, dynamic> json) =>
      _$EmgsApplicationResultFromJson(json);

  Map<String, dynamic> toJson() => _$EmgsApplicationResultToJson(this);
}
