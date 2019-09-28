// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_v3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResp _$LoginRespFromJson(Map<String, dynamic> json) {
  return LoginResp(
    json['customToken'] as String,
  );
}

TimetableClass _$TimetableClassFromJson(Map<String, dynamic> json) {
  return TimetableClass(
    json['cid'] as String,
    json['name'] as String,
    json['lecturer'] as String,
    json['room'] as String,
    json['day'] as int,
    json['startDay'] as String,
    json['endDay'] as String,
  );
}
