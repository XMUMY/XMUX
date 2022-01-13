import 'package:easy_localization/easy_localization.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sentry/sentry.dart';

import 'app.dart';
import 'config.dart';
import 'global.dart';
import 'init/init.dart';

void main() {
  timeago.setLocaleMessages('zh', timeago.ZhCnMessages());
  timeago.setLocaleMessages('et', timeago.EnShortMessages());
  // Wrap by sentry client.
  if (kReleaseMode) {
    Sentry.init(
      (options) => options..dsn = sentryDsn,
      appRunner: run,
    );
  } else {
    run();
  }
}

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Attach Flutter app.
  runApp(
    EasyLocalization(
      path: 'res/translation',
      supportedLocales: const [
        Locale('en'),
        Locale('zh', 'CN'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      ],
      fallbackLocale: const Locale('en'),
      saveLocale: false,
      child: StoreProvider(
        store: store,
        child: const App(),
      ),
    ),
  );

  // Start initialization.
  init();
}
