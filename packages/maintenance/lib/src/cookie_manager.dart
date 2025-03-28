import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';

class CookieManager extends Interceptor {
  final CookieJar cookieJar;

  CookieManager(this.cookieJar);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    cookieJar.loadForRequest(options.uri).then((cookies) {
      var cookie = getCookies(cookies);
      if (cookie.isNotEmpty) {
        options.headers[HttpHeaders.cookieHeader] = cookie;
      }
      handler.next(options);
    }).catchError((e, stackTrace) {
      var err = DioException(
        requestOptions: options,
        error: e,
        stackTrace: stackTrace,
      );
      handler.reject(err, true);
    });
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _saveCookies(response)
        .then((_) => handler.next(response))
        .catchError((e, stackTrace) {
      var err = DioException(
        requestOptions: response.requestOptions,
        error: e,
        stackTrace: stackTrace,
      );
      handler.reject(err, true);
    });
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      _saveCookies(err.response!)
          .then((_) => handler.next(err))
          .catchError((e, stackTrace) {
        handler.next(DioException(
          requestOptions: err.response!.requestOptions,
          error: e,
          stackTrace: stackTrace,
        ));
      });
    } else {
      handler.next(err);
    }
  }

  Future<void> _saveCookies(Response response) async {
    var cookies = response.headers[HttpHeaders.setCookieHeader];

    if (cookies != null) {
      await cookieJar.saveFromResponse(
        response.requestOptions.uri,
        cookies.map((str) {
          var origin = str.split(';').first.split('=').last;
          str = str.replaceFirst(origin, Uri.encodeComponent(origin));
          return Cookie.fromSetCookieValue(str);
        }).toList(),
      );
    }
  }

  static String getCookies(List<Cookie> cookies) {
    return cookies
        .map((cookie) => '${cookie.name}=${Uri.decodeComponent(cookie.value)}')
        .join('; ');
  }
}
