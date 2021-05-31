import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grpc/grpc.dart';
import 'package:tuple/tuple.dart';
import 'package:xmus_client/authorization.dart';
import 'package:xmus_client/error.dart';
import 'package:xmus_client/generated/user.pb.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/firebase/firebase.dart';
import 'package:xmux/redux/actions/actions.dart';

import 'background.dart';
import 'init_handler.dart';

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
        maxLength: 50,
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
        _displayNameFormKey,
        _emailFormKey,
      ),
      Divider(color: Colors.transparent),
    ];

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        // Background image.
        BackgroundImage(),

        // Main widgets.
        Center(
          child: Container(
            width: min(MediaQuery.of(context).size.width, 450.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: mainWidgets,
            ),
          ),
        ),
      ],
    );
  }
}

class _RegisterButton extends StatefulWidget {
  final GlobalKey<FormFieldState<String>> _displayNameFormKey;
  final GlobalKey<FormFieldState<String>> _emailFormKey;

  _RegisterButton(
    this._displayNameFormKey,
    this._emailFormKey,
  );

  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<_RegisterButton> {
  String _username, _password;
  bool _isProcessing = false;

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
                Authorization.basic(_username, _password).provider
              ]))
          .convertRpcError;
      customToken = registerResp.customToken;
    } on XmuxRpcError catch (e) {
      if (mounted) setState(() => _isProcessing = false);
      _showError(context, e.message);
      return;
    } catch (e) {
      if (mounted) setState(() => _isProcessing = false);
      _showError(context, e.toString());
      return;
    }

    store.dispatch(LoginAction(_username, _password));

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
  void didChangeDependencies() {
    Tuple2<String, String> args = ModalRoute.of(context).settings.arguments;
    _username = args.item1;
    _password = args.item2;
    super.didChangeDependencies();
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
