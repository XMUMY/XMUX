import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/loginapp/loginhandler.dart';
import 'package:xmux/mainapp/mainapp.dart';
import 'package:xmux/translations/translation.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  bool _isProcessing = false;

  Future _handleSignIn(BuildContext context) async {
    // Switch to processing state.
    setState(() => _isProcessing = true);

    // Check format.
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text(
              LoginLocalizations.of(context).get("SignInPage/FormatError"))));
      setState(() => _isProcessing = false);
      return;
    }

    // Handle login.
    LoginHandler
        .loginAuth(_usernameController.text, _passwordController.text, context)
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
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title:
              new Text(LoginLocalizations.of(context).get("SignInPage/Title")),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(FontAwesomeIcons.fileAltO),
              onPressed: () {
                launch(
                  "https://xmux-app.firebaseapp.com/privacy.html",
                  forceWebView: true,
                );
              },
              tooltip:
                  LoginLocalizations.of(context).get("SignInPage/ServiceDocs"),
            ),
            new IconButton(
              icon: new Icon(FontAwesomeIcons.questionCircleO),
              onPressed: null,
              tooltip:
                  LoginLocalizations.of(context).get("SignInPage/HelpDocs"),
            ),
          ],
        ),
        body: new Builder(
          builder: (BuildContext context) => new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 0.0, 35.0, 20.0),
                    child: new Column(
                      children: <Widget>[
                        new TextField(
                          controller: _usernameController,
                          decoration: new InputDecoration(
                            hintText: LoginLocalizations
                                .of(context)
                                .get("SignInPage/CampusID"),
                            icon: new Icon(
                              Icons.account_circle,
                            ),
                          ),
                        ),
                        new TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: new InputDecoration(
                            hintText: LoginLocalizations
                                .of(context)
                                .get("SignInPage/Password"),
                            icon: new Icon(
                              Icons.lock_outline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _isProcessing
                      ? new CircularProgressIndicator()
                      : new RaisedButton(
                          child: new Container(
                            width: 120.0,
                            height: 40.0,
                            child: new Center(
                              child: new Text(
                                LoginLocalizations
                                    .of(context)
                                    .get("SignInPage/SignIn"),
                                style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Theme.of(context).canvasColor,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () => _handleSignIn(context),
                        ),
                  new Divider(
                    height: 16.0,
                    color: Theme.of(context).canvasColor,
                  ),
                  new Text(
                    "Beta Channel\n" +
                        LoginLocalizations.of(context).get("SignInPage/Read"),
                    textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.red),
                  )
                ],
              ),
        ),
      );
}
