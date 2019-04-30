import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xmux/init/init.dart';
import 'package:xmux/init/login_app.dart';
import 'package:xmux/mainapp/main_app.dart';

Future main() async {
  runApp(new InitApp());

  switch (await init()) {
    case InitResult.notLogin:
    case InitResult.loginError:
      runApp(new LoginApp());
      break;
    case InitResult.finished:
      runApp(new MainApp());
  }
}
