import 'package:firebase_core/firebase_core.dart';
import 'package:taskflow/taskflow.dart';

import '../config/firebase_options.dart';
import '../platform/platform.dart';
import 'remote_config.dart';

final initFirebaseTask = Task.when(
  () async => isWeb || isMobileApp || isMacOSApp,
  (ctx) async => await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ),
);

final initRemoteConfigsTask =
    Task((ctx) => RemoteConfigs.instance.loadDefaultStaticResources());

final fetchRemoteConfigsTask = Task.when(
  () async => isMobileApp || isMacOSApp,
  (ctx) async {
    // Try to fetch latest static resources
    RemoteConfigs.instance.loadFirebaseStaticResources();
  },
);
