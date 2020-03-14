import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sentry/sentry.dart' as sentry_lib;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/main_app.dart';
import 'package:xmux/modules/api/xmux_api.dart';
import 'package:xmux/modules/xia/xia.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart' as v2;
import 'package:xmux/redux/redux.dart';

/// Main initialization progress.
void init() async {
  // Create APIv3 Client.
  XmuxApi(BackendApiConfig.address);
  // Select XMUX API server. (Deprecated)
  v2.XMUXApi([BackendApiConfig.address]);

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
  postInit();
}

/// Post initialization after authentication.
void postInit() async {
  try {
    // Set user info for sentry report.
    sentry.userContext = sentry_lib.User(id: store.state.user.campusId);
  } catch (e) {
    sentry.captureException(exception: e);
  } finally {
    store.dispatch(UpdateHomepageAnnouncementsAction());
    store.dispatch(UpdateTimetableAction());
    if (store.state.user.isStudent) {
      store.dispatch(UpdateAssignmentsAction());
      store.dispatch(UpdateInfoAction());
      store.dispatch(UpdateAcAction());
      store.dispatch(UpdateCoursesAction());
      store.dispatch(UpdateUserProfileAction());
    }
    runApp(MainApp());
  }
}
