import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/components/animated_logo.dart';
import 'package:xmux/config.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/init/init_handler.dart';
import 'package:xmux/init/login_app.dart';
import 'package:xmux/modules/api/xmux_api.dart';
import 'package:xmux/redux/actions/actions.dart';

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
                hintText: S.of(context).SignIn_CampusID,
                hintStyle: TextStyle(color: Colors.white70),
                icon: Icon(
                  Icons.account_box,
                  color: Colors.white,
                ),
              ),
              validator: (s) =>
                  RegExp(r'^[A-Za-z]{3}[0-9]{7}$|^[0-9]{7}$').hasMatch(s)
                      ? null
                      : S.of(context).SignIn_ErrorFormat,
            ),
            TextFormField(
              key: _passwordFormKey,
              obscureText: true,
              decoration: InputDecoration(
                hintText: S.of(context).SignIn_Password,
                hintStyle: TextStyle(color: Colors.white70),
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
              validator: (s) =>
                  s.isNotEmpty ? null : S.of(context).SignIn_ErrorFormat,
            ),
            Divider(color: Colors.transparent),
            _LoginButton(_usernameFormKey, _passwordFormKey),
            Divider(color: Colors.transparent),
            Text(
              S.of(context).SignIn_Read,
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
              if (!kIsWeb && Platform.isAndroid)
                IconButton(
                  icon: Icon(FontAwesomeIcons.googlePlay),
                  onPressed: () => launch(
                      '${BackendApiConfig.websiteAddress}/2019/01/01/gms/'),
                  tooltip: S.of(context).SignIn_InstallGMS,
                ),
              IconButton(
                icon: Icon(FontAwesomeIcons.fileAlt),
                onPressed: () => launch(
                    '${BackendApiConfig.websiteAddress}/privacy.html',
                    forceWebView: true),
                tooltip: S.of(context).SignIn_Privacy,
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.questionCircle),
                onPressed: () => launch('https://docs.xmux.xdea.io'),
                tooltip: S.of(context).SignIn_Docs,
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
  var _isProcessing = false;

  // If this version is deprecated.
  var _isDeprecated = false;

  Future<Null> _handleSignIn() async {
    if (_isDeprecated) {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).SignIn_ErrorDeprecated)));
      return;
    }

    // Validate format.
    if (!widget._usernameFormKey.currentState.validate() ||
        !widget._passwordFormKey.currentState.validate()) return;

    // Keep username and password to prevent modifying.
    final username = widget._usernameFormKey.currentState.value.toLowerCase();
    final password = widget._passwordFormKey.currentState.value;

    // Switch to processing state.
    setState(() => _isProcessing = true);

    // Login and get custom token.
    String customToken;
    try {
      var loginResp = await XmuxApi.instance.login(username, password);
      if (loginResp.code == 1) {
        // Need register.
        Navigator.of(context)
            .pushNamed('/Register', arguments: Tuple2(username, password));
        return;
      }
      customToken = loginResp.data.customToken;
    } on XmuxApiException catch (e) {
      if (mounted) setState(() => _isProcessing = false);
      var msg = e.code == -403
          ? S.of(context).SignIn_ErrorInvalidPassword
          : e.message;
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).General_Error(msg))));
      return;
    } catch (e) {
      if (mounted) setState(() => _isProcessing = false);
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).General_Error(e.toString()))));
      return;
    }
    store.dispatch(LoginAction(username, password));
    XmuxApi.instance
        .configure(authorization: Authorization.basic(username, password));

    // Login firebase.
    try {
      await FirebaseAuth.instance.signInWithCustomToken(token: customToken);
    } on PlatformException catch (e) {
      if (mounted) setState(() => _isProcessing = false);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
            S.of(context).General_Error('${S.of(context).SignIn_ErrorGMS} $e')),
      ));
      return;
    } catch (e) {
      if (mounted) setState(() => _isProcessing = false);
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).General_Error(e))));
      return;
    }

    postInit();
  }

  @override
  void initState() {
    LoginApp app = context.findAncestorWidgetOfExactType<LoginApp>();
    _isDeprecated = app.message == 'deprecated';
    super.initState();
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
            child: Text(S.of(context).SignIn_SignIn),
          ),
        ),
        onPressed: _handleSignIn,
      ),
      secondChild: SpinKitDoubleBounce(color: Colors.white, size: 40),
    );
  }
}
