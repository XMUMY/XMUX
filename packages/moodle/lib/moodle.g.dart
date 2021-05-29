// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moodle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoodleApiError _$MoodleApiErrorFromJson(Map<String, dynamic> json) {
  return MoodleApiError(
    errorCode: json['errorcode'] as String,
    error: json['error'] as String,
  );
}

MoodleApiException _$MoodleApiExceptionFromJson(Map<String, dynamic> json) {
  return MoodleApiException(
    errorCode: json['errorcode'] as String,
    exception: json['exception'] as String,
    message: json['message'] as String,
  );
}
