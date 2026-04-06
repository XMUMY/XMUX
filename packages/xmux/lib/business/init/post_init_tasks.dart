import 'package:sentry/sentry.dart';
import 'package:taskflow/taskflow.dart';
import 'package:xmus_client/authorization.dart';

import '../../foundation/firebase/init.dart';
import '../../global.dart';
import '../redux/action/action.dart';
import '../redux/store.dart';

final postInitTask = ParallelTask([
  SequentialTask([
    syncCredentialTask,
    refreshQueriesTask,
  ]),
  ParallelTask([
    fetchRemoteConfigsTask,
  ])
]);

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
