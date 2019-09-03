import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/components/animated_logo.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/init/init_handler.dart';
import 'package:xmux/init/login_handler.dart';

class LoginPage extends StatelessWidget {
  // Form key for id & password.
  final _usernameFormKey = GlobalKey<FormFieldState<String>>();
  final _passwordFormKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var mainWidgets = Container(
        width: min(constraints.maxWidth, 450.0),
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedLogo(),
            TextFormField(
              key: _usernameFormKey,
              decoration: InputDecoration(
                hintText: i18n('SignIn/CampusID', context, app: 'l'),
                hintStyle: TextStyle(color: Colors.white70),
                icon: Icon(
                  Icons.account_box,
                  color: Colors.white,
                ),
              ),
              validator: (s) =>
                  RegExp(r'^[A-Za-z]{3}[0-9]{7}$|^[0-9]{7}$').hasMatch(s)
                      ? null
                      : i18n('SignIn/FormatError', context, app: 'l'),
            ),
            TextFormField(
              key: _passwordFormKey,
              obscureText: true,
              decoration: InputDecoration(
                hintText: i18n('SignIn/Password', context, app: 'l'),
                hintStyle: TextStyle(color: Colors.white70),
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
              validator: (s) => s.isNotEmpty
                  ? null
                  : i18n('SignIn/FormatError', context, app: 'l'),
            ),
            Divider(color: Colors.transparent),
            _LoginButton(_usernameFormKey, _passwordFormKey),
            Divider(color: Colors.transparent),
            Text(
              i18n('SignIn/Read', context, app: 'l'),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.redAccent),
            )
          ],
        ),
      );

      return Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image.
          Image(
            image: AssetImage('res/initpage.jpg'),
            fit: constraints.maxHeight / constraints.maxWidth > 16 / 9
                ? BoxFit.fitHeight
                : BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),

          // Bottom buttons.
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Platform.isAndroid
                  ? IconButton(
                      icon: Icon(FontAwesomeIcons.googlePlay),
                      onPressed: () => launch(
                          'https://${BackendApiConfig.resourceAddress}/2019/01/01/gms/'),
                      tooltip: i18n('SignIn/GooglePlay', context, app: 'l'),
                    )
                  : Container(),
              IconButton(
                icon: Icon(FontAwesomeIcons.fileAlt),
                onPressed: () => launch(
                    'https://${BackendApiConfig.resourceAddress}/privacy.html',
                    forceWebView: true),
                tooltip: i18n('SignIn/Privacy', context, app: 'l'),
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.questionCircle),
                onPressed: () =>
                    launch('https://${BackendApiConfig.resourceAddress}/'),
                tooltip: i18n('SignIn/HelpDocs', context, app: 'l'),
              ),
            ],
          ),

          // Main widgets.
          Center(child: mainWidgets),
        ],
      );
    });
  }
}

class _LoginButton extends StatefulWidget {
  final GlobalKey<FormFieldState<String>> _usernameFormKey;
  final GlobalKey<FormFieldState<String>> _passwordFormKey;

  _LoginButton(this._usernameFormKey, this._passwordFormKey);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<_LoginButton> {
  bool _isProcessing = false;

  Future<Null> _handleSignIn() async {
    // Validate format.
    if (!widget._usernameFormKey.currentState.validate() ||
        !widget._passwordFormKey.currentState.validate()) return;

    // Keep username and password to prevent modifying.
    final username = widget._usernameFormKey.currentState.value.toLowerCase();
    final password = widget._passwordFormKey.currentState.value;

    // Switch to processing state.
    setState(() => _isProcessing = true);

    // Handle login.
    var loginResult = await LoginHandler.campus(
        widget._usernameFormKey.currentState.value,
        widget._passwordFormKey.currentState.value);
    if (loginResult != 'success') {
      Scaffold.of(context).showSnackBar(SnackBar(
          content:
              Text('${i18n('SignIn/Error', context, app: 'l')}$loginResult')));
      setState(() => _isProcessing = false);
      return;
    }

    // Need register
    // TODO: Check if need
    Navigator.of(context)
        .pushNamed('/Register', arguments: Tuple2(username, password));

    // Handle firebase login.
    var firebaseResult = await LoginHandler.firebase();
    if (firebaseResult != 'success') {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              '${i18n('SignIn/Error', context, app: 'l')}$firebaseResult')));
      setState(() => _isProcessing = false);
      return;
    }

    // Continue init.
    await LoginHandler.createUser();
    initFCM();

    postInit();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState:
          _isProcessing ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 100),
      firstChild: OutlineButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          width: 120,
          height: 40,
          child: Center(
            child: Text(i18n('SignIn/SignIn', context, app: 'l')),
          ),
        ),
        onPressed: _handleSignIn,
      ),
      secondChild: SpinKitDoubleBounce(color: Colors.white, size: 40),
    );
  }
}
