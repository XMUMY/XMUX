import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/initapp/init.dart';
import 'package:xmux/initapp/init_page.dart';
import 'package:xmux/loginapp/login_app.dart';
import 'package:xmux/mainapp/main_app.dart';
import 'package:xmux/redux/actions.dart';

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

Future<Null> signOut() async {
  await FirebaseAuth.instance.signOut();
  firebaseUser = null;
  mainAppStore.dispatch(LogoutAction());
  runApp(LoginApp());
}
