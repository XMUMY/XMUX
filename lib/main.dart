import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/initapp/init.dart';
import 'package:xmux/initapp/login_app.dart';
import 'package:xmux/mainapp/main_app.dart';
import 'package:xmux/redux/redux.dart';

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

Future<Null> signOut() async {
  await FirebaseAuth.instance.signOut();
  firebaseUser = null;
  store.dispatch(LogoutAction());
  runApp(LoginApp());
}
