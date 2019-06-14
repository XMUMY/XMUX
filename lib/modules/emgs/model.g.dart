// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmgsApplicationResult _$EmgsApplicationResultFromJson(
    Map<String, dynamic> json) {
  return EmgsApplicationResult(
      json['applicant_fullname'] as String,
      json['applicant_traveldocno'] as String,
      json['applicant_id'] as String,
      json['type'] as String,
      json['state'] as String,
      (json['status_historys'] as List)
          ?.map((e) => e == null
              ? null
              : EmgsHistoryRecord.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$EmgsApplicationResultToJson(
        EmgsApplicationResult instance) =>
    <String, dynamic>{
      'applicant_fullname': instance.fullName,
      'applicant_traveldocno': instance.travelDocumentNumber,
      'applicant_id': instance.applicationId,
      'type': instance.applicationType,
      'state': instance.applicationStatus,
      'status_historys': instance.history
    };

EmgsHistoryRecord _$EmgsHistoryRecordFromJson(Map<String, dynamic> json) {
  return EmgsHistoryRecord(
      json['created_at'] == null
          ? null
          : EmgsHistoryRecord._dateTimeFromJson(json['created_at'] as String),
      json['status_title'] as String,
      json['remark'] as String,
      json['complete'] == null
          ? null
          : double.parse(json['complete'] as String));
}

Map<String, dynamic> _$EmgsHistoryRecordToJson(EmgsHistoryRecord instance) =>
    <String, dynamic>{
      'created_at': instance.date == null
          ? null
          : EmgsHistoryRecord._dateTimeToJson(instance.date),
      'status_title': instance.status,
      'remark': instance.remark,
      'complete': instance.percentage == null
          ? null
          : EmgsHistoryRecord._percentageToJson(instance.percentage)
    };
