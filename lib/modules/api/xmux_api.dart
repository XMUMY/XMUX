import 'dart:ui';

import 'package:dio/dio.dart';

import 'authorization.dart';
import 'common.dart';
import 'models/v3_bridge.dart';
import 'models/v3_user.dart';
import 'v3_lost_and_found.dart';

export 'authorization.dart';
export 'common.dart' show XmuxApiResponse, XmuxApiException;
export 'models/v3_bridge.dart';
export 'models/v3_user.dart';
export 'v3_lost_and_found.dart';

class XmuxApi {
  /// Unique instance of XMUXApi.
  static XmuxApi instance;

  /// HTTP client for API calls.
  final Dio _dio;

  /// Contains user credentials.
  final Authorization _authorization;

  final LostAndFoundApi lostAndFoundApi;

  factory XmuxApi([String address, Authorization authorization]) {
    if (instance != null) return instance;

    authorization ??= Authorization();
    var dio = Dio(BaseOptions(
      baseUrl: '$address/v3',
      connectTimeout: 10000,
      receiveTimeout: 10000,
    ))
      // Add interceptors to add `Accept-Language`.
      ..interceptors.add(InterceptorsWrapper(onRequest: (options) {
        options.headers['Accept-Language'] =
            '${window.locale.languageCode}-${window.locale.countryCode},'
            '${window.locale.languageCode};q=0.9';
      }));

    instance =
        XmuxApi._(dio, authorization, LostAndFoundApi(authorization, dio: dio));

    return instance;
  }

  XmuxApi._(this._dio, this._authorization, this.lostAndFoundApi);

  /// Configure authorization.
  void configure(
      {bool eraseAuthorization = false, Authorization authorization}) {
    if (eraseAuthorization) _authorization.erase();
    if (authorization != null) _authorization.mergeFrom(authorization);
  }

  /// Login with given credential.
  /// Returns firebase custom token in order to login firebase client.
  Future<XmuxApiResponse<LoginResp>> login(String uid, String password) async {
    var resp = await _dio.get<Map<String, dynamic>>(
      '/user/login',
      options: await Authorization.basic(uid, password).options,
    );
    return decodeResponse(resp, LoginResp.fromJson);
  }

  /// Register user if server cannot get adequate information to register automatically.
  Future<XmuxApiResponse<LoginResp>> register(
      String uid, String password, String displayName, String email) async {
    var res = await _dio.post<Map<String, dynamic>>(
      '/user/login',
      data: {'displayName': displayName, 'email': email},
      options: await Authorization.basic(uid, password).options,
    );
    return decodeResponse(res, LoginResp.fromJson);
  }

  /// Refresh device and push channel/key.
  Future<XmuxApiResponse<Null>> refreshDevice(
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
      options: await _authorization.options,
    );
    return decodeResponse(resp, (_) => null);
  }

  /// Get devices associated with user.
  Future<XmuxApiResponse<List<Device>>> get devices async {
    var resp = await _dio.get<Map<String, dynamic>>(
      '/user/devices',
      options: await _authorization.options,
    );
    return decodeList(resp, 'devices', Device.fromJson);
  }

  Future<XmuxApiResponse<Profile>> getProfile({String uid}) async {
    var resp = await _dio.get<Map<String, dynamic>>(
      '/user/profile',
      queryParameters: {if (uid != null) 'uid': uid},
      options: await _authorization.options,
    );
    return decodeResponse(resp, Profile.fromJson);
  }

  Future<XmuxApiResponse<List<StudentAttendanceBrief>>>
      getStudentAttendanceBriefs({String cid}) async {
    var resp = await _dio.get<Map<String, dynamic>>(
      '/ac/attendance/briefs',
      queryParameters: {'cid': cid},
      options: await _authorization.options,
    );
    return decodeResponse(
        resp,
        (data) => List<Map<String, dynamic>>.from(data['briefs'] ?? [])
            .map(StudentAttendanceBrief.fromJson)
            .toList());
  }

  Future<XmuxApiResponse<StudentAttendanceDetail>> getStudentAttendanceDetail(
      String cid, DateTime timestamp) async {
    var resp = await _dio.get<Map<String, dynamic>>(
      '/ac/attendance/detail',
      queryParameters: {
        'cid': cid,
        'timestampS': timestamp.toUtc().toIso8601String() + '+0000'
      },
      options: await _authorization.options,
    );
    return decodeResponse(resp, StudentAttendanceDetail.fromJson);
  }

  /// Get timetable of current semester from academic system.
  Future<XmuxApiResponse<GetTimetableResp>> get timetable async {
    var resp = await _dio.get<Map<String, dynamic>>(
      '/ac/timetable',
      options: Options(headers: _authorization.basicHeader),
    );
    return decodeResponse(resp, GetTimetableResp.fromJson);
  }

  Future<XmuxApiResponse<Null>> updateStudentAttendance(
      String cid,
      DateTime timestamp,
      StudentAttendanceStatus status,
      List<String> update) async {
    var resp = await _dio.post<Map<String, dynamic>>(
      '/ac/attendance/update',
      data: {
        'cid': cid,
        'timestampS': timestamp.toUtc().toIso8601String() + '+0000',
        'status': 3 - status.index,
        'update': update
      },
      options: await _authorization.options,
    );
    return decodeResponse(resp, (_) => null);
  }
}
