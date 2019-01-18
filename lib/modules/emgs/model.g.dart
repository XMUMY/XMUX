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
      (json['percentage'] as num)?.toDouble(),
      (json['history'] as List)
          ?.map((e) => e == null
              ? null
              : EmgsHistoryRecord.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$EmgsApplicationResultToJson(
        EmgsApplicationResult instance) =>
    <String, dynamic>{
      'FullName': instance.fullName,
      'TravelDocumentNumber': instance.travelDocumentNumber,
      'ApplicationNumber': instance.applicationNumber,
      'ApplicationType': instance.applicationType,
      'ApplicationStatus': instance.applicationStatus,
      'percentage': instance.percentage,
      'history': instance.history
    };

EmgsHistoryRecord _$EmgsHistoryRecordFromJson(Map<String, dynamic> json) {
  return EmgsHistoryRecord(
      json['date'] == null
          ? null
          : EmgsHistoryRecord._dateTimeFromJson(json['date'] as String),
      json['status'] as String,
      json['remark'] as String);
}

Map<String, dynamic> _$EmgsHistoryRecordToJson(EmgsHistoryRecord instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'status': instance.status,
      'remark': instance.remark
    };
