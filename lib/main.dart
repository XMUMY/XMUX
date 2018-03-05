import 'dart:async';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:xmux/initapp/init.dart';
import 'package:xmux/initapp/initpage.dart';
import 'package:xmux/loginapp/loginapp.dart';
import 'package:xmux/mainapp/mainapp.dart';
import 'package:xmux/redux/reducers.dart';
import 'package:xmux/redux/state.dart';

final mainAppStore =
    new Store<MainAppState>(mainAppReducer, initialState: new MainAppState());

Future main() async {
  runApp(new InitPage());

  switch (await init(mainAppStore)) {
    case "NotLogin":
    case "LoginError":
      runApp(new LoginApp());
      break;
    case "Finished":
      runApp(new MainApp(mainAppStore));
  }
}
