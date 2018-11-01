import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/loginapp/animated_logo.dart';
import 'package:xmux/loginapp/login_button.dart';

class LoginPage extends StatelessWidget {
  // Controller for username & password.
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Form key for validation.
  final _usernameFormKey = GlobalKey<FormFieldState<String>>();
  final _passwordFormKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image.
          Image(
            image: AssetImage('res/initpage.jpg'),
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
                onPressed: () => launch(
                    'https://${BackendApiConfig.resourceAddress}/privacy.html',
                    forceWebView: true),
                tooltip: i18n('SignInPage/ServiceDocs', context, app: 'l'),
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.questionCircle),
                onPressed: null,
                tooltip: i18n('SignInPage/HelpDocs', context, app: 'l'),
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
                    TextFormField(
                      key: _usernameFormKey,
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText:
                            i18n('SignInPage/CampusID', context, app: 'l'),
                        hintStyle: TextStyle(color: Colors.white70),
                        icon: Icon(
                          Icons.account_box,
                          color: Colors.white,
                        ),
                      ),
                      validator: (s) => RegExp('^[A-Za-z]{3}[0-9]{7}\$')
                              .hasMatch(s)
                          ? null
                          : i18n('SignInPage/FormatError', context, app: 'l'),
                    ),
                    TextFormField(
                      key: _passwordFormKey,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText:
                            i18n('SignInPage/Password', context, app: 'l'),
                        hintStyle: TextStyle(color: Colors.white70),
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      validator: (s) => s.isNotEmpty
                          ? null
                          : i18n('SignInPage/FormatError', context, app: 'l'),
                    ),
                  ],
                ),
              ),
              LoginButton(_usernameController, _passwordController,
                  _usernameFormKey, _passwordFormKey),
              Padding(padding: EdgeInsets.all(8.0)),
              Text(
                i18n('SignInPage/Read', context, app: 'l'),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.redAccent),
              )
            ],
          ),
        ],
      );
}
