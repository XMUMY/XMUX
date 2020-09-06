import 'package:flutter/material.dart';

/// Theme of app.
class ThemeConfig {
  static ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.cyan,
    brightness: Brightness.light,
    primaryColor: Colors.cyan[600],
    primaryColorBrightness: Brightness.dark,
    accentColor: Colors.orangeAccent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: Colors.white,
    ),
    navigationRailTheme: NavigationRailThemeData(
      selectedIconTheme: IconThemeData(color: Colors.white),
      unselectedIconTheme: IconThemeData(color: Colors.white),
      selectedLabelTextStyle: TextStyle(color: Colors.white),
      unselectedLabelTextStyle: TextStyle(color: Colors.white),
    ),
  );

  static ThemeData defaultDarkTheme = ThemeData(
    primarySwatch: Colors.cyan,
    brightness: Brightness.dark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: Colors.white,
    ),
    navigationRailTheme: NavigationRailThemeData(
      selectedIconTheme: IconThemeData(color: Colors.white),
      unselectedIconTheme: IconThemeData(color: Colors.white),
      selectedLabelTextStyle: TextStyle(color: Colors.white),
      unselectedLabelTextStyle: TextStyle(color: Colors.white),
    ),
  );
}
