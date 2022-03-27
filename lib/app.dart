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
    const pageTransitionsTheme = PageTransitionsTheme(builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.windows: ZoomPageTransitionsBuilder(),
    });

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
          pageTransitionsTheme: pageTransitionsTheme,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          pageTransitionsTheme: pageTransitionsTheme,
        ),
        themeMode: ThemeMode.system,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        showPerformanceOverlay: vm.item1,
        showSemanticsDebugger: vm.item2,
      ),
    );
  }
}
