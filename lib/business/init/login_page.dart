import 'dart:math';

import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grpc/grpc.dart';
import 'package:taskflow/taskflow.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:xmus_client/api/google/protobuf/empty.pb.dart';
import 'package:xmus_client/api/user.pb.dart';
import 'package:xmus_client/authorization.dart';
import 'package:xmus_client/error.dart';

import '../../foundation/config/config.dart';
import '../../foundation/localization/locale_keys.dart';
import '../../foundation/platform/platform.dart';
import '../../global.dart';
import '../redux/action/action.dart';
import '../redux/store.dart';
import 'background.dart';
import 'post_init_tasks.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Background image.
            const BackgroundImage(),

            // Login area.
            const Center(
              child: _LoginArea(),
            ),

            // Bottom buttons.
            Material(
              type: MaterialType.transparency,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.gavel),
                    onPressed: () => launchUrlString('$docsAddress/app/terms/'),
                    tooltip: LocaleKeys.SignIn_Terms.tr(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.policy),
                    onPressed: () =>
                        launchUrlString('$docsAddress/app/privacy/'),
                    tooltip: LocaleKeys.SignIn_Privacy.tr(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.help_center),
                    onPressed: () => launchUrlString(docsAddress),
                    tooltip: LocaleKeys.SignIn_Docs.tr(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginArea extends StatefulWidget {
  const _LoginArea();

  @override
  _LoginAreaState createState() => _LoginAreaState();
}

class _LoginAreaState extends State<_LoginArea> {
  var _isProcessing = false;
  var _needRegister = false;

  final _usernameFormKey = GlobalKey<FormFieldState<String>>();
  final _passwordFormKey = GlobalKey<FormFieldState<String>>();
  final _displayNameFormKey = GlobalKey<FormFieldState<String>>();
  final _emailFormKey = GlobalKey<FormFieldState<String>>();

  late String _username;
  late String _password;
  late String _displayName;
  late String _email;
  late String _customToken;

  Future<void> handleLogin() async {
    // Validate format.
    if (!_usernameFormKey.currentState!.validate() ||
        !_passwordFormKey.currentState!.validate()) return;

    // Keep username and password to prevent modifying.
    _username = _usernameFormKey.currentState!.value!.toLowerCase();
    _password = _passwordFormKey.currentState!.value!;

    // Switch to processing state.
    setState(() => _isProcessing = true);

    // Login and get custom token.
    try {
      final loginResp = await rpc.userClient
          .login(
            Empty(),
            options: CallOptions(providers: [
              Authorization.basic(_username, _password).provider,
            ]),
          )
          .convertRpcError;
      _customToken = loginResp.customToken;
    } on XmuxRpcError catch (e) {
      if (mounted) {
        setState(() => _isProcessing = false);

        if (e.reason == 'NEED_REGISTER') {
          setState(() => _needRegister = true);
          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message),
        ));
      }
      return;
    }

    store.dispatch(LoginAction(_username, _password));
    tryLoginFirebase();
    postInitTask(TaskFlowContext());
  }

  Future<void> handleRegister() async {
    // Validate format.
    if (!_displayNameFormKey.currentState!.validate() ||
        !_emailFormKey.currentState!.validate()) return;

    _displayName = _displayNameFormKey.currentState!.value!.toLowerCase();
    _email = _emailFormKey.currentState!.value!;

    // Switch to processing state.
    setState(() => _isProcessing = true);

    // Login and get custom token.
    try {
      final loginResp = await rpc.userClient
          .register(
            RegisterReq(displayName: _displayName, email: _email),
            options: CallOptions(providers: [
              Authorization.basic(_username, _password).provider,
            ]),
          )
          .convertRpcError;
      _customToken = loginResp.customToken;
    } on XmuxRpcError catch (e) {
      if (mounted) {
        setState(() => _isProcessing = _needRegister = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message),
        ));
      }
      return;
    }

    store.dispatch(LoginAction(_username, _password));
    tryLoginFirebase();
    postInitTask(TaskFlowContext());
  }

  Future<void> tryLoginFirebase() async {
    if (!isMobileApp && !isWeb && !isMacOSApp) return;
    try {
      final u = await FirebaseAuth.instance.signInWithCustomToken(_customToken);
      log.i('Login Firebase: ${u.user?.uid} ${u.user?.displayName}');
    } catch (e) {
      log.e('Failed to login firebase: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    late Widget child;
    if (_needRegister) {
      child = Container(
        key: const ValueKey('Register'),
        width: min(MediaQuery.of(context).size.width, 500.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              LocaleKeys.SignIn_RegisterTitle.tr(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(color: Colors.transparent),
            Text(
              LocaleKeys.SignIn_RegisterCaption.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(color: Colors.transparent),
            TextFormField(
              key: _displayNameFormKey,
              maxLength: 50,
              decoration: InputDecoration(
                hintText: LocaleKeys.SignIn_RegisterDisplayName.tr(),
                hintStyle: const TextStyle(color: Colors.white70),
                icon: const Icon(
                  Icons.perm_identity,
                  color: Colors.white,
                ),
              ),
              validator: (s) => s != null && s.isNotEmpty
                  ? null
                  : LocaleKeys.SignIn_ErrorFormat.tr(),
            ),
            TextFormField(
              key: _emailFormKey,
              maxLength: 50,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: LocaleKeys.SignIn_RegisterEmail.tr(),
                hintStyle: const TextStyle(color: Colors.white70),
                icon: const Icon(
                  Icons.email,
                  color: Colors.white,
                ),
              ),
              validator: (s) => s != null && s.contains('@')
                  ? null
                  : LocaleKeys.SignIn_ErrorFormat.tr(),
            ),
            const Divider(color: Colors.transparent),
            _Button(
              isProcessing: _isProcessing,
              label: LocaleKeys.SignIn_Register.tr(),
              onPressed: handleRegister,
            ),
          ],
        ),
      );
    } else {
      child = Container(
        key: const ValueKey('Login'),
        width: min(MediaQuery.of(context).size.width, 500.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'res/logo_outlined.png',
              height: 100,
              width: 100,
            ),
            const Divider(color: Colors.transparent),
            TextFormField(
              key: _usernameFormKey,
              decoration: InputDecoration(
                hintText: LocaleKeys.SignIn_CampusID.tr(),
                hintStyle: const TextStyle(color: Colors.white70),
                icon: const Icon(
                  Icons.account_box,
                  color: Colors.white,
                ),
              ),
              validator: (s) => s != null &&
                      RegExp(r'^[A-Za-z]{3}[0-9]{7}$|^[0-9]{7}$').hasMatch(s)
                  ? null
                  : LocaleKeys.SignIn_ErrorFormat.tr(),
            ),
            TextFormField(
              key: _passwordFormKey,
              obscureText: true,
              decoration: InputDecoration(
                hintText: LocaleKeys.SignIn_Password.tr(),
                hintStyle: const TextStyle(color: Colors.white70),
                icon: const Icon(
                  Icons.password,
                  color: Colors.white,
                ),
              ),
              validator: (s) => s != null && s.length >= 6
                  ? null
                  : LocaleKeys.SignIn_ErrorFormat.tr(),
            ),
            const Divider(color: Colors.transparent),
            _Button(
              isProcessing: _isProcessing,
              label: LocaleKeys.SignIn_SignIn.tr(),
              onPressed: handleLogin,
            ),
            const Divider(color: Colors.transparent),
            Text(
              LocaleKeys.SignIn_Read.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.redAccent),
            )
          ],
        ),
      );
    }

    return PageTransitionSwitcher(
      transitionBuilder: (child, animation, secondaryAnimation) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          fillColor: Colors.transparent,
          child: child,
        );
      },
      child: child,
    );
  }
}

class _Button extends StatelessWidget {
  final bool isProcessing;
  final String label;
  final VoidCallback onPressed;

  const _Button({
    this.isProcessing = false,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isProcessing ? null : onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isProcessing ? 40 : 120,
        height: 40,
        child: Center(
          child: AnimatedCrossFade(
            crossFadeState: isProcessing
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
            firstChild: Text(
              isProcessing ? '' : label,
              style: const TextStyle(color: Colors.white),
            ),
            secondChild: const SpinKitDoubleBounce(
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
