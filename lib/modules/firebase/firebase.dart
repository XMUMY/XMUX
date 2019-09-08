import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'remote_config.dart';

class Firebase {
  // Unique instance for firebase.
  static Firebase instance;

  /// Firebase analytics instance.
  final analytics = FirebaseAnalytics();

  /// Firebase messaging instance.
  final messaging = FirebaseMessaging();

  /// Firebase remote config instance.
  final RemoteConfig remoteConfig;

  /// Store remote configs.
  final RemoteConfigs remoteConfigs = RemoteConfigs();

  Firebase._(this.remoteConfig);

  static Future<Firebase> init() async {
    if (instance != null) return instance;
    instance = Firebase._(await RemoteConfig.instance)
      ..messaging.requestNotificationPermissions();
    await instance.updateRemoteConfig();
    return instance;
  }

  /// Update and parse remote configs.
  Future<Null> updateRemoteConfig() async {
    try {
      await remoteConfig.fetch();
      await remoteConfig.activateFetched();
    } catch (_) {} finally {
      var staticResources = remoteConfig.getString('static_resources');
      if (staticResources.isNotEmpty)
        remoteConfigs.updateStaticResources(staticResources);
      var versions = remoteConfig.getString('versions');
      if (versions.isNotEmpty) remoteConfigs.updateVersions(versions);
    }
  }
}
