import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tuple/tuple.dart';

import 'global.dart';
import 'redux/state/state.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Tuple2>(
      distinct: true,
      converter: (s) => Tuple2(
        store.state.settings.showPerformanceOverlay,
        store.state.settings.showSemanticsDebugger,
      ),
      builder: (context, vm) => MaterialApp.router(
        title: 'XMUX',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.system,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        showPerformanceOverlay: vm.item1,
        showSemanticsDebugger: vm.item2,
      ),
    );
  }
}
