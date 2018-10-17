import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

import 'actions/actions.dart';
import 'state.dart';

/// Flag for saving status.
bool _isSaving = false;

/// Redux middleware for state saving.
///
/// When an action contains *needSave* property, the saving process will be
/// invoked. In order to reduce IO frequency, the saving process will be
/// delayed for 3 second unless the *sync* property is true.
void saveMiddleware(Store<MainAppState> store, action, NextDispatcher next) {
  next(action);

  print(
      "Redux/saveMiddleware: Invoked (Action: ${action.runtimeType} IsSaving: ${_isSaving.toString()} NeedSave: ${action.needSave} Sync: ${action.sync}) ");

  if (!_isSaving && action.needSave) {
    _isSaving = true;
    _fileSave(jsonEncode(mainAppStore.state.toMap()), "state.dat",
            sync: action.sync)
        .then((n) => _isSaving = false);
  }
}

Future<Null> _fileSave(String fileText, String fileName, {bool sync}) async {
  if (!sync) await Future.delayed(Duration(seconds: 3));
  print("Redux/saveMiddleware: Saving state...");
  String appDocDir = (await getApplicationDocumentsDirectory()).path;
  await (File('$appDocDir/$fileName')).writeAsString(fileText);
}

/// Redux middleware for XMUX API request.
///
/// If an action is *XMUXApiAction*, the middleware will call for API request
/// before go to next middleware.
void apiRequestMiddleWare(
    Store<MainAppState> store, action, NextDispatcher next) {
  if (action is XMUXApiAction) {
    action.listener = action(
            XMUXApiAuth(
                campusID: store.state.personalInfoState.uid,
                password: store.state.personalInfoState.password),
            params: action.params)
        .then((_) => next(action));
  } else
    next(action);
}
