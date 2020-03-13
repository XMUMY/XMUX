// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v3_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResp _$LoginRespFromJson(Map<String, dynamic> json) {
  return LoginResp(
    json['customToken'] as String,
  );
}

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return Device(
    json['deviceId'] as String,
    json['deviceModel'] as String,
    json['deviceName'] as String,
    json['lastSeenS'] == null
        ? null
        : DateTime.parse(json['lastSeenS'] as String),
  );
}
