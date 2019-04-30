import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';

class LoginHandler {
  static Future login() {}

  static Future<String> campus(String id, String password) async {
    print('LoginHandler: Login: $id');

    try {
      // Get response from backend.
      var res = await XMUXApi.instance
          .login(XMUXApiAuth(campusID: id, campusIDPassword: password));
      // Dispatch LoginAction.
      store.dispatch(LoginAction(
          XMUXApiAuth(campusID: id, campusIDPassword: password),
          res.moodleKey));
    } catch (e) {
      return e.message ?? e.toString();
    }

    return 'success';
  }

  static Future<String> firebaseLogin() async {
    print('LoginHandler: Login firebase: ${store.state.authState.campusID}');

    try {
      firebaseUser = (await FirebaseAuth.instance.currentUser()) ??
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: store.state.authState.campusID + '@xmu.edu.my',
              password: store.state.authState.campusIDPassword);
    } on PlatformException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }

    return 'success';
  }

  static Future<Null> createUser() async {
    print('LoginHandler: Creating user: ${store.state.authState.campusID}');

    try {
      await XMUXApi.instance.createUser(
          XMUXApiAuth(
              campusID: store.state.authState.campusID.toLowerCase(),
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
