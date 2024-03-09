import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskflow/taskflow.dart';

import '../../component/gravatar.dart';
import '../../foundation/firebase/init.dart';
import '../redux/action/action.dart';
import '../redux/state/state.dart';
import '../redux/store.dart';
import 'post_init_tasks.dart';

final initTask = Task((ctx) async {
  await initRemoteConfigsTask(ctx);
  await Gravatar.cdnTestTask(ctx);

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
  postInitTask(ctx);
});
