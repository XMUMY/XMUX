import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/actions.dart';

class CalendarHandler {
  static Future<Null> acUpdate({BuildContext context}) async {
    print("CalendarHandler: Updating AC.");

    // Get response from backend.
    var response =
        await BackendApiHandler.post(context: context, api: "/v2/ac", body: {
      "id": mainAppStore.state.personalInfoState.uid,
      "pass": mainAppStore.state.personalInfoState.password,
    });

    // Check error
    if (response.statusCode >= 400) return response.reasonPhrase;

    // Update acState
    if ((jsonDecode(response.body) as Map).isNotEmpty)
      mainAppStore
          .dispatch(UpdateACAction(acInitMap: jsonDecode(response.body)));
  }

  static Future<Null> assignmentUpdate({BuildContext context}) async {
    print("CalendarHandler: Updating Assignment.");

    // Get response from backend.
    var response = await BackendApiHandler
        .post(context: context, api: "/moodle/assignment", body: {
      "id": mainAppStore.state.personalInfoState.uid,
      "pass": mainAppStore.state.personalInfoState.password,
    });

    // Check error
    if (response.statusCode >= 400) return response.reasonPhrase;

    // Update acState
    if ((jsonDecode(response.body) as List).isNotEmpty)
      mainAppStore
          .dispatch(UpdateACAction(assignments: jsonDecode(response.body)));
  }

  static Future<Null> getIP(BuildContext context) async {
    try {
      final String result =
          await const MethodChannel('OSUtilities').invokeMethod('getIPAddress');
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(result)));
    } on PlatformException catch (_) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("error")));
    }
  }
}
