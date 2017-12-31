import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xmux/academic/gpacalculator.dart';
import 'package:xmux/academic/wolframengine/inputconstructor.dart';
import 'package:xmux/config.dart';
import 'package:xmux/explore/lostandfound/lostandfoundpage.dart';
import 'package:xmux/identity/me.dart';
import 'package:xmux/init.dart';
import 'package:xmux/homepage.dart';
import 'package:xmux/payment.dart';
import 'package:xmux/translate.dart';

void main() {
  mainFunc();
}

Future mainFunc() async {
  runApp(new InitPage());

  if (await init()) runMainApp();
}

void runMainApp() {
  runApp(
    new MaterialApp(
      title: 'XMUX',
      home: new HomePage(),
      theme: defaultTheme,
      routes: <String, WidgetBuilder>{
        "/wolframengine/constructor": (BuildContext context) => new InputConstructor(),
        "/acdemic/gpacalculator": (BuildContext context) => new GPACalculatorPage(),
        "/me":(BuildContext context) => new MePage(),
        "/drawer/epayment": (BuildContext context) =>
        new PaymentPage(globalCalendarState.paymentData),
        "/explore/lostandfound":(BuildContext context) => new LostAndFoundPage(),
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
