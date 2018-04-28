import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:xmux/config.dart';
import 'package:xmux/loginapp/login_app.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/middleware.dart';
import 'package:xmux/redux/reducers/main_reducer.dart';
import 'package:xmux/redux/state.dart';

final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
FirebaseUser firebaseUser;

final Store<MainAppState> mainAppStore = Store<MainAppState>(mainAppReducer,
    initialState: MainAppState(), middleware: [saveMiddleware]);

class BackendApiHandler {
  static Future<http.Response> post(
          {context, @required String api, @required Map body}) async =>
      await http.post(
        BackendApiConfig.address + api,
        headers: {
          "Accept-Language": context == null
              ? null
              : Localizations.localeOf(context).languageCode +
                  "-" +
                  Localizations.localeOf(context).countryCode +
                  "," +
                  Localizations.localeOf(context).languageCode +
                  ";q=0.9",
        },
        body: body,
      );

  static Future<http.Response> get({context, @required String api}) async =>
      await http.get(
        BackendApiConfig.address + api,
        headers: {
          "Accept-Language": context == null
              ? null
              : Localizations.localeOf(context).languageCode +
                  "-" +
                  Localizations.localeOf(context).countryCode +
                  "," +
                  Localizations.localeOf(context).languageCode +
                  ";q=0.9",
        },
      );
}

class EmptyErrorPage extends StatelessWidget {
  final AsyncCallback onRefresh;

  EmptyErrorPage({AsyncCallback onRefresh})
      : this.onRefresh = onRefresh ?? (() {});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(20.0),
        child: Card(
          child: FlatButton(
            onPressed: onRefresh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.hourglass_empty,
                  size: 50.0,
                  color: Theme.of(context).errorColor,
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                Text(
                  "Oh! Nothing is here!\nPlease refresh or come later.",
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                Text(
                  "噢！这里什么也没有！\n请刷新或稍后再来。",
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      );
}

Future<Null> signOut() async {
  await FirebaseAuth.instance.signOut();
  mainAppStore.dispatch(LogoutAction());
  runApp(LoginApp());
}
