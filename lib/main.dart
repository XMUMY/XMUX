import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:xmux/homepage.dart';
import 'package:xmux/engine/inputconstructor.dart';

EventBus loginEventBus = new EventBus();

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

