import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xmux/initapp/init.dart';
import 'package:xmux/initapp/init_page.dart';
import 'package:xmux/loginapp/login_app.dart';
import 'package:xmux/mainapp/main_app.dart';

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
