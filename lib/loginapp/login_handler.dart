import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';

class LoginHandler {
  static Future<String> login(String id, String password) async {
    print("Login with uid: $id");

    try {
      // Get response from backend.
      var res = await xmuxApi
          .login(XMUXApiAuth(campusID: id, campusIDPassword: password));
      // Dispatch LoginAction.
      mainAppStore.dispatch(LoginAction(
          XMUXApiAuth(campusID: id, campusIDPassword: password),
          res.moodleKey));
    } catch (e) {
      return e.toString();
    }

    mainAppStore.dispatch(UpdateAcAction());
//    CalendarHandler.assignmentUpdate().timeout(Duration(seconds: 10));

    return "success";
  }

  static Future<String> firebaseLogin() async {
    print("Login firebase with uid: ${mainAppStore.state.authState.campusID}");

    try {
      firebaseUser = (await FirebaseAuth.instance.currentUser()) ??
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: mainAppStore.state.authState.campusID + "@xmu.edu.my",
              password: mainAppStore.state.authState.campusIDPassword);
    } catch (e) {
      return e.toString();
    }

    return "success";
  }
}
