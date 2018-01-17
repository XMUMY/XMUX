import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xmux/config.dart';
import 'package:xmux/loginapp/loginpage.dart';
import 'package:xmux/translations/translation.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new MaterialApp(
        theme: defaultTheme,
        home: new LoginPage(),
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
