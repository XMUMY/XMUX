library xmux.api_v3;

import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart';

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

class XMUXHttpClient {
  /// The real client that handle requests.
  /// It will be different due to the implementation of http package.
  final _client = Client();

  /// The locale used for `Accept-Language` in header.
  Locale get locale => window.locale;

  /// The url of API server.
  ///
  /// e.g. https://example.com
  String baseUrl;

  /// The version of APIs.
  int version;

  XMUXHttpClient(this.baseUrl, {int version}) : this.version = version ?? 3;

  Map<String, String> _withLocale() => {
        'Accept-Language': '${locale.languageCode}-${locale.countryCode},'
            '${locale.languageCode};q=0.9'
      };

  Future<Response> get(
    String api, {
    Authorization auth,
    bool withLocale = true,
    Map<String, String> additionalHeaders,
  }) async {
    var headers = {
      if (withLocale) ..._withLocale(),
      if (auth != null) ...auth.header,
      if (additionalHeaders != null) ...additionalHeaders,
    };

    var res = await _client.get('$baseUrl/v$version$api', headers: headers);
    return res;
  }

  Future<Response> post(
    String api,
    body, {
    Authorization auth,
    bool withLocale = true,
    Map<String, String> additionalHeaders,
  }) async {
    var headers = {
      if (withLocale) ..._withLocale(),
      if (auth != null) ...auth.header,
      if (additionalHeaders != null) ...additionalHeaders,
    };

    var res = await _client.post('$baseUrl/v$version$api',
        body: body, headers: headers);
    return res;
  }

  Future<Response> put(
    String api,
    body, {
    Authorization auth,
    bool withLocale = true,
    Map<String, String> additionalHeaders,
  }) async {
    var headers = {
      if (withLocale) ..._withLocale(),
      if (auth != null) ...auth.header,
      if (additionalHeaders != null) ...additionalHeaders,
    };

    var res = await _client.put('$baseUrl/v$version$api',
        body: body, headers: headers);
    return res;
  }

  Future<Response> patch(url,
      {Map<String, String> headers, body, Encoding encoding}) async {
    return _client.patch(url);
  }

  Future<Response> delete(url, {Map<String, String> headers}) async {
    return _client.delete(url);
  }
}
