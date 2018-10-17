import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/redux.dart';

class CalendarHandler {
  static Future<String> assignmentUpdate() async {
    print("CalendarHandler: Updating Assignment.");

    // Get response from backend.
    var response = await backend.post("/moodle/assignment", {
      "id": mainAppStore.state.personalInfoState.uid,
      "pass": mainAppStore.state.personalInfoState.password,
    });

    // Check error.
    if (response.statusCode >= 400) return response.reasonPhrase;

    // Update acState.
    mainAppStore.dispatch(UpdateAssignmentsAction(jsonDecode(response.body)));

    return "success";
  }

  static Future<String> getIP(BuildContext context) async {
    print("CalendarHandler: Getting IP address.");

    try {
      // Invoke method channel.
      final String result =
          await MethodChannel('OSUtilities').invokeMethod('getIPAddress');
      print("CalendarHandler: Got IP: $result");
      return result;
    } catch (e) {
      // When error
      print("CalendarHandler: Get IP error: ${e.toString()}");
      return null;
    }
  }
}
