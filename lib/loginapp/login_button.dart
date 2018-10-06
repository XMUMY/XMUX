import 'dart:async';

import 'package:flutter/material.dart';
import 'package:platform/platform.dart';
import 'package:xmux/config.dart';
import 'package:xmux/initapp/init.dart';
import 'package:xmux/loginapp/login_handler.dart';
import 'package:xmux/mainapp/main_app.dart';
import 'package:xmux/translations/translation.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;

  LoginButton(this._usernameController, this._passwordController);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool _isProcessing = false;

  Future _handleSignIn(BuildContext context) async {
    // Switch to processing state.
    setState(() => _isProcessing = true);

    // Check format.
    if (widget._usernameController.text.isEmpty ||
        widget._passwordController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              LoginLocalizations.of(context).get("SignInPage/FormatError"))));
      setState(() => _isProcessing = false);
      return;
    }

    // Demo login.
    if (widget._usernameController.text == AppInfo.demoUsername &&
        widget._passwordController.text == AppInfo.demoPassword &&
        !(const LocalPlatform().isIOS)) {
      runApp(MainApp());
      return;
    }

    // Handle login.
    var loginResult = await LoginHandler.login(
        widget._usernameController.text, widget._passwordController.text);
    if (loginResult != "success") {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Error : $loginResult")));
      setState(() {
        _isProcessing = false;
      });
      return;
    }

    // Handle firebase login.
    var firebaseResult = await LoginHandler.firebaseLogin();
    if (firebaseResult != "success") {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Error : $firebaseResult")));
      setState(() {
        _isProcessing = false;
      });
      return;
    }

    // Init FCM.
    initFCM();
    runApp(MainApp());
  }

  @override
  Widget build(BuildContext context) {
    return _isProcessing
        ? CircularProgressIndicator()
        : RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Container(
              width: 120.0,
              height: 40.0,
              child: Center(
                child: Text(
                  LoginLocalizations.of(context).get("SignInPage/SignIn"),
                ),
              ),
            ),
            onPressed: () => _handleSignIn(context),
          );
  }
}
