part of 'reducer.dart';

final Reducer<AcState> acReducers = combineReducers([
  TypedReducer<AcState, UpdateAcAction>(_acReducer),
  TypedReducer<AcState, UpdateCoursesAction>(_acCoursesReducer),
  TypedReducer<AcState, UpdateInfoAction>(_acInfoReducer),
  TypedReducer<AcState, UpdateAssignmentsAction>(_moodleReducer)
]);

AcState _acReducer(AcState oldState, UpdateAcAction action) =>
    oldState.copyWith(
        status: action.status,
        timestamp: action.timestamp,
        timetable: action.acData.timetable,
        exams: action.acData.exams,
        examResult: action.acData.examResult);

AcState _acCoursesReducer(AcState oldState, UpdateCoursesAction action) =>
    oldState.copyWith(courses: action.acData.courses);

AcState _acInfoReducer(AcState oldState, UpdateInfoAction action) =>
    oldState.copyWith(info: action.info);

AcState _moodleReducer(AcState oldState, UpdateAssignmentsAction action) =>
    oldState.copyWith(assignments: action.moodleData.assignments);
