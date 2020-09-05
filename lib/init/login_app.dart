import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:xmux/components/transition_builders.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/init/login_page.dart';
import 'package:xmux/init/register_page.dart';
import 'package:xmux/modules/firebase/firebase.dart';

class LoginApp extends StatelessWidget {
  /// Message to show on login page. (can be l10n keys)
  /// e.g. Version deprecated. / Password changed.
  final String message;

  const LoginApp({this.message = ''});

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
        routes: {
          '/Register': (_) => Scaffold(body: RegisterPage()),
        },
        navigatorObservers: <NavigatorObserver>[
          // Only trace in release mode.
          if (P.isVM && bool.fromEnvironment('dart.vm.product'))
            FirebaseAnalyticsObserver(analytics: Firebase.analytics),
        ],
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
