import 'dart:ui';

import 'package:dio/dio.dart';

import 'authorization.dart';
import 'v3_lost_and_found.dart';

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
      connectTimeout: 5000,
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
}
