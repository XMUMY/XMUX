import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xmux/loginapp/login_handler.dart';
import 'package:xmux/mainapp/main_app.dart';
import 'package:xmux/translations/translation.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;

  LoginButton(this._usernameController, this._passwordController);

  @override
  _LoginButtonState createState() => new _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton>
    with SingleTickerProviderStateMixin {
  bool _isProcessing = false;

  Future _handleSignIn(BuildContext context) async {
    // Switch to processing state.
    setState(() => _isProcessing = true);

    // Check format.
    if (widget._usernameController.text.isEmpty ||
        widget._passwordController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text(
              LoginLocalizations.of(context).get("SignInPage/FormatError"))));
      setState(() => _isProcessing = false);
      return;
    }

    // Handle login.
    LoginHandler
        .loginAuth(widget._usernameController.text,
            widget._passwordController.text, context)
        .then((r) async {
      if (r != "success") {
        Scaffold
            .of(context)
            .showSnackBar(new SnackBar(content: new Text("Error : $r")));
        setState(() {
          _isProcessing = false;
        });
      } else
        LoginHandler.firebaseLogin().then((r) {
          if (r.containsKey("error")) {
            Scaffold.of(context).showSnackBar(
                new SnackBar(content: new Text("Error : ${r["error"]}")));
            setState(() {
              _isProcessing = false;
            });
          } else
            runApp(new MainApp());
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isProcessing
        ? new CircularProgressIndicator()
        : new RaisedButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.all(new Radius.circular(10.0))),
            child: new Container(
              width: 120.0,
              height: 40.0,
              child: new Center(
                child: new Text(
                  LoginLocalizations.of(context).get("SignInPage/SignIn"),
                ),
              ),
            ),
            onPressed: () => _handleSignIn(context),
          );
  }
}
