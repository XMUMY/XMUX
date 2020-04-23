// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Announcement _$AnnouncementFromJson(Map<String, dynamic> json) {
  return Announcement(
    json['headline'] as String,
    json['detail'] as String,
    Announcement._timestampFromJson(json['timestamp'] as int),
    json['uri'] as String,
  );
}

Map<String, dynamic> _$AnnouncementToJson(Announcement instance) =>
    <String, dynamic>{
      'headline': instance.headline,
      'detail': instance.detail,
      'timestamp': Announcement._timestampToJson(instance.timestamp),
      'uri': instance.uri,
    };

BillingRecord _$BillingRecordFromJson(Map<String, dynamic> json) {
  return BillingRecord(
    json['item'] as String,
    BillingRecord._amountFromJson(json['amount'] as String),
    json['balance'] as String,
  );
}

Map<String, dynamic> _$BillingRecordToJson(BillingRecord instance) =>
    <String, dynamic>{
      'item': instance.item,
      'amount': BillingRecord._amountToJson(instance.amount),
      'balance': instance.balance,
    };

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
    json['name'] as String,
    json['imageURL'] as String,
    json['uri'] as String,
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'name': instance.name,
      'imageURL': instance.imageURL,
      'uri': instance.uri,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['campusId'] as String,
    json['name'] as String,
    json['headpic'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'campusId': instance.campusId,
      'name': instance.name,
      'headpic': instance.photoUrl,
    };

AcData _$AcDataFromJson(Map<String, dynamic> json) {
  return AcData(
    exams: (json['exams'] as List)
        ?.map(
            (e) => e == null ? null : Exam.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Exam _$ExamFromJson(Map<String, dynamic> json) {
  return Exam(
    json['Exam (Academic Session)'] as String,
    Exam._dateFromJson(json['Exam Date'] as String),
    DurationOfDay.parse(json['Exam Time'] as String),
    json['Exam Venue'] as String,
    json['Course Name'] as String,
    json['Exam Type'] as String,
    json['Status'] as String,
  );
}

Map<String, dynamic> _$ExamToJson(Exam instance) => <String, dynamic>{
      'Exam (Academic Session)': instance.session,
      'Exam Date': Exam._dateToJson(instance.date),
      'Exam Time': instance.durationOfDay,
      'Exam Venue': instance.venue,
      'Course Name': instance.courseName,
      'Exam Type': instance.type,
      'Status': instance.status,
    };
