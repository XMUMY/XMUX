import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';
import 'package:redux/redux.dart';
import 'package:sentry/sentry.dart';
import 'package:xmux/modules/api/xmux_api.dart';
import 'package:xmux/modules/moodle/moodle.dart';
import 'package:xmux/modules/rpc/rpc.dart';

import 'config.dart';
import 'init/login_app.dart';
import 'modules/xia/xia.dart';
import 'redux/redux.dart';
import 'translations/translation.dart';

/// XMUX RPC client.
final XmuxRpc rpc = XmuxRpc(BackendApiConfig.address);

/// Moodle webservice API.
final MoodleApi moodleApi = MoodleApi(BackendApiConfig.moodleAddress);

/// Package information from platform.
///
/// Default to fallback values. Will be replaced during init if plugin supported.
PackageInfo packageInfo = PackageInfo(
  appName: 'XMUX',
  packageName: 'io.xdea.xmux',
  version: AppConfig.fallbackVersion,
  buildNumber: AppConfig.fallbackBuild.toString(),
);

/// Sentry client. Handle unhandled exception.
final SentryClient sentry =
    SentryClient(SentryOptions(dsn: ApiKeyConfig.sentryDsn));

/// Main store for redux.
final store = Store<MainAppState>(
  appReducer,
  initialState: MainAppState.def(),
  middleware: [apiRequestMiddleware, saveMiddleware],
);

/// Instance of XiA.
///
/// Default is `null`. Will be assigned during init.
XiA xiA;

/// Function for internationalization.
/// It will return localized text if available and return origin text if error.
String i18n(String text, BuildContext context, {String app}) {
  try {
    switch (app) {
      default:
        return MainLocalizations.of(context).get(text) ?? text.split('/').last;
    }
  } catch (_) {
    return text;
  }
}

/// Handle logout and run `LoginApp`.
Future<Null> logout({String message = ''}) async {
  await FirebaseAuth.instance.signOut();
  rpc.authorization.erase();
  XmuxApi.instance.configure(eraseAuthorization: true);
  moodleApi.signOut();
  store.dispatch(LogoutAction());
  runApp(LoginApp(message: message));
}

/// Platform information.
class P {
  static final isWeb = kIsWeb;
  static final isVM = !kIsWeb;

  static final isAndroid = isVM && Platform.isAndroid;
  static final isIOS = isVM && Platform.isIOS;
  static final isMobile = isVM && (isAndroid || isIOS);

  static final isMacOS = isVM && Platform.isMacOS;
  static final isWindows = isVM && Platform.isWindows;
  static final isLinux = isVM && Platform.isLinux;
  static final isDesktop = isVM && (isMacOS || isWindows || isLinux);
}
