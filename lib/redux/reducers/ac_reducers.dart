part of 'reducer.dart';

final Reducer<AcState> acReducers = combineReducers([
  new TypedReducer<AcState, UpdateAcAction>(_acReducer),
  new TypedReducer<AcState, UpdateCoursesAction>(_acCoursesReducer),
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
