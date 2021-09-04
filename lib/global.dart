import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:moodle/moodle.dart';
import 'package:redux/redux.dart';
import 'package:xmus_client/xmus_client.dart';

import 'config.dart';
import 'redux/middleware/api_request.dart';
import 'redux/middleware/save.dart';
import 'redux/reducer/reducer.dart';
import 'redux/state/state.dart';
import 'util/remote_config.dart';

export 'package:easy_localization/easy_localization.dart'
    show StringTranslateExtension;

export 'generated/locale_keys.g.dart' show LocaleKeys;

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

/// Remote configs.
final remoteConfigs = RemoteConfigs();

/// Firebase Analytics.
final firebaseAnalytics = FirebaseAnalytics();
