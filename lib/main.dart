import 'package:flutter/material.dart';

import 'init/init_app.dart';
import 'init/init_handler.dart'
    if (dart.library.html) 'init/init_handler_web.dart';

void main() async {
  // Attach init screen.
  runApp(InitApp());
  // Initialize app.
  init();
}
