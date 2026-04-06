import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:taskflow/taskflow.dart';

import '../../foundation/firebase/init.dart';
import '../../foundation/router/observer.dart';

/// Pre-initialization tasks that should be executed before [runApp].
final preInitTask = ParallelTask([
  SequentialTask([
    initWidgetsFlutterBindingTask,
    initEasyLocalizationTask,
  ]),
  initFirebaseTask,
  injectRouterObserverTask,
]);

final initWidgetsFlutterBindingTask =
    Task((ctx) async => WidgetsFlutterBinding.ensureInitialized());

final initEasyLocalizationTask =
    Task((ctx) async => await EasyLocalization.ensureInitialized());
