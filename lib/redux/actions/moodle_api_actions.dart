part of 'actions.dart';

abstract class MoodleApiAction<T> extends ApiCallAction {
  /// Moodle API response.
  T response;

  /// Ensure moodle token is available.
  Future<void> ensureLogin(Store<MainAppState> store) async {
    if (moodleApi.token == null)
      await moodleApi.login(
        store.state.user.campusId,
        store.state.user.password,
      );
  }
}

class UpdateAssignmentsAction extends MoodleApiAction<List<AssignmentCourse>> {
  @override
  Future<Null> call(Store<MainAppState> store) async {
    await ensureLogin(store);
    response = await moodleApi.assignments;
  }
}
