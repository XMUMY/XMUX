import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
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
import 'util/platform.dart';
import 'util/remote_config.dart';

export 'package:easy_localization/easy_localization.dart'
    show StringTranslateExtension;

export 'generated/locale_keys.g.dart' show LocaleKeys;

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
  observers: [
    if (kReleaseMode && (isMobile || isWeb))
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
  redirect: (state) {
    if (state.location == '/Init' || state.location == '/Login') return null;

    if (!store.state.isInitialized) return '/Init';
    if (!store.state.user.isSignedIn) return '/Login';

    return null;
  },
);

/// RPC client.
final rpc = XmuxRpc(apiAddress);

/// Moodle client.
final moodle = MoodleApi(moodleAddress);

/// Remote configs.
final remoteConfigs = RemoteConfigs();
