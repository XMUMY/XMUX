import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/calendar/calendar_handler.dart';
import 'package:xmux/redux/actions.dart';

class LoginHandler {
  static Future<String> login(
      String id, String password, BuildContext context) async {
    print("Login with uid: $id");

    // Get response from backend.
    var response =
        await BackendApiHandler.post(context: context, api: "/v2/login", body: {
      "id": id,
      "pass": password,
    });

    // When error.
    if (response.statusCode >= 300) return response.reasonPhrase;

    Map responseMap = jsonDecode(response.body);
    if (responseMap["status"] == "error") return responseMap["error"];

    // Dispatch LoginAction.
    mainAppStore.dispatch(LoginAction(id, password, responseMap["moodleKey"]));

    CalendarHandler.acUpdate().timeout(Duration(seconds: 10));
    CalendarHandler.assignmentUpdate().timeout(Duration(seconds: 10));

    return "success";
  }

  static Future<String> firebaseLogin() async {
    print(
        "Login firebase with uid: ${mainAppStore.state.personalInfoState.uid}");

    try {
      firebaseUser = (await FirebaseAuth.instance.currentUser()) ??
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: mainAppStore.state.personalInfoState.uid + "@xmu.edu.my",
              password: mainAppStore.state.personalInfoState.password);
    } catch (e) {
      return e.toString();
    }

    return "success";
  }
}
