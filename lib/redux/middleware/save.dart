import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../state/state.dart';

/// Flag for saving status.
bool _isSaving = false;

/// Redux middleware for state saving.
///
/// When an action contains *needSave* property, the saving process will be
/// invoked. In order to reduce IO frequency, the saving process will be
/// delayed for 1 second unless the *sync* property is true.
void saveMiddleware(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) {
  next(action);

  if (!_isSaving && action.needSave) {
    _isSaving = true;
    _saveState(store, action.syncSave).then((n) => _isSaving = false);
  }
}

Future<void> _saveState(Store<AppState> store, bool sync) async {
  if (!sync) await Future.delayed(const Duration(seconds: 1));
  var prefs = await SharedPreferences.getInstance();
  var state = jsonEncode(store.state);
  await prefs.setString('app_state', state);
}
