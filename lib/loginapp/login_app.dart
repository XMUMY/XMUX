import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xmux/loginapp/login_page.dart';
import 'package:xmux/translations/translation.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new MaterialApp(
        theme: new ThemeData(
            brightness: Brightness.dark,
            accentColor: Colors.grey[300],
            buttonColor: Colors.cyan),
        home: new Scaffold(body: new LoginPage()),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          LoginLocalizationsDelegate.delegate,
        ],
        supportedLocales: [
          const Locale('zh', 'CN'),
          const Locale('en', 'US'),
        ],
      );
}
