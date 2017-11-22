import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xmux/HomePage.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'XMUX',
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        // "/": (BuildContext context) => new HomePage(),
      },
    ),
  );
}

