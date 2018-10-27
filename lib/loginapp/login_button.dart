import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:platform/platform.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/initapp/init.dart';
import 'package:xmux/loginapp/login_handler.dart';
import 'package:xmux/mainapp/main_app.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;

  final GlobalKey<FormFieldState<String>> _usernameFormKey;
  final GlobalKey<FormFieldState<String>> _passwordFormKey;

  LoginButton(this._usernameController, this._passwordController,
      this._usernameFormKey, this._passwordFormKey);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool _isProcessing = false;

  Future<Null> _handleSignIn() async {
    // Validate format.
    if (!widget._usernameFormKey.currentState.validate() ||
        !widget._passwordFormKey.currentState.validate()) return;

    // Switch to processing state.
    setState(() => _isProcessing = true);

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
    if (loginResult != 'success') {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              '${i18n('SignInPage/Error', context, app: 'l')}$loginResult')));
      setState(() => _isProcessing = false);
      return;
    }

    // Handle firebase login.
    var firebaseResult = await LoginHandler.firebaseLogin();
    if (firebaseResult != 'success') {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              '${i18n('SignInPage/Error', context, app: 'l')}$firebaseResult')));
      setState(() => _isProcessing = false);
      return;
    }

    // Init FCM.
    initFCM();
    runApp(MainApp());
  }

  @override
  Widget build(BuildContext context) {
    return _isProcessing
        ? SpinKitDoubleBounce(color: Colors.white, size: 40.0)
        : OutlineButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Container(
              width: 120.0,
              height: 40.0,
              child: Center(
                child: Text(
                  i18n('SignInPage/SignIn', context, app: 'l'),
                ),
              ),
            ),
            onPressed: _handleSignIn,
          );
  }
}
