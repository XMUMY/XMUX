import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xmux/config.dart';
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

  static Future<Map<String, dynamic>> ePaymentAuth(
      String id, String password) async {
    var response = await http.post(BackendApiConfig.address + "/bill", body: {
      "id": id,
      "pass": password,
    });
    if (response.statusCode >= 300) {
      return {"error": response.reasonPhrase};
    }
    Map resJson = jsonDecode(response.body);
    if (resJson.containsKey("error")) {
      String error = resJson["error"];
      return {"error": error};
    }

    mainAppStore.dispatch(UpdateEPaymentPasswordAction(password));
    resJson.addAll({"success": true});
    return resJson;
  }

  static Future<String> firebaseLogin() async {
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
