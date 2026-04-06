import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'business/redux/state/state.dart';
import 'business/redux/store.dart';
import 'foundation/localization/localized.dart';
import 'foundation/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Localized(
      child: StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, (bool, bool)>(
          distinct: true,
          converter: (store) => (
            store.state.settings.showPerformanceOverlay,
            store.state.settings.showSemanticsDebugger,
          ),
          builder: (context, state) => MaterialApp.router(
            title: 'XMUX',
            theme: ThemeData(colorSchemeSeed: Colors.cyan),
            darkTheme: ThemeData(brightness: Brightness.dark),
            themeMode: ThemeMode.system,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            showPerformanceOverlay: state.$1,
            showSemanticsDebugger: state.$2,
          ),
        ),
      ),
    );
  }
}
