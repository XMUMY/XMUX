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

class UpdateCoursesAction extends XmuxRpcAction<Courses> {
  @override
  Future<void> call(Store<AppState> store) async {
    response = await rpc.aaosClient.getCourses(Empty());
  }
}

class UpdateExamsAction extends XmuxRpcAction<Exams> {
  @override
  Future<void> call(Store<AppState> store) async {
    response = await rpc.aaosClient.getExams(Empty());
  }
}

class UpdateTranscriptAction extends XmuxRpcAction<Transcript> {
  @override
  Future<void> call(Store<AppState> store) async {
    response = await rpc.aaosClient.getTranscript(Empty());
  }
}
