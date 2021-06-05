import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tuple/tuple.dart';

import 'init/init_page.dart';
import 'init/login_page.dart';
import 'main/main_page.dart';
import 'redux/state/state.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XMUX',
      theme: ThemeData(primarySwatch: Colors.cyan),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      home: Scaffold(
        body: StoreConnector<AppState, Tuple2<bool, bool>>(
          converter: (s) => Tuple2(
            s.state.isInitialized,
            s.state.user.isSignedIn,
          ),
          builder: (context, s) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: !s.item1
                ? const InitPage()
                : s.item2
                    ? const MainPage()
                    : const LoginPage(),
          ),
        ),
      ),
    );
  }
}
