import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:xmux/config.dart';
import 'package:xmux/modules/error_widgets/error_widgets.dart';
import 'package:xmux/redux/middleware.dart';
import 'package:xmux/redux/reducers/main_reducer.dart';
import 'package:xmux/redux/state.dart';

/// Firebase messaging instance.
final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

/// Firebase user instance.
///
/// Default is null. Will be assigned by FirebaseUser when logged in.
FirebaseUser firebaseUser;

/// Main store for redux.
final Store<MainAppState> mainAppStore = Store<MainAppState>(mainAppReducer,
    initialState: MainAppState(), middleware: [saveMiddleware]);

/// Error widgets instance.
final errorWidgets = ErrorWidgets();

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
