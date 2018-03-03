import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xmux/initapp/init.dart';
import 'package:xmux/initapp/initpage.dart';
import 'package:xmux/loginapp/loginapp.dart';
import 'package:xmux/mainapp/mainapp.dart';

Future main() async {
  runApp(new InitPage());

  switch (await init()) {
    case "NotLogin":
    case "LoginError":
      runLoginApp();
      break;
    case "Finished":
      runMainApp();
  }
}

void runMainApp() {
  runApp(new MainApp());
}

void runLoginApp() {
  runApp(new LoginApp());
}
