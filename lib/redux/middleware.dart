import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      '[Redux/saveMiddleware] Invoked (Action: ${action.runtimeType} IsSaving: $_isSaving NeedSave: ${action.needSave} Sync: ${action.sync})');

  if (!_isSaving && action.needSave) {
    _isSaving = true;
    _saveState(store, action.sync).then((n) => _isSaving = false);
  }
}

Future<Null> _saveState(Store<MainAppState> store, bool sync) async {
  if (!sync) await Future.delayed(Duration(seconds: 1));
  print('[Redux/saveMiddleware] Saving state...');
  var prefs = await SharedPreferences.getInstance();
  var state = jsonEncode(store.state.toJson());
  var result = await prefs.setString('state', state);
  if (result) print('[Redux/saveMiddleware] State saved');
}

/// Redux middleware for XMUX API request.
///
/// If an action is [ApiCallAction], the middleware will call for API request
/// before go to next middleware.
void apiRequestMiddleware(
    Store<MainAppState> store, action, NextDispatcher next) {
  if (action is ApiCallAction) {
    print(
        '[Redux/apiRequestMiddleware] Invoked (Action: ${action.runtimeType})');
    if (action is ApiCallAction) action.future = apiCall(store, action, next);
  } else
    next(action);
}

Future<Null> apiCall(Store<MainAppState> store, ApiCallAction action,
    NextDispatcher next) async {
  try {
    await action(store);
    next(action);
  } catch (e) {
    if (action.onError != null)
      action.onError(e);
    else
      rethrow;
  }
}
