import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/calendar/calendar_handler.dart';
import 'package:xmux/translations/translation.dart';

class SignInButton extends StatefulWidget {
  final Map<String, dynamic> _theClass;
  final bool _canSign;

  SignInButton(this._theClass)
      : this._canSign = (_theClass["dayOfWeek"] ==
                DateTime.now().weekday - 1) &&
            ((int.parse(_theClass["startTimeOfDay"].split(":")[0]) * 60 +
                        int.parse(_theClass["startTimeOfDay"].split(":")[1]) -
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
          "http://${BackendApiConfig.signInAddress}:8080/checkinforapp.php",
          body: {
            "uid": firebaseUser.uid,
            "cid": widget._theClass["courseCode"],
            "ip": await CalendarHandler.getIP(context),
          });

      var resJson = jsonDecode(response.body);
      if (resJson["result"] == "Success") {
        Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                  MainLocalizations.of(context).get("Calendar/SignIn/Signing")),
            ));
        setState(() {
          _alreadySignedIn = true;
        });
      } else
        Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                  MainLocalizations.of(context).get("Calendar/SignIn/Failed") +
                      " : " +
                      resJson["msg"]),
            ));
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Network Error. Pls connect to campus Network."),
          ));
    }
  }

  @override
  Widget build(BuildContext context) => FlatButton(
      onPressed:
          widget._canSign && !_alreadySignedIn ? () => _handleSignIn() : null,
      child: Text(MainLocalizations.of(context).get("Calendar/SignIn")));
}
