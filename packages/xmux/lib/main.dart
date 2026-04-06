import 'package:flutter/widgets.dart';
import 'package:sentry/sentry.dart';
import 'package:taskflow/taskflow.dart';

import 'app.dart';
import 'business/init/init_tasks.dart';
import 'business/init/pre_init_tasks.dart';
import 'foundation/config/config.dart';
import 'foundation/platform/environment.dart';

void main() {
  // Wrap by sentry client
  if (isRelease) {
    Sentry.init(
      (options) => options..dsn = sentryDsn,
      appRunner: run,
    );
  } else {
    run();
  }
}

Future<void> run() async {
  await preInitTask(TaskFlowContext());
  runApp(const App());
  await initTask(TaskFlowContext());
}
