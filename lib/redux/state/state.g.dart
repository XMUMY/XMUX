// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return AppState(
    isInitialized: json['isInitialized'] as bool,
    user: UserState.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'isInitialized': instance.isInitialized,
      'user': instance.user,
    };

UserState _$UserStateFromJson(Map<String, dynamic> json) {
  return UserState(
    campusId: json['campusId'] as String,
    password: json['password'] as String,
    ePaymentPassword: json['ePaymentPassword'] as String,
  );
}

Map<String, dynamic> _$UserStateToJson(UserState instance) => <String, dynamic>{
      'campusId': instance.campusId,
      'password': instance.password,
      'ePaymentPassword': instance.ePaymentPassword,
    };
