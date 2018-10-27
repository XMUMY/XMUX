import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalendarHandler {
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
