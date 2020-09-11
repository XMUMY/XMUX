import 'dart:ui';

import 'package:dio/dio.dart';

import 'authorization.dart';
import 'common.dart';
import 'models/v3_bridge.dart';

export 'authorization.dart';
export 'common.dart' show XmuxApiResponse, XmuxApiException;
export 'models/v3_bridge.dart';

class XmuxApi {
  /// Unique instance of XMUXApi.
  static XmuxApi instance;

  /// HTTP client for API calls.
  final Dio _dio;

  /// Contains user credentials.
  final Authorization _authorization;

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
            '${window.locale?.languageCode ?? 'en'}-${window.locale?.countryCode ?? 'US'},'
            '${window.locale?.languageCode ?? 'en'};q=0.9';
      }));

    instance = XmuxApi._(dio, authorization);

    return instance;
  }

  XmuxApi._(this._dio, this._authorization);

  /// Configure authorization.
  void configure(
      {bool eraseAuthorization = false, Authorization authorization}) {
    if (eraseAuthorization) _authorization.erase();
    if (authorization != null) _authorization.mergeFrom(authorization);
  }

  // ** bridge **

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
