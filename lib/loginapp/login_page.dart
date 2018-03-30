import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/config.dart';
import 'package:xmux/loginapp/animated_logo.dart';
import 'package:xmux/loginapp/login_button.dart';
import 'package:xmux/translations/translation.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) => new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image.
          new Image(
            image: new AssetImage("res/initpage.jpg"),
            fit: BoxFit.fill,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),

          // Bottom button.
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new IconButton(
                icon: new Icon(FontAwesomeIcons.fileAltO),
                onPressed: () {
                  launch(
                    "https://${BackendApiConfig.resourceAddress}/privacy.html",
                    forceWebView: true,
                  );
                },
                tooltip: LoginLocalizations
                    .of(context)
                    .get("SignInPage/ServiceDocs"),
              ),
              new IconButton(
                icon: new Icon(FontAwesomeIcons.questionCircleO),
                onPressed: null,
                tooltip:
                    LoginLocalizations.of(context).get("SignInPage/HelpDocs"),
              ),
            ],
          ),

          // Main widgets.
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.fromLTRB(20.0, 0.0, 35.0, 20.0),
                child: new Column(
                  children: <Widget>[
                    new AnimatedLogo(),
                    new TextField(
                      controller: _usernameController,
                      decoration: new InputDecoration(
                        hintText: LoginLocalizations
                            .of(context)
                            .get("SignInPage/CampusID"),
                        hintStyle: new TextStyle(color: Colors.white70),
                        icon: new Icon(
                          Icons.account_circle,
                          color: Colors.white,
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
                        hintStyle: new TextStyle(color: Colors.white70),
                        icon: new Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new LoginButton(_usernameController, _passwordController),
              new Padding(padding: const EdgeInsets.all(10.0)),
              new Text(
                LoginLocalizations.of(context).get("SignInPage/Read"),
                textAlign: TextAlign.center,
                style: new TextStyle(color: Colors.redAccent),
              )
            ],
          ),
        ],
      );
}
