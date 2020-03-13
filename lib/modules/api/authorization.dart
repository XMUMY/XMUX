import 'dart:convert';

import 'package:dio/dio.dart';

class Authorization {
  /// Basic.
  String username, password;

  /// Bearer.
  String bearerToken;

  /// Function to generate bearer token.
  Future<String> Function() bearerRefresher;

  Authorization();

  Authorization.basic(this.username, this.password);

  Authorization.bearer(this.bearerToken);

  Map<String, String> get basicHeader => {
        'authorization':
            'basic ${base64Encode(utf8.encode('$username:$password'))}'
      };

  Map<String, String> get bearerHeader =>
      {'authorization': 'bearer $bearerToken'};

  Future<Map<String, String>> get bearerHeaderWithRefresh async =>
      {'authorization': 'bearer ${await bearerRefresher()}'};

  /// Try to construct authorization header by:
  /// Bearer Token > Refresher > Basic
  Future<Map<String, String>> get header async {
    String authorization = '';
    if (bearerToken != null && bearerToken.isNotEmpty)
      authorization = 'bearer $bearerToken';
    else if (bearerRefresher != null)
      authorization = 'bearer ${await bearerRefresher()}';
    else if (username != null && username.isNotEmpty)
      authorization =
          'basic ${base64Encode(utf8.encode('$username:$password'))}';
    return {'authorization': authorization};
  }

  /// Get a Dio options that contains authorization header.
  Future<Options> get options async => Options(headers: await header);

  /// Erase all information stored.
  void erase() {
    bearerToken = username = password = null;
    bearerRefresher = null;
  }

  /// Get authorizations from other.
  void mergeFrom(Authorization authorization) {
    username = authorization.username ?? username;
    password = authorization.password ?? password;
    bearerToken = authorization.bearerToken ?? bearerToken;
    bearerRefresher = authorization.bearerRefresher ?? bearerRefresher;
  }
}
