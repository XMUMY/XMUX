library xmux.api_v3;

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:xmux/modules/xmux_api/http_wrapper.dart';
import 'package:xmux/modules/xmux_api/models/models_v3.dart';

export 'http_wrapper.dart';

/// The general exception for XMUX API.
class XMUXApiException implements Exception {
  /// E-code returned from server.
  /// May represent different error in each API.
  final int code;

  /// The error message from server.
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

/// XMUX API V3
class XMUXApi {
  /// Unique instance of XMUXApi.
  static XMUXApi instance;

  /// HTTP client for API calls.
  final XMUXHttpClient _client;

  /// Callback to get ID token for firebaseUser.
  /// Should be assigned before using APIs need JWT token.
  Future<String> Function() getIdToken;

  factory XMUXApi(String address) {
    if (instance == null) instance = XMUXApi._(XMUXHttpClient(address));
    return instance;
  }

  XMUXApi._(this._client);

  /// Parse HTTP response to XMUXApiResponse.
  /// [convertFunc] will be called only when data is not null.
  XMUXApiResponse<T> _decodeResponse<T>(
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
    int code = decodedBody['code'];
    Map<String, dynamic> data = decodedBody['data'];

    // Throw exception when error is serious.
    if (code > 100 || code <= -400)
      throw XMUXApiException(code, decodedBody['message']);

    return XMUXApiResponse<T>(
      decodedBody['code'],
      decodedBody['message'],
      timestamp,
      data == null ? null : convertFunc(data),
    );
  }

  /// Login with given credential.
  /// Returns firebase custom token in order to login firebase client.
  Future<XMUXApiResponse<LoginResp>> login(String uid, String password) async {
    var resp = await _client.get(
      '/user/login',
      auth: Authorization.basic(uid, password),
    );
    return _decodeResponse(resp, LoginResp.fromJson);
  }

  /// Register user if server cannot get adequate information to register automatically.
  Future<XMUXApiResponse<LoginResp>> register(
      String uid, String password, String displayName, String email) async {
    var res = await _client.post(
      '/user/login',
      {'DisplayName': displayName, 'Email': email},
      auth: Authorization.basic(uid, password),
    );
    return _decodeResponse(res, LoginResp.fromJson);
  }

  /// Refresh device and push channel/key.
  Future<XMUXApiResponse<Null>> refreshDevice(
    String deviceId,
    String deviceModel,
    String deviceName, {
    Authorization auth,
    String pushChannel,
    String pushKey,
  }) async {
    var resp = await _client.put(
      '/user/device',
      {
        'DeviceId': deviceId,
        'DeviceModel': deviceModel,
        'DeviceName': deviceName,
        'PushChannel': pushChannel,
        'PushKey': pushKey,
      },
      auth: auth ?? Authorization.bearer(await getIdToken()),
    );
    return _decodeResponse(resp, (_) => null);
  }

  /// Get timetable of current semester from academic system.
  Future<XMUXApiResponse<GetTimetableResp>> getTimetable(
      Authorization auth) async {
    var resp = await _client.get('/ac/timetable', auth: auth);

    return _decodeResponse(
      resp,
      GetTimetableResp.fromJson,
    );
  }
}
