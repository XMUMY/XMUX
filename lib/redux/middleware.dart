import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

import 'actions/actions.dart';
import 'state/state.dart';

/// Flag for saving status.
bool _isSaving = false;

/// Redux middleware for state saving.
///
/// When an action contains *needSave* property, the saving process will be
/// invoked. In order to reduce IO frequency, the saving process will be
/// delayed for 1 second unless the *sync* property is true.
void saveMiddleware(Store<MainAppState> store, action, NextDispatcher next) {
  next(action);

  print(
      'Redux/saveMiddleware: Invoked (Action: ${action.runtimeType} IsSaving: ${_isSaving.toString()} NeedSave: ${action.needSave} Sync: ${action.sync}) ');

  if (!_isSaving && action.needSave) {
    _isSaving = true;
    _saveState(store, action.sync).then((n) => _isSaving = false);
  }
}

Future<Null> _saveState(Store<MainAppState> store, bool sync) async {
  if (!sync) await Future.delayed(Duration(seconds: 1));
  print('Redux/saveMiddleware: Saving state...');
  String appDocDir = (await getApplicationDocumentsDirectory()).path;
  await File('$appDocDir/state.dat')
      .writeAsString(jsonEncode(store.state.toJson()));
}

/// Redux middleware for XMUX API request.
///
/// If an action is *XMUXApiAction*, the middleware will call for API request
/// before go to next middleware.
void apiRequestMiddleware(
    Store<MainAppState> store, action, NextDispatcher next) {
  if (action is XMUXApiAction) {
    print(
        'Redux/apiRequestMiddleware: Invoked (Action: ${action.runtimeType})');
    action.listener = apiCall(store, action, next);
  } else
    next(action);
}

Future<Null> apiCall(Store<MainAppState> store, XMUXApiAction action,
    NextDispatcher next) async {
  try {
    await action(
      XMUXApiAuth(
          campusID: store.state.authState.campusID,
          campusIDPassword: store.state.authState.campusIDPassword,
          ePaymentPassword: store.state.authState.ePaymentPassword,
          moodleKey: store.state.authState.moodleKey),
      params: action.params,
    );
    next(action);
  } catch (e) {
    // Sign out if wrong password.
    if (e is XMUXApiException && e.type == 'WrongPasswordError')
      logout();
    else {
      if (action.context != null)
        Scaffold.of(action.context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      if (action.onError != null) action.onError();
      if (action.context == null && action.onError == null) rethrow;
    }
  }
}
