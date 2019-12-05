import 'dart:async';

import 'package:dio/dio.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

@deprecated
class LoginHandler {
  static Future<Null> createUser() async {
    print('LoginHandler: Creating user: ${store.state.user.campusId}');

    try {
      await XMUXApi.instance.createUser(
          XMUXApiAuth(
              campusID: store.state.user.campusId,
              campusIDPassword: store.state.user.password),
          User(store.state.user.campusId, firebaseUser.displayName,
              firebaseUser.photoUrl));
    } on DioError catch (e) {
      if (e.response != null)
        print('LoginHandler: Failed to create: ${e.response.data['error']}');
    } catch (e) {
      return;
    }
  }
}
