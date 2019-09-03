import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xmux/components/transition_builders.dart';
import 'package:xmux/init/login_page.dart';
import 'package:xmux/init/register_page.dart';
import 'package:xmux/translations/translation.dart';

class LoginApp extends StatelessWidget {
  final String message;

  const LoginApp({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.grey[300],
        // Rewrite page transition to fade transition.
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map.fromIterable(
            TargetPlatform.values,
            value: (_) => FadePageTransitionsBuilder(),
          ),
        ),
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
      routes: <String, WidgetBuilder>{
        '/Register': (_) => Scaffold(body: RegisterPage()),
      },
    );
  }
}
