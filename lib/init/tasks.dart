import 'package:firebase_core/firebase_core.dart';
import 'package:sentry/sentry.dart';
import 'package:taskflow/taskflow.dart';
import 'package:xmus_client/authorization.dart';

import '../component/gravatar.dart';
import '../generated/firebase_options.dart';
import '../global.dart';
import '../redux/action/action.dart';
import '../util/platform.dart';
import '../util/remote_config.dart';

final preInitTask = ParallelTask([
  initRemoteConfigsTask,
  initFirebaseTask,
  Gravatar.cdnTestTask,
]);

final postInitTask = ParallelTask([
  SequentialTask([
    syncCredentialTask,
    refreshQueriesTask,
  ]),
  ParallelTask([
    fetchRemoteConfigsTask,
  ])
]);

/// Initialize Firebase if available.
final initFirebaseTask = Task.when(
  () async => isMobile || isWeb || isMacOS,
  (ctx) async => await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ),
);

final syncCredentialTask = ParallelTask.fromFunc([
  // RPC client.
  (ctx) async {
    rpc.authorization.mergeFrom(Authorization.basic(
      store.state.user.campusId,
      store.state.user.password,
    ));
  },
  // Moodle client.
  (ctx) async {
    moodle
      ..setCredential(store.state.user.campusId, store.state.user.password)
      ..login();
  },
  // Sentry
  (ctx) async {
    await Sentry.configureScope(
      (scope) async => await scope.setUser(
        SentryUser(
          id: store.state.user.campusId,
        ),
      ),
    );
  }
]);

final refreshQueriesTask = Task((ctx) async {
  store.dispatch(UpdateUserProfileAction());
  store.dispatch(UpdateTimetableAction());
  store.dispatch(UpdateExamsAction());
  store.dispatch(UpdateTranscriptAction());
  store.dispatch(UpdateCoursesAction());
  store.dispatch(UpdateAssignmentsAction());
});
