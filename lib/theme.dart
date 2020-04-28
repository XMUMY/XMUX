import 'package:flutter/material.dart';

/// Theme of app.
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
