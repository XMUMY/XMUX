import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/config.dart';
import 'package:xmux/loginapp/animated_logo.dart';
import 'package:xmux/loginapp/login_button.dart';
import 'package:xmux/translations/translation.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image.
          Image(
            image: AssetImage("res/initpage.jpg"),
            fit: BoxFit.fill,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),

          // Bottom button.
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(FontAwesomeIcons.fileAlt),
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
              IconButton(
                icon: Icon(FontAwesomeIcons.questionCircle),
                onPressed: null,
                tooltip:
                    LoginLocalizations.of(context).get("SignInPage/HelpDocs"),
              ),
            ],
          ),

          // Main widgets.
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                child: Column(
                  children: <Widget>[
                    AnimatedLogo(),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: LoginLocalizations
                            .of(context)
                            .get("SignInPage/CampusID"),
                        hintStyle: TextStyle(color: Colors.white70),
                        icon: Icon(
                          Icons.account_box,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: LoginLocalizations
                            .of(context)
                            .get("SignInPage/Password"),
                        hintStyle: TextStyle(color: Colors.white70),
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              LoginButton(_usernameController, _passwordController),
              Padding(padding: EdgeInsets.all(10.0)),
              Text(
                LoginLocalizations.of(context).get("SignInPage/Read"),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.redAccent),
              )
            ],
          ),
        ],
      );
}
