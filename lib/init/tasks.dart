import 'package:taskflow/taskflow.dart';
import 'package:xmus_client/authorization.dart';

import '../global.dart';

final postInitTask = SequentialTask([
  syncCredentialTask,
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
