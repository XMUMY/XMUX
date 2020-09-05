import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grpc/grpc.dart';
import 'package:tuple/tuple.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/init/init_handler.dart';
import 'package:xmux/modules/rpc/authorization.dart';
import 'package:xmux/modules/rpc/clients/user.pb.dart';
import 'package:xmux/modules/rpc/error.dart';
import 'package:xmux/redux/actions/actions.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Form key for display name and email.
  final _displayNameFormKey = GlobalKey<FormFieldState<String>>();
  final _emailFormKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    // Get uid and password from previous.
    Tuple2<String, String> args = ModalRoute.of(context).settings.arguments;

    return LayoutBuilder(builder: (context, constraints) {
      var mainWidgets = <Widget>[
        Text(
          LocaleKeys.SignIn_RegisterTitle.tr(),
          style: Theme.of(context).textTheme.headline5,
        ),
        Divider(color: Colors.transparent),
        Text(
          LocaleKeys.SignIn_RegisterCaption.tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
        Divider(color: Colors.transparent),
        TextFormField(
          key: _displayNameFormKey,
          maxLength: 50,
          decoration: InputDecoration(
            hintText: LocaleKeys.SignIn_RegisterDisplayName.tr(),
            hintStyle: TextStyle(color: Colors.white70),
            icon: Icon(
              Icons.perm_identity,
              color: Colors.white,
            ),
          ),
          validator: (s) =>
              s.isNotEmpty ? null : LocaleKeys.SignIn_ErrorFormat.tr(),
        ),
        TextFormField(
          key: _emailFormKey,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: LocaleKeys.SignIn_RegisterEmail.tr(),
            hintStyle: TextStyle(color: Colors.white70),
            icon: Icon(
              Icons.email,
              color: Colors.white,
            ),
          ),
          validator: (s) =>
              s.contains('@') ? null : LocaleKeys.SignIn_ErrorFormat.tr(),
        ),
        Divider(color: Colors.transparent),
        _RegisterButton(
          args.item1,
          args.item2,
          _displayNameFormKey,
          _emailFormKey,
        ),
        Divider(color: Colors.transparent),
      ];

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

          // Main widgets.
          Center(
            child: Container(
              width: min(constraints.maxWidth, 450.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: mainWidgets,
              ),
            ),
          ),
        ],
      );
    });
  }
}

class _RegisterButton extends StatefulWidget {
  final String _uid, _password;

  final GlobalKey<FormFieldState<String>> _displayNameFormKey;
  final GlobalKey<FormFieldState<String>> _emailFormKey;

  _RegisterButton(
    this._uid,
    this._password,
    this._displayNameFormKey,
    this._emailFormKey,
  );

  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<_RegisterButton> {
  bool _isProcessing = false;

  Future<Null> _handleSignIn() async {
    // Validate format.
    if (!widget._displayNameFormKey.currentState.validate() ||
        !widget._emailFormKey.currentState.validate()) return;

    // Keep display name and email to prevent modifying.
    final name = widget._displayNameFormKey.currentState.value.toLowerCase();
    final email = widget._emailFormKey.currentState.value;

    // Switch to processing state.
    setState(() => _isProcessing = true);

    // Register
    String customToken;
    try {
      var registerResp = await rpc.userClient
          .register(
              RegisterReq()
                ..displayName = name
                ..email = email,
              options: CallOptions(providers: [
                Authorization.basic(widget._uid, widget._password).provider
              ]))
          .convertRpcError;
      customToken = registerResp.customToken;
    } on XmuxRpcError catch (e) {
      if (mounted) setState(() => _isProcessing = false);
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(LocaleKeys.General_ErrorTip.tr(args: [e.detail]))));
      return;
    } catch (e) {
      if (mounted) setState(() => _isProcessing = false);
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(LocaleKeys.General_ErrorTip.tr(args: [e.toString()]))));
      return;
    }

    store.dispatch(LoginAction(widget._uid, widget._password));

    // Login firebase.
    try {
      await firebase.login(customToken, context: context);
    } on PlatformException catch (e) {
      if (mounted) setState(() => _isProcessing = false);
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(LocaleKeys.General_ErrorTip.tr(
              args: ['${LocaleKeys.SignIn_ErrorGMS.tr()} $e']))));
      return;
    } catch (e) {
      if (mounted) setState(() => _isProcessing = false);
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(LocaleKeys.General_ErrorTip.tr(args: [e]))));
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
            child: Text(LocaleKeys.SignIn_Register.tr()),
          ),
        ),
        onPressed: _handleSignIn,
      ),
      secondChild: SpinKitDoubleBounce(color: Colors.white, size: 40),
    );
  }
}
