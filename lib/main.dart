import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'app.dart';
import 'global.dart';
import 'init/init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Attach Flutter app.
  runApp(
    EasyLocalization(
      path: 'res/translation',
      supportedLocales: const [
        Locale('en'),
        Locale('zh', 'CN'),
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
