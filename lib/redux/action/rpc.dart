part of 'action.dart';

abstract class XmuxRpcAction<T> extends ApiRequestAction {
  late T response;
}

class UpdateTimetableAction extends XmuxRpcAction<Timetable> {
  @override
  Future<void> call(Store<AppState> store) async {
    response = await rpc.aaosClient.getTimetable(Empty());
  }
}
