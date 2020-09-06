part of 'actions.dart';

/// General actions for XMUX API.
abstract class XmuxRpcAction<T> extends ApiCallAction {
  T response;
}

/// Update timetable for current semester.
class UpdateTimetableAction extends XmuxRpcAction<Timetable> {
  @override
  Future<Null> call(Store<MainAppState> store) async {
    response = await rpc.aaosClient.getTimetable(Empty());
  }
}

class UpdateCoursesAction extends XmuxRpcAction<Courses> {
  @override
  Future<Null> call(Store<MainAppState> store) async {
    response = await rpc.aaosClient.getCourses(Empty());
  }
}

class UpdateExamsAction extends XmuxRpcAction<Exams> {
  @override
  Future<Null> call(Store<MainAppState> store) async {
    response = await rpc.aaosClient.getExams(Empty());
  }
}

class UpdateTranscriptAction extends XmuxRpcAction<Transcript> {
  @override
  Future<Null> call(Store<MainAppState> store) async {
    response = await rpc.aaosClient.getTranscript(Empty());
  }
}

class SyncUserProfileAction extends XmuxRpcAction<Profile> {
  @override
  Future<Null> call(Store<MainAppState> store) async {
    response = await rpc.userClient.getProfile(GetProfileReq());
  }
}
