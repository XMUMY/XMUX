import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../action/action.dart';
import '../state/state.dart';

Timer? _scheduledSave;

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

  if (action is AppAction && action.needSave) {
    if (action.syncSave) {
      _scheduledSave?.cancel();
      _scheduledSave = null;
      _save(store.state);
    } else {
      _scheduledSave ??= Timer(const Duration(seconds: 1), () {
        _scheduledSave = null;
        _save(store.state);
      });
    }
  }
}

Future<void> _save(AppState state) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('app_state', jsonEncode(state));
}
