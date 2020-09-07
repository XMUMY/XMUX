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
