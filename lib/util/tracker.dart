import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../global.dart';
import 'platform.dart';

class RouterObserver extends RouteObserver<ModalRoute<dynamic>> {
  /// Expand path arguments.
  static String? nameExtractor(RouteSettings settings) {
    var name = settings.name;
    final args = settings.arguments;
    if (args is Map<String, String>) {
      for (final entry in args.entries) {
        name = name?.replaceFirst(':${entry.key}', entry.value);
      }
    }
    return name;
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (defaultRouteFilter(route)) {
      log.d('screenName: ${nameExtractor(route.settings)}');
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null && defaultRouteFilter(newRoute)) {
      log.d('screenName: ${nameExtractor(newRoute.settings)}');
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null &&
        defaultRouteFilter(previousRoute) &&
        defaultRouteFilter(route)) {
      log.d('screenName: ${nameExtractor(previousRoute.settings)}');
    }
  }
}

void setCurrentScreen({required String screenName}) {
  log.d('screenName: $screenName');
  if (kReleaseMode && (isMobile || isWeb)) {
    FirebaseAnalytics.instance.setCurrentScreen(screenName: screenName);
  }
}
