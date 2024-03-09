import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:taskflow/taskflow.dart';

import '../../global.dart';
import '../platform/environment.dart';
import '../platform/platform.dart';
import 'router.dart';

final injectRouterObserverTask =
    Task((ctx) async => router.routerDelegate.addListener(_onRouteChange));

String? _previousLocation;
final _timer = Stopwatch()..start();

void _onRouteChange() {
  final config = router.routerDelegate.currentConfiguration;
  final location = config.last.matchedLocation;

  if (_previousLocation == location) return;

  log.t('$_previousLocation(${_timer.elapsed}) -> $location');
  if (isRelease && (isWeb || isMobileApp || isMacOSApp)) {
    FirebaseAnalytics.instance.logScreenView(
      screenName: location,
    );
  }

  _previousLocation = location;
  _timer.reset();
}
