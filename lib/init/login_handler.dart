import 'dart:async';

import 'package:dio/dio.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

@deprecated
class LoginHandler {
  static Future<String> campus(String id, String password) async {
    print('LoginHandler: Login: $id');

    try {
      // Get response from backend.
      var res = await XMUXApi.instance
          .login(XMUXApiAuth(campusID: id, campusIDPassword: password));
    } catch (e) {
      return e.message ?? e.toString();
    }

    return 'success';
  }

  static Future<Null> createUser() async {
    print('LoginHandler: Creating user: ${store.state.authState.campusID}');

    try {
      await XMUXApi.instance.createUser(
          XMUXApiAuth(
              campusID: store.state.authState.campusID,
              campusIDPassword: store.state.authState.campusIDPassword),
          User(store.state.authState.campusID, firebaseUser.displayName,
              firebaseUser.photoUrl));
    } on DioError catch (e) {
      if (e.response != null)
        print('LoginHandler: Failed to create: ${e.response.data['error']}');
    } catch (e) {
      return;
    }
  }
}
