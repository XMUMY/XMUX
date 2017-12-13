import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xmux/config.dart';
import 'package:xmux/init.dart';
import 'package:xmux/engine/inputconstructor.dart';
import 'package:xmux/homepage.dart';

void main() {
  mainFunc();
}

Future mainFunc() async {
  runApp(new InitPage());

  if (await init())
    runMainApp();
}

void runMainApp(){
  runApp(
    new MaterialApp(
      title: 'XMUX',
      home: new HomePage(),
      theme: defaultTheme,
      routes: <String, WidgetBuilder>{
        "/engine/constructor": (
            BuildContext context) => new InputConstructor(),
      },
    ),
  );
}
