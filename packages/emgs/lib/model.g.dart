// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmgsApplicationResult _$EmgsApplicationResultFromJson(
    Map<String, dynamic> json) {
  return EmgsApplicationResult(
    fullName: json['applicant_fullname'] as String,
    travelDocumentNumber: json['applicant_traveldocno'] as String,
    applicationId: json['applicant_id'] as String,
    applicationType: json['type'] as String,
    applicationStatus: json['state'] as String,
    history: (json['status_historys'] as List<dynamic>)
        .map((e) => EmgsHistoryRecord.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EmgsApplicationResultToJson(
        EmgsApplicationResult instance) =>
    <String, dynamic>{
      'applicant_fullname': instance.fullName,
      'applicant_traveldocno': instance.travelDocumentNumber,
      'applicant_id': instance.applicationId,
      'type': instance.applicationType,
      'state': instance.applicationStatus,
      'status_historys': instance.history,
    };

EmgsHistoryRecord _$EmgsHistoryRecordFromJson(Map<String, dynamic> json) {
  return EmgsHistoryRecord(
    date: EmgsHistoryRecord._dateTimeFromJson(json['created_at'] as String),
    status: json['status_title'] as String,
    remark: json['remark'] as String,
    percentage: double.parse(json['complete'] as String),
  );
}

Map<String, dynamic> _$EmgsHistoryRecordToJson(EmgsHistoryRecord instance) =>
    <String, dynamic>{
      'created_at': EmgsHistoryRecord._dateTimeToJson(instance.date),
      'status_title': instance.status,
      'remark': instance.remark,
      'complete': EmgsHistoryRecord._percentageToJson(instance.percentage),
    };
