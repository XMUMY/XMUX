import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' as firebaseCore;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xmux/generated/l10n_keys.dart';

import 'remote_config.dart';

class Firebase {
  /// Firebase analytics instance.
  static final analytics = FirebaseAnalytics();

  /// Firebase messaging instance.
  static final messaging = FirebaseMessaging();

  /// Store remote configs.
  static final RemoteConfigs remoteConfigs = RemoteConfigs();

  static Future<void> init() async {
    await firebaseCore.Firebase.initializeApp();
    messaging.requestNotificationPermissions();

    var remoteConfig = await RemoteConfig.instance;
    var defaultStatic = await rootBundle.loadString('res/static.json');
    remoteConfig.setDefaults({'static_resources': defaultStatic});
    remoteConfigs.updateStaticResources(defaultStatic);
    updateRemoteConfig();
  }

  static Future<void> initWeb() async {
    await firebaseCore.Firebase.initializeApp();

    var defaultStatic = await rootBundle.loadString('res/static.json');
    remoteConfigs.updateStaticResources(defaultStatic);
  }

  /// Update and parse remote configs.
  static Future<Null> updateRemoteConfig() async {
    var remoteConfig = await RemoteConfig.instance;
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
  static Future<Null> login(String customToken, {BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signInWithCustomToken(customToken);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed' && context != null) {
        var ignore = await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: Text(LocaleKeys.GMS_Unavailable.tr()),
            content: Text(LocaleKeys.GMS_UnavailableLoginCaption.tr()),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(LocaleKeys.General_Cancel.tr()),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(LocaleKeys.General_Ignore.tr()),
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
    if (FirebaseAuth.instance.currentUser == null) {
      await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text(LocaleKeys.GMS_Unavailable.tr()),
          content: Text(LocaleKeys.GMS_UnavailableCaption.tr()),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(LocaleKeys.General_Cancel.tr()),
            )
          ],
        ),
      );
      return null;
    }
    return Navigator.of(context, rootNavigator: rootNavigator)
        .pushNamed<T>(routeName, arguments: arguments);
  }
}
