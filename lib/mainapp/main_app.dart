import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/academic/exam_result.dart';
import 'package:xmux/mainapp/academic/gpa_calculator.dart';
import 'package:xmux/mainapp/academic/wolfram_engine/input_constructor.dart';
import 'package:xmux/mainapp/explore/lost_and_found/lost_and_found_page.dart';
import 'package:xmux/mainapp/main_page.dart';
import 'package:xmux/mainapp/settings/me.dart';
import 'package:xmux/mainapp/tools/epayment.dart';
import 'package:xmux/translations/translation.dart';

class MainApp extends StatelessWidget {
  MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: mainAppStore,
      child: new MaterialApp(
        title: 'XMUX',
        home: new HomePage(),
        theme: defaultTheme,
        routes: <String, WidgetBuilder>{
          "/wolframengine/constructor": (BuildContext context) =>
              new InputConstructor(),
          "/acdemic/gpacalculator": (BuildContext context) =>
              new GPACalculatorPage(),
          "/acdemic/gpacalculator/examresult": (BuildContext context) =>
              new ExamResultPage(),
          "/me": (BuildContext context) => new MePage(),
          "/tools/epayment": (BuildContext context) => new EPaymentPage(),
          "/explore/lostandfound": (BuildContext context) =>
              new LostAndFoundPage(),
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          MainLocalizationsDelegate.delegate,
        ],
        supportedLocales: [
          const Locale('zh', 'CN'),
          const Locale('en', 'US'),
        ],
      ),
    );
  }
}
