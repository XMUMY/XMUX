import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'init/init_app.dart';
import 'init/init_handler.dart';
import 'init/login_app.dart';

void main() async {
  // Lock the screen orientation.
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Attach init screen.
  runApp(InitApp());

  // Run `LoginApp` if init failed.
  if (!await init()) runApp(LoginApp());
}
