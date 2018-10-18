import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/calendar/calendar_handler.dart';
import 'package:xmux/redux/redux.dart';

class LoginHandler {
  static Future<String> login(String id, String password) async {
    print("Login with uid: $id");

    // Get response from backend.
    var response = await backend.post("/v2/login", {
      "id": id,
      "pass": password,
    });

    // When error.
    if (response.statusCode != 200) return response.reasonPhrase;

    Map responseMap = jsonDecode(response.body);
    if (responseMap["status"] == "error") return responseMap["error"];

    // Dispatch LoginAction.
    mainAppStore.dispatch(LoginAction(id, password, responseMap["moodleKey"]));

    mainAppStore.dispatch(UpdateAcAction());
    CalendarHandler.assignmentUpdate().timeout(Duration(seconds: 10));

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
