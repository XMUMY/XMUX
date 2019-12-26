import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xia/xia.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v3.dart';
import 'package:xmux/redux/redux.dart';

/// Main initialization progress.
void init() async {
  // Register sentry to capture errors.
  FlutterError.onError = (e) =>
      sentry.captureException(exception: e.exception, stackTrace: e.stack);

  // Create APIv3 Client.
  XMUXApi(BackendApiConfig.address);

  // Init XiA async.
  XiA.init(ApiKeyConfig.dialogflowToken)
      .then((x) => xiA = x)
      .catchError((e) => sentry.captureException(exception: e));

  // Check if local state is available.
  try {
    var prefs = await SharedPreferences.getInstance();
    var state = prefs.getString('state');
    Map<String, dynamic> initMap = jsonDecode(state);

    // Init store from initMap
    store.dispatch(InitAction(initMap));
  } catch (e) {
    // campusId.toLowerCase() will called on null if user not login yet.
    logout();
    return;
  }

  // Make sure firebase logged in.
  if (firebaseUser == null &&
      (firebaseUser = await FirebaseAuth.instance.currentUser()) == null) {
    logout();
    return;
  }
}
