import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xmux/config.dart';
import 'package:xmux/tools/gpacalculator.dart';
import 'package:xmux/init.dart';
import 'package:xmux/engine/inputconstructor.dart';
import 'package:xmux/homepage.dart';
import 'package:xmux/identity/payment.dart';

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
        "/engine/constructor": (BuildContext context) => new InputConstructor(),
        "/epayment": (BuildContext context) =>
            new PaymentPage(globalCalendarState.paymentData),
        "/gpa": (BuildContext context) => new GPACalculatorPage(),
      },
    ),
  );
}
