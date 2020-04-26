import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xmux/generated/i18n.dart';

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

  /// Store [FirebaseUser] while signed in.
  FirebaseUser user;

  Firebase._(this.remoteConfig);

  static Future<Firebase> init() async {
    if (instance != null) return instance;

    instance = Firebase._(await RemoteConfig.instance)
      ..messaging.requestNotificationPermissions();

    var defaultStatic = await rootBundle.loadString('res/static.json');
    instance.remoteConfig.setDefaults({'static_resources': defaultStatic});
    instance.remoteConfigs.updateStaticResources(defaultStatic);
    instance.updateRemoteConfig();

    return instance;
  }

  static Future<Firebase> initWeb() async {
    if (instance != null) return instance;

    instance = Firebase._(null);

    var defaultStatic = await rootBundle.loadString('res/static.json');
    instance.remoteConfigs.updateStaticResources(defaultStatic);

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

  /// Try login firebase.
  /// Shows confirmation dialog if cannot connect to GMS and [context] is not null.
  Future<Null> login(String customToken, {BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signInWithCustomToken(token: customToken);
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_NETWORK_REQUEST_FAILED' && context != null) {
        var ignore = await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: Text(S.of(context).GMS_Unavailable),
            content: Text(S.of(context).GMS_UnavailableLoginCaption),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(S.of(context).General_Cancel),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(S.of(context).General_Ignore),
              )
            ],
          ),
        );
        if (ignore != null && ignore) return;
      }
      rethrow;
    }
  }

  /// Push route after ensuring firebase signed in.
  static Future<T> pushNamed<T extends Object>(
    BuildContext context,
    String routeName, {
    Object arguments,
    bool rootNavigator = false,
  }) async {
    if (instance.user == null) {
      var result = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text(S.of(context).GMS_Unavailable),
          content: Text(S.of(context).GMS_UnavailableCaption),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(S.of(context).General_Cancel),
            )
          ],
        ),
      );
      if (result == null || !result) return null;
    }
    return Navigator.of(context, rootNavigator: rootNavigator)
        .pushNamed<T>(routeName, arguments: arguments);
  }
}
