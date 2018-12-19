import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/calendar/calendar_handler.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

class SignInButton extends StatefulWidget {
  final Lesson _theClass;
  final bool _canSign;

  SignInButton(this._theClass)
      : this._canSign = (_theClass.dayOfWeek == DateTime.now().weekday - 1) &&
            ((_theClass.startTimeOfDay.hour * 60 +
                        _theClass.startTimeOfDay.minute -
                        (DateTime.now().hour * 60 + DateTime.now().minute))
                    .abs() <
                20);

  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  bool _alreadySignedIn = false;

  Future<Null> _handleSignIn() async {
    try {
      // Get answer from sign in server.
      var response = await http.post(
          'http://${BackendApiConfig.signInAddress}:8080/checkinforapp.php',
          body: {
            'uid': firebaseUser.uid,
            'cid': widget._theClass.courseCode,
            'ip': await CalendarHandler.getIP(context),
          });

      var resJson = jsonDecode(response.body);
      if (resJson['result'] == 'Success') {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(i18n('Calendar/SignIn/Signing', context)),
        ));
        setState(() => _alreadySignedIn = true);
      } else
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              i18n('Calendar/SignIn/Failed', context) + ' : ' + resJson['msg']),
        ));
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Network Error. Pls connect to campus Network.'),
      ));
    }
  }

  void check() async {
    try {
      // Get answer from sign in server.
      var response = await http.post(
          'http://${BackendApiConfig.signInAddress}:8080/coursequeryforapp.php',
          body: {
            'uid': firebaseUser.uid.toUpperCase(),
            'cid': widget._theClass.courseCode,
          });

      var resJson = jsonDecode(response.body);
      if (resJson['result'] == 'Success') {
        setState(() => _alreadySignedIn = true);
      }
    } catch (e) {}
  }

  @override
  void initState() {
    check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FlatButton(
        onPressed:
            widget._canSign && !_alreadySignedIn ? () => _handleSignIn() : null,
        child: _alreadySignedIn
            ? Text('OK')
            : Text(i18n('Calendar/SignIn', context)),
      );
}
