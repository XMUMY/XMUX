import 'package:flutter/material.dart';

class AppInfo {
  static const demoUsername = "XDemoUserNameX";
  static const demoPassword = "XDemoUserPasswordX";
}

class ApiKeyConfig {
  static const dialogflowToken = "XDialogflowTokenX";
  static const wolframAppID = "XWolframAppIDX";
  static const sentryDsn = "XSentryDsnX";
}

class BackendApiConfig {
  static const addresses = ["XBackendAddressesX"];
  static const resourceAddress = "XResourceAddressX";
  static const signInAddress = "XSignInAddressX";
}

class ThemeConfig {
  static ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.cyan,
    brightness: Brightness.light,
    primaryColor: Colors.cyan,
    primaryColorBrightness: Brightness.dark,
    accentColor: Colors.orangeAccent,
    accentColorBrightness: Brightness.dark,
    buttonColor: Colors.cyan[600],
  );
}
