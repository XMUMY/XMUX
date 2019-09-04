import 'package:flutter/material.dart';

class ApiKeyConfig {
  static const dialogflowToken = "XDialogflowTokenX";
  static const wolframAppID = "XWolframAppIDX";
  static const sentryDsn = "XSentryDsnX";
}

class BackendApiConfig {
  static const address = "XBackendAddressX";
  static const websiteAddress = "XWebsiteAddressX";
  static const attendanceAddress = "XAttendanceAddressX";
}

class ThemeConfig {
  static ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.cyan,
    brightness: Brightness.light,
    primaryColor: Colors.cyan,
    primaryColorBrightness: Brightness.dark,
    accentColor: Colors.orangeAccent,
    accentColorBrightness: Brightness.dark,
  );

  static ThemeData defaultDarkTheme = ThemeData(
    primarySwatch: Colors.cyan,
    brightness: Brightness.dark,
  );
}
