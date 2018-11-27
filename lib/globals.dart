import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';
import 'package:redux/redux.dart';
import 'package:sentry/sentry.dart';
import 'package:xmux/config.dart';
import 'package:xmux/modules/xia/xia.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';
import 'package:xmux/translations/translation.dart';

/// Firebase messaging instance.
final firebaseMessaging = FirebaseMessaging();

/// Firebase user instance.
///
/// Default is `null`. Will be assigned by FirebaseUser when logged in.
FirebaseUser firebaseUser;

/// Package information from platform.
///
/// Default is `null`. Will be assigned during init.
PackageInfo packageInfo;

final SentryClient sentry = SentryClient(dsn: ApiKeyConfig.sentryDsn);

/// Main store for redux.
final store = Store<MainAppState>(appReducer,
    initialState: MainAppState.def(),
    middleware: [apiRequestMiddleware, saveMiddleware]);

/// Instance of XiA.
///
/// Default is `null`. Will be assigned during init.
XiA xiA;

/// XMUX API instance.
///
/// Default is `null`. Will be selected during init.
XMUXApi xmuxApi;

/// Function for internationalization.
/// It will return localized text if available and return origin text if error.
String i18n(String text, BuildContext context, {String app}) {
  try {
    switch (app) {
      case 'l':
        return LoginLocalizations.of(context).get(text) ?? text;
      default:
        return MainLocalizations.of(context).get(text) ?? text;
    }
  } catch (_) {
    return text;
  }
}
