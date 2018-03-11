import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/initapp/init.dart';
import 'package:xmux/initapp/initpage.dart';
import 'package:xmux/loginapp/loginapp.dart';
import 'package:xmux/mainapp/mainapp.dart';

Future main() async {
  runApp(new InitPage());

  switch (await init(mainAppStore)) {
    case "NotLogin":
    case "LoginError":
      runApp(new LoginApp());
      break;
    case "Finished":
      print("1--" + mainAppStore.hashCode.toString());
      runApp(new MainApp(mainAppStore));
  }
}
