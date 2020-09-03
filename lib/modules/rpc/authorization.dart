import 'dart:async';
import 'dart:convert';

class Authorization {
  /// Basic.
  String _username, _password;
  String get username => _username;
  String get password => _password;

  /// Bearer.
  Future<String> get bearerToken => _bearerRefresher();

  /// Function to generate bearer token.
  Future<String> Function() _bearerRefresher;

  Authorization();

  Authorization.basic(this._username, this._password);

  Authorization.bearer(this._bearerRefresher);

  FutureOr<void> provider(Map<String, String> metadata, String uri) async {
    if (!metadata.containsKey('authorization') &&
        _username != null &&
        _password != null)
      metadata['authorization'] =
          'basic ${base64Encode(utf8.encode('$_username:$_password'))}';
  }

  /// Erase all information stored.
  void erase() {
    _username = _password = null;
    _bearerRefresher = null;
  }

  /// Get authorizations from other.
  void mergeFrom(Authorization authorization) {
    _username = authorization._username ?? _username;
    _password = authorization._password ?? _password;
    _bearerRefresher = authorization._bearerRefresher ?? _bearerRefresher;
  }
}
