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
      runApp(new LoginApp());
      break;
    case "Finished":
      runApp(new MainApp());
  }
}
