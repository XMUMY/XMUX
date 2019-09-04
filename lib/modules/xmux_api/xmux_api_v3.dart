library xmux.api_v3;

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:xmux/modules/xmux_api/http_wrapper.dart';

/// The general exception for XMUX API.
class XMUXApiException implements Exception {
  /// E-code returned from server.
  /// May represent different error in each API.
  final int code;

  /// The message from server.
  final String message;

  XMUXApiException(this.code, this.message);

  String toString() => 'XMUXApiV2/ReceivedError: $code $message';
}

/// The general response of XMUX API V2 from server.
class XMUXApiResponse<T> {
  /// E-code returned from server.
  /// Usually 0 represent success.
  final int code;

  /// The message from server.
  final String message;

  /// The timestamp from http response.
  final DateTime timestamp;

  /// Response data.
  final T data;

  XMUXApiResponse(this.code, this.message, this.timestamp, this.data);
}

/// XMUX API V2
class XMUXApi {
  /// Unique instance of XMUXApi.
  static XMUXApi _instance;

  /// Back-end API addresses.
  final String address;

  /// HTTP client for API calls.
  final XMUXHttpClient _client = null;

  /// Callback to get ID token for firebaseUser.
  /// Should be assigned before using APIs need JWT token.
  Future<String> Function() getIdToken;

  factory XMUXApi(String address) {
    if (_instance == null) _instance = XMUXApi._(address);
    return _instance;
  }

  XMUXApi._(this.address);

  /// Parse HTTP response to XMUXApiResponse.
  XMUXApiResponse<T> decodeResponse<T>(
    http.Response response,
    T Function(Map<String, dynamic>) convertFunc,
  ) {
    // Check is request success.
    if (response.statusCode != 200 && response.body == null)
      throw XMUXApiException(-1, 'request failed');

    // Get timestamp from header.
    var timestamp = DateTime.now();
    if (response.headers.containsKey('Date'))
      timestamp = HttpDate.parse(response.headers['Date']);

    Map<String, dynamic> decodedBody = jsonDecode(response.body);

    return XMUXApiResponse<T>(
      decodedBody['code'],
      decodedBody['message'],
      timestamp,
      convertFunc(decodedBody['data']),
    );
  }
}
