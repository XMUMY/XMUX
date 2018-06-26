import 'package:flutter/material.dart';

class AppInfo {
  static const demoUsername = "";
  static const demoPassword = "";
}

class WolframConfig {
  static const appID = "";
}

class BackendApiConfig {
  static const addresses = [""];
  static const resourceAddress = "";
  static const signInAddress = "";
}

final ThemeData iOSTheme = new ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
  accentColor: Colors.grey[300],
);

final ThemeData defaultTheme = new ThemeData(
  primarySwatch: Colors.cyan,
  primaryColorBrightness: Brightness.dark,
  accentColor: Colors.purpleAccent,
  accentColorBrightness: Brightness.dark,
  buttonColor: Colors.lightBlue,
);