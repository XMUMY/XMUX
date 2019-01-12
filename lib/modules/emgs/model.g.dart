// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmgsApplicationResult _$EmgsApplicationResultFromJson(
    Map<String, dynamic> json) {
  return EmgsApplicationResult(
      json['FullName'] as String,
      json['TravelDocumentNumber'] as String,
      json['ApplicationNumber'] as String,
      json['ApplicationType'] as String,
      json['ApplicationStatus'] as String,
      (json['percentage'] as num)?.toDouble());
}

Map<String, dynamic> _$EmgsApplicationResultToJson(
        EmgsApplicationResult instance) =>
    <String, dynamic>{
      'FullName': instance.fullName,
      'TravelDocumentNumber': instance.travelDocumentNumber,
      'ApplicationNumber': instance.applicationNumber,
      'ApplicationType': instance.applicationType,
      'ApplicationStatus': instance.applicationStatus,
      'percentage': instance.percentage
    };
