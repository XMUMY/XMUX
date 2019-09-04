// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_v3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResp _$LoginRespFromJson(Map<String, dynamic> json) {
  return LoginResp(json['customToken'] as String);
}

abstract class _$LoginRespSerializerMixin {
  String get customToken;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'customToken': customToken};
}
