import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';

class NBCookieManager extends Interceptor {
  /// Cookie manager for http requests。Learn more details about
  /// CookieJar please refer to [cookie_jar](https://github.com/flutterchina/cookie_jar)
  final CookieJar cookieJar;

  NBCookieManager(this.cookieJar);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var cookies = await cookieJar.loadForRequest(options.uri);
    cookies.removeWhere((cookie) {
      if (cookie.expires != null) {
        return cookie.expires.isBefore(DateTime.now());
      }
      return false;
    });
    String cookie = getCookies(cookies);
    if (cookie.isNotEmpty) options.headers[HttpHeaders.cookieHeader] = cookie;
  }

  @override
  Future onResponse(
          Response response, ResponseInterceptorHandler handler) async =>
      _saveCookies(response);

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async =>
      _saveCookies(err.response);

  _saveCookies(Response response) {
    if (response != null && response.headers != null) {
      List<String> cookies = response.headers[HttpHeaders.setCookieHeader];
      if (cookies != null) {
        cookieJar.saveFromResponse(
          response.requestOptions.uri,
          cookies.map((str) {
            var origin = str.split(';').first.split('=').last;
            str = str.replaceFirst(origin, Uri.encodeComponent(origin));
            return Cookie.fromSetCookieValue(str);
          }).toList(),
        );
      }
    }
  }

  static String getCookies(List<Cookie> cookies) {
    return cookies
        .map((cookie) => "${cookie.name}=${Uri.decodeComponent(cookie.value)}")
        .join('; ');
  }
}
