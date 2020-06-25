import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:xmux/components/transition_builders.dart';
import 'package:xmux/init/login_page.dart';
import 'package:xmux/init/register_page.dart';

class LoginApp extends StatelessWidget {
  final String message;

  const LoginApp({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var app = Builder(
      builder: (context) => MaterialApp(
        theme: ThemeData.dark().copyWith(
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
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        routes: <String, WidgetBuilder>{
          '/Register': (_) => Scaffold(body: RegisterPage()),
        },
      ),
    );

    return EasyLocalization(
      supportedLocales: [Locale('en'), Locale('zh', 'CN')],
      path: 'res/translations',
      fallbackLocale: Locale('en'),
      child: app,
    );
  }
}
