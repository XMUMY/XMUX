import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'app.dart';
import 'global.dart';
import 'init/init.dart';

void main() {
  // Attach Flutter app.
  runApp(
    StoreProvider(
      store: store,
      child: const App(),
    ),
  );

  // Start initialization.
  init();
}
