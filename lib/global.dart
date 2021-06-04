import 'package:moodle/moodle.dart';
import 'package:redux/redux.dart';
import 'package:xmus_client/xmus_client.dart';

import 'config.dart';
import 'redux/middleware/api_request.dart';
import 'redux/middleware/save.dart';
import 'redux/reducer/reducer.dart';
import 'redux/state/state.dart';

/// Redux store.
final store = Store(
  appReducer,
  initialState: AppState(),
  middleware: [
    apiRequestMiddleware,
    saveMiddleware,
  ],
  distinct: true,
);

/// RPC client.
final rpc = XmuxRpc(apiAddress);

/// Moodle client.
final moodle = MoodleApi(moodleAddress);
