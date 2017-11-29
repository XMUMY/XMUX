import 'package:flutter/material.dart';
import 'package:xmux/homepage.dart';
import 'package:xmux/engine/inputconstructor.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'XMUX',
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
//        "/": (BuildContext context) => new HomePage(),
        "/engine/constructor": (BuildContext context) => new InputConstructor(),
      },
    ),
  );
}

