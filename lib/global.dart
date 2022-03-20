import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:moodle/moodle.dart';
import 'package:redux/redux.dart';
import 'package:xmus_client/xmus_client.dart';

import 'config.dart';
import 'redux/middleware/api_request.dart';
import 'redux/middleware/redirect.dart';
import 'redux/middleware/save.dart';
import 'redux/reducer/reducer.dart';
import 'redux/state/state.dart';
import 'route.dart';
import 'util/remote_config.dart';
import 'util/tracker.dart';

export 'package:easy_localization/easy_localization.dart'
    show StringTranslateExtension;

export 'generated/locale_keys.g.dart' show LocaleKeys;

/// Global logger.
final log = Logger();

/// Redux store.
final store = Store(
  appReducer,
  initialState: AppState(),
  middleware: [
    redirectMiddleware,
    apiRequestMiddleware,
    saveMiddleware,
  ],
  distinct: true,
);

// Global router.
final router = GoRouter(
  routes: routes,
  redirect: (state) {
    if (state.location == '/Init' || state.location == '/Login') return null;

    if (!store.state.isInitialized) return '/Init';
    if (!store.state.user.isSignedIn) return '/Login';

    return null;
  },
  observers: [routeObserver],
);

final routeObserver = RouterObserver();

/// RPC client.
final rpc = XmuxRpc(apiAddress);

/// Moodle client.
final moodle = MoodleApi(moodleAddress);

/// Remote configs.
final remoteConfigs = RemoteConfigs();
