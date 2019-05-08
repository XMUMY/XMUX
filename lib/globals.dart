import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';
import 'package:redux/redux.dart';
import 'package:sentry/sentry.dart';

import 'config.dart';
import 'init/login_app.dart';
import 'modules/xia/xia.dart';
import 'redux/redux.dart';
import 'translations/translation.dart';

/// Firebase analytics instance.
final firebaseAnalytics = FirebaseAnalytics();

/// Firebase messaging instance.
final firebaseMessaging = FirebaseMessaging();

/// Firebase remote config instance.
///
/// Default is `null`. Will be assigned during init.
RemoteConfig firebaseRemoteConfig;

/// Firebase user instance.
///
/// Default is `null`. Will be assigned by FirebaseUser when logged in.
FirebaseUser firebaseUser;

/// Package information from platform.
///
/// Default is `null`. Will be assigned during init.
PackageInfo packageInfo;

/// Sentry client. Handle unhandled exception.
final SentryClient sentry = SentryClient(dsn: ApiKeyConfig.sentryDsn);

/// Main store for redux.
final store = Store<MainAppState>(appReducer,
    initialState: MainAppState.def(),
    middleware: [apiRequestMiddleware, saveMiddleware]);

/// Instance of XiA.
///
/// Default is `null`. Will be assigned during init.
XiA xiA;

/// Function for internationalization.
/// It will return localized text if available and return origin text if error.
String i18n(String text, BuildContext context, {String app}) {
  try {
    switch (app) {
      case 'l':
        return LoginLocalizations.of(context).get(text) ?? text.split('/').last;
      default:
        return MainLocalizations.of(context).get(text) ?? text.split('/').last;
    }
  } catch (_) {
    return text;
  }
}

/// Handle logout and run `LoginApp`.
Future<Null> logout({String message}) async {
  await FirebaseAuth.instance.signOut();
  firebaseUser = null;
  store.dispatch(LogoutAction());
  runApp(LoginApp(message: message));
}
