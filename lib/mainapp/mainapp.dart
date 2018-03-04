import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:xmux/config.dart';
import 'package:xmux/initapp/init.dart';
import 'package:xmux/mainapp/mainpage.dart';
import 'package:xmux/mainapp/academic/gpacalculator/examresultpage.dart';
import 'package:xmux/mainapp/academic/gpacalculator/gpacalculator.dart';
import 'package:xmux/mainapp/academic/wolframengine/inputconstructor.dart';
import 'package:xmux/mainapp/explore/lostandfound/lostandfoundpage.dart';
import 'package:xmux/mainapp/settings/me.dart';
import 'package:xmux/mainapp/payment.dart';
import 'package:xmux/translations/translation.dart';

class MainApp extends StatelessWidget {
  final Store store;

  MainApp(this.store,{Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'XMUX',
        home: new HomePage(store),
        theme: defaultTheme,
        routes: <String, WidgetBuilder>{
          "/wolframengine/constructor": (BuildContext context) =>
              new InputConstructor(),
          "/acdemic/gpacalculator": (BuildContext context) =>
              new GPACalculatorPage(),
          "/acdemic/gpacalculator/examresult": (BuildContext context) =>
              new ExamResultPage(),
          "/me": (BuildContext context) => new MePage(),
          "/drawer/epayment": (BuildContext context) =>
              new PaymentPage(globalCalendarState.paymentData),
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
