import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xmux/initapp/login_page.dart';
import 'package:xmux/translations/translation.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.grey[300],
        ),
        home: Scaffold(body: LoginPage()),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          LoginLocalizationsDelegate.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('zh', 'CN'),
        ],
      );
}
