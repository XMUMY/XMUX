import 'dart:async';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grpc/grpc.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/components/animated_logo.dart';
import 'package:xmux/config.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/firebase/firebase.dart';
import 'package:xmux/modules/rpc/authorization.dart';
import 'package:xmux/modules/rpc/clients/google/protobuf/empty.pb.dart';
import 'package:xmux/modules/rpc/error.dart';
import 'package:xmux/redux/actions/actions.dart';

import 'background.dart';
import 'init_handler.dart';
import 'login_app.dart';

class LoginPage extends StatelessWidget {
  // Form key for id & password.
  final _usernameFormKey = GlobalKey<FormFieldState<String>>();
  final _passwordFormKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    var msg = context.findAncestorWidgetOfExactType<LoginApp>().message;

    var mainWidgets = Container(
      width: min(MediaQuery.of(context).size.width, 450.0),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedLogo(),
          TextFormField(
            key: _usernameFormKey,
            decoration: InputDecoration(
              hintText: LocaleKeys.SignIn_CampusID.tr(),
              hintStyle: TextStyle(color: Colors.white70),
              icon: Icon(
                Icons.account_box,
                color: Colors.white,
              ),
            ),
            validator: (s) =>
                RegExp(r'^[A-Za-z]{3}[0-9]{7}$|^[0-9]{7}$').hasMatch(s)
                    ? null
                    : LocaleKeys.SignIn_ErrorFormat.tr(),
          ),
          TextFormField(
            key: _passwordFormKey,
            obscureText: true,
            decoration: InputDecoration(
              hintText: LocaleKeys.SignIn_Password.tr(),
              hintStyle: TextStyle(color: Colors.white70),
              icon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
            ),
            validator: (s) =>
                s.length >= 6 ? null : LocaleKeys.SignIn_ErrorFormat.tr(),
          ),
          Divider(color: Colors.transparent),
          _LoginButton(_usernameFormKey, _passwordFormKey),
          Divider(color: Colors.transparent),
          Text(
            LocaleKeys.SignIn_Read.tr() + '\n' + msg.tr(),
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
        BackgroundImage(),

        // Bottom buttons.
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            if (P.isAndroid)
              IconButton(
                icon: Icon(FontAwesomeIcons.googlePlay),
                onPressed: () => launch(
                    '${BackendApiConfig.websiteAddress}/2019/01/01/gms/'),
                tooltip: LocaleKeys.SignIn_InstallGMS.tr(),
              ),
            IconButton(
              icon: Icon(FontAwesomeIcons.fileAlt),
              onPressed: () => launch(
                  '${BackendApiConfig.websiteAddress}/privacy.html',
                  forceWebView: true),
              tooltip: LocaleKeys.SignIn_Privacy.tr(),
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.questionCircle),
              onPressed: () => launch('https://docs.xmux.xdea.io'),
              tooltip: LocaleKeys.SignIn_Docs.tr(),
            ),
          ],
        ),

        // Main widgets.
        Center(child: mainWidgets),
      ],
    );
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

  // Show snack bar after an error occurred.
  void _showError(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(LocaleKeys.General_ErrorTip.tr(args: [msg])),
      ),
    );
  }

  Future<Null> _handleSignIn() async {
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
      var loginResp = await rpc.userClient
          .login(Empty(),
              options: CallOptions(providers: [
                Authorization.basic(username, password).provider
              ]))
          .convertRpcError;
      customToken = loginResp.customToken;
    } on XmuxRpcError catch (e) {
      if (e.code == 1) {
        // Need register.
        if (mounted) setState(() => _isProcessing = false);
        Navigator.of(context)
            .pushNamed('/Register', arguments: Tuple2(username, password));
        return;
      }

      if (mounted) setState(() => _isProcessing = false);
      var msg = e.code == 403
          ? LocaleKeys.SignIn_ErrorInvalidPassword.tr()
          : e.detail;
      _showError(context, msg);
      return;
    } catch (e) {
      if (mounted) setState(() => _isProcessing = false);
      _showError(context, e.toString());
      return;
    }
    store.dispatch(LoginAction(username, password));

    // Login firebase.
    try {
      await Firebase.login(customToken, context: context);
    } on PlatformException catch (e) {
      if (mounted) setState(() => _isProcessing = false);
      _showError(context, '${LocaleKeys.SignIn_ErrorGMS.tr()} $e');
      return;
    } catch (e) {
      if (mounted) setState(() => _isProcessing = false);
      _showError(context, e.toString());
      return;
    }

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
            child: Text(LocaleKeys.SignIn_SignIn.tr()),
          ),
        ),
        onPressed: _handleSignIn,
      ),
      secondChild: SpinKitDoubleBounce(color: Colors.white, size: 40),
    );
  }
}
