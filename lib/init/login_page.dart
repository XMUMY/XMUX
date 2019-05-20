import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/components/animated_logo.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/init/init_handler.dart';
import 'package:xmux/init/login_handler.dart';
import 'package:xmux/mainapp/main_app.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

class LoginPage extends StatelessWidget {
  // Form key for id & password.
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
              Platform.isAndroid
                  ? IconButton(
                      icon: Icon(FontAwesomeIcons.googlePlay),
                      onPressed: () => launch(
                          'https://${BackendApiConfig.resourceAddress}/2018/01/01/gms/'),
                      tooltip: i18n('SignInPage/GooglePlay', context, app: 'l'),
                    )
                  : Container(),
              IconButton(
                icon: Icon(FontAwesomeIcons.fileAlt),
                onPressed: () => launch(
                    'https://${BackendApiConfig.resourceAddress}/privacy.html',
                    forceWebView: true),
                tooltip: i18n('SignInPage/Privacy', context, app: 'l'),
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.questionCircle),
                onPressed: () =>
                    launch('https://${BackendApiConfig.resourceAddress}/'),
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
                      decoration: InputDecoration(
                        hintText:
                            i18n('SignInPage/CampusID', context, app: 'l'),
                        hintStyle: TextStyle(color: Colors.white70),
                        icon: Icon(
                          Icons.account_box,
                          color: Colors.white,
                        ),
                      ),
                      validator: (s) => RegExp(
                                  r'^[A-Za-z]{3}[0-9]{7}$|^[0-9]{7}$')
                              .hasMatch(s)
                          ? null
                          : i18n('SignInPage/FormatError', context, app: 'l'),
                    ),
                    TextFormField(
                      key: _passwordFormKey,
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
              LoginButton(_usernameFormKey, _passwordFormKey),
              Divider(color: Colors.transparent),
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

class LoginButton extends StatefulWidget {
  final GlobalKey<FormFieldState<String>> _usernameFormKey;
  final GlobalKey<FormFieldState<String>> _passwordFormKey;

  LoginButton(this._usernameFormKey, this._passwordFormKey);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool _isProcessing = false;

  Future<Null> _handleSignIn() async {
    // Demo login.
    if (widget._usernameFormKey.currentState.value == AppConfig.demoUsername &&
        widget._passwordFormKey.currentState.value == AppConfig.demoPassword &&
        !Platform.isIOS) {
      runApp(MainApp());
      return;
    }

    // Validate format.
    if (!widget._usernameFormKey.currentState.validate() ||
        !widget._passwordFormKey.currentState.validate()) return;

    // Switch to processing state.
    setState(() => _isProcessing = true);

    // Handle login.
    var loginResult = await LoginHandler.campus(
        widget._usernameFormKey.currentState.value,
        widget._passwordFormKey.currentState.value);
    if (loginResult != 'success') {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              '${i18n('SignInPage/Error', context, app: 'l')}$loginResult')));
      setState(() => _isProcessing = false);
      return;
    }

    // Handle firebase login.
    var firebaseResult = await LoginHandler.firebase();
    if (firebaseResult != 'success') {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              '${i18n('SignInPage/Error', context, app: 'l')}$firebaseResult')));
      setState(() => _isProcessing = false);
      return;
    }

    // Continue init.
    await LoginHandler.createUser();
    initFCM();
    XMUXApi.instance.getIdToken = firebaseUser.getIdToken;

    postInit();
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
                child: Text(i18n('SignInPage/SignIn', context, app: 'l')),
              ),
            ),
            onPressed: _handleSignIn,
          );
  }
}
