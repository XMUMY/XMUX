import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskflow/taskflow.dart';

import '../global.dart';
import '../redux/action/action.dart';
import '../redux/state/state.dart';
import 'tasks.dart';

Future<void> init() async {
  await preInitTask(TaskFlowContext());

  try {
    final prefs = await SharedPreferences.getInstance();
    final stateStr = prefs.getString('app_state');
    final state = AppState.fromJson(jsonDecode(stateStr!));
    if (!state.user.isSignedIn) throw Exception('NotSignedIn');
    store.dispatch(RestoreAction(state));
  } catch (_) {
    // Failed to restore app state.
    store.dispatch(InitializedAction());
    return;
  }

  store.dispatch(InitializedAction());
  postInitTask(TaskFlowContext());
}
