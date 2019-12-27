library xmux.api_v3;

import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';

import 'models_v3/models.dart';

export 'models_v3/models.dart';

class Authorization {
  /// Basic
  String username, password;

  /// Bearer
  String bearerToken;

  Authorization.basic(this.username, this.password);

  Authorization.bearer(this.bearerToken);

  Map<String, String> get header {
    String authorization = '';
    if (bearerToken != null && bearerToken.isNotEmpty)
      authorization = 'bearer $bearerToken';
    else if (username != null && username.isNotEmpty)
      authorization =
          'basic ${base64Encode(utf8.encode('$username:$password'))}';
    return {'authorization': authorization};
  }
}

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
  final Dio _dio;

  factory XMUXApi([String address]) {
    if (instance != null) return instance;
    if (address == null) throw Exception('Address unavailable.');
    instance = XMUXApi._(address)
      // Add interceptors to add `Accept-Language`.
      .._dio.interceptors.add(InterceptorsWrapper(onRequest: (options) {
        options.headers['Accept-Language'] =
            '${window.locale.languageCode}-${window.locale.countryCode},'
            '${window.locale.languageCode};q=0.9';
      }));
    return instance;
  }

  XMUXApi._(String address)
      : _dio = Dio(BaseOptions(
          baseUrl: '$address/v3',
          connectTimeout: 3500,
          receiveTimeout: 60000,
        ));

  /// Parse HTTP response to XMUXApiResponse.
  /// [convertFunc] will be called only when data is not null.
  XMUXApiResponse<T> _decodeResponse<T>(
    Response<Map<String, dynamic>> response,
    T Function(Map<String, dynamic>) convertFunc,
  ) {
    // Check is request success.
    if (response.statusCode != 200 && response.data == null)
      throw XMUXApiException(-1, 'request failed');

    // Get timestamp from header.
    var timestamp = DateTime.now();
    if (response.headers.value('Date') != null)
      timestamp = HttpDate.parse(response.headers.value('Date'));

    // Extract response data.
    int code = response.data['code'];
    String message = response.data['message'];
    Map<String, dynamic> data = response.data['data'];

    // Throw exception when error is serious.
    if (code > 100 || code <= -400) throw XMUXApiException(code, message);

    return XMUXApiResponse<T>(
      code,
      message,
      timestamp,
      data == null ? null : convertFunc(data),
    );
  }

  /// Login with given credential.
  /// Returns firebase custom token in order to login firebase client.
  Future<XMUXApiResponse<LoginResp>> login(String uid, String password) async {
    var resp = await _dio.get<Map<String, dynamic>>(
      '/user/login',
      options: Options(headers: Authorization.basic(uid, password).header),
    );
    return _decodeResponse(resp, LoginResp.fromJson);
  }

  /// Register user if server cannot get adequate information to register automatically.
  Future<XMUXApiResponse<LoginResp>> register(
      String uid, String password, String displayName, String email) async {
    var res = await _dio.post<Map<String, dynamic>>(
      '/user/login',
      data: {'displayName': displayName, 'email': email},
      options: Options(headers: Authorization.basic(uid, password).header),
    );
    return _decodeResponse(res, LoginResp.fromJson);
  }

  /// Refresh device and push channel/key.
  Future<XMUXApiResponse<Null>> refreshDevice(
    Authorization auth,
    String deviceId,
    String deviceModel,
    String deviceName, {
    String pushChannel,
    String pushKey,
  }) async {
    var resp = await _dio.put<Map<String, dynamic>>(
      '/user/device',
      data: {
        'deviceId': deviceId,
        'deviceModel': deviceModel,
        'deviceName': deviceName,
        'pushChannel': pushChannel,
        'pushKey': pushKey,
      },
      options: Options(headers: auth.header),
    );
    return _decodeResponse(resp, (_) => null);
  }

  /// Get devices associated with user.
  Future<XMUXApiResponse<List<Device>>> getDevices(Authorization auth) async {
    var resp = await _dio.get<Map<String, dynamic>>(
      '/user/devices',
      options: Options(headers: auth.header),
    );
    return _decodeResponse(
        resp,
        (data) => List<Map<String, dynamic>>.from(data['devices'])
            .map(Device.fromJson)
            .toList());
  }

  Future<XMUXApiResponse<List<StudentAttendanceBrief>>>
      getStudentAttendanceBriefs(Authorization auth, {String cid}) async {
    var resp = await _dio.get<Map<String, dynamic>>(
      '/ac/attendance/briefs',
      queryParameters: {'cid': cid},
      options: Options(headers: auth.header),
    );
    return _decodeResponse(
        resp,
        (data) => List<Map<String, dynamic>>.from(data['briefs'] ?? [])
            .map(StudentAttendanceBrief.fromJson)
            .toList());
  }

  Future<XMUXApiResponse<StudentAttendanceDetail>> getStudentAttendanceDetail(
      Authorization auth, String cid, DateTime timestamp) async {
    var resp = await _dio.get<Map<String, dynamic>>(
      '/ac/attendance/detail',
      queryParameters: {
        'cid': cid,
        'timestamp': timestamp.toIso8601String() + '+0800'
      },
      options: Options(headers: auth.header),
    );
    return _decodeResponse(resp, StudentAttendanceDetail.fromJson);
  }

  /// Get timetable of current semester from academic system.
  Future<XMUXApiResponse<GetTimetableResp>> getTimetable(
      Authorization auth) async {
    var resp = await _dio.get<Map<String, dynamic>>(
      '/ac/timetable',
      options: Options(headers: auth.header),
    );
    return _decodeResponse(
      resp,
      GetTimetableResp.fromJson,
    );
  }
}
