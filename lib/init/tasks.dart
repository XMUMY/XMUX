import 'package:taskflow/taskflow.dart';
import 'package:xmus_client/authorization.dart';

import '../global.dart';
import '../redux/action/action.dart';

final postInitTask = SequentialTask([
  syncCredentialTask,
  refreshQueriesTask,
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
  }
]);

final refreshQueriesTask = Task((ctx) async {
  store.dispatch(UpdateTimetableAction());
});
