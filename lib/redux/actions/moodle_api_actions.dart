part of 'actions.dart';

abstract class MoodleApiAction<T> extends ApiCallAction {
  /// Moodle API response.
  T response;
}

class UpdateAssignmentsAction extends MoodleApiAction<List<AssignmentCourse>> {
  @override
  Future<Null> call(Store<MainAppState> store) async {
    response = await moodleApi.assignments;
  }
}
