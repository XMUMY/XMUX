import 'package:firebase_core/firebase_core.dart';
import 'package:sentry/sentry.dart';
import 'package:taskflow/taskflow.dart';
import 'package:xmus_client/authorization.dart';

import '../global.dart';
import '../redux/action/action.dart';
import '../util/platform.dart';
import '../util/remote_config.dart';

final preInitTask = ParallelTask([
  initRemoteConfigsTask,
  initFirebaseTask,
]);

final postInitTask = ParallelTask([
  SequentialTask([
    syncCredentialTask,
    refreshQueriesTask,
  ]),
  fetchRemoteConfigsTask,
]);

/// Initialize Firebase if available.
final initFirebaseTask = Task.when(
  () async => isMobile || isWeb || isMacOS,
  (ctx) async => await Firebase.initializeApp(),
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
    Sentry.configureScope((scope) {
      scope.user = SentryUser(
        id: store.state.user.campusId,
      );
    });
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
