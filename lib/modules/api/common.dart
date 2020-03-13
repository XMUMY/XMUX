import 'dart:io';

import 'package:dio/dio.dart';

/// The response of XMUX API.
class XmuxApiResponse<T> {
  /// E-code returned from server.
  /// Usually 0 represent success.
  final int code;

  /// The message from server.
  final String message;

  /// The timestamp from http response.
  final DateTime timestamp;

  /// Response data.
  final T data;

  XmuxApiResponse(this.code, this.message, this.timestamp, this.data);
}

/// The exception throws from XMUX API.
class XmuxApiException implements Exception {
  /// E-code returned from server.
  /// May represent different error in each API.
  final int code;

  /// The error message from server.
  final String message;

  XmuxApiException(this.code, this.message);

  String toString() => 'XMUXApiV3/ReceivedError: $code $message';
}

/// Decode [Response] in [Map] to [XmuxApiResponse].
XmuxApiResponse<T> decodeResponse<T>(
  Response<Map<String, dynamic>> response,
  T Function(Map<String, dynamic>) convertFunc,
) {
  // Check if request success.
  if (response.statusCode != 200 && response.data == null)
    throw XmuxApiException(-1, 'request failed');

  // Get timestamp from header.
  var timestamp = response.headers.value('Date') != null
      ? HttpDate.parse(response.headers.value('Date'))
      : DateTime.now();

  // Extract response data.
  int code = response.data['code'];
  String message = response.data['message'];
  Map<String, dynamic> data = response.data['data'];

  // Throw exception when error is serious.
  if (code > 100 || code <= -400) throw XmuxApiException(code, message);

  return XmuxApiResponse<T>(
    code,
    message,
    timestamp,
    data == null ? null : convertFunc(data),
  );
}

/// Decode [Response] in [List] to [XmuxApiResponse].
XmuxApiResponse<List<T>> decodeList<T>(
  Response<Map<String, dynamic>> response,
  String entry,
  T Function(Map<String, dynamic>) convertFunc,
) {
  // Check if request success.
  if (response.statusCode != 200 && response.data == null)
    throw XmuxApiException(-1, 'request failed');

  // Get timestamp from header.
  var timestamp = response.headers.value('Date') != null
      ? HttpDate.parse(response.headers.value('Date'))
      : DateTime.now();

  // Extract response data.
  int code = response.data['code'];
  String message = response.data['message'];
  Map<String, dynamic> data = response.data['data'];

  // Throw exception when error is serious.
  if (code > 100 || code <= -400) throw XmuxApiException(code, message);

  return XmuxApiResponse<List<T>>(
    code,
    message,
    timestamp,
    data == null
        ? null
        : (data[entry] as List<Map<String, dynamic>>).map(convertFunc).toList(),
  );
}

int timestampToJson(DateTime dateTime) =>
    dateTime.millisecondsSinceEpoch ~/ 1000;

DateTime timestampFromJson(int timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
