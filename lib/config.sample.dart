import 'package:flutter/material.dart';

class AppInfo {
  static const demoUsername = "XDemoUserNameX";
  static const demoPassword = "XDemoUserPasswordX";
}

class ApiKeyConfig {
  static const wolframAppID = "XWolframAppIDX";
  static const dialogflowToken = "XDialogflowTokenX";
}

class BackendApiConfig {
  static const addresses = ["XBackendAddressesX"];
  static const resourceAddress = "XResourceAddressX";
  static const signInAddress = "XSignInAddressX";
}

class ThemeConfig {
  static ThemeData iOSTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light,
    accentColor: Colors.grey[300],
  );

  static ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.cyan,
    brightness: Brightness.light,
    primaryColor: Colors.cyan,
    primaryColorBrightness: Brightness.dark,
    accentColor: Colors.orangeAccent,
    accentColorBrightness: Brightness.dark,
    buttonColor: Colors.lightBlue,
  );
}