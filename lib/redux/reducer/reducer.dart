import 'package:redux/redux.dart';

import '../action/action.dart';
import '../state/state.dart';

final Reducer<AppState> appReducer = combineReducers([
  _appReducer,
  TypedReducer(_initializedReducer),
  TypedReducer(_restoreReducer),
]);

AppState _appReducer(AppState state, dynamic action) => state.copyWith(
      user: userReducer(state.user, action),
      queries: queriesReducer(state.queries, action),
    );

AppState _initializedReducer(AppState state, InitializedAction action) =>
    state.copyWith(isInitialized: true);

AppState _restoreReducer(AppState state, RestoreAction action) => action.state;

final Reducer<UserState> userReducer = combineReducers([
  TypedReducer(_loginReducer),
]);

UserState _loginReducer(UserState state, LoginAction action) => state.copyWith(
      campusId: action.campusId,
      password: action.password,
    );

final Reducer<QueryState> queriesReducer = combineReducers([
  TypedReducer(_updateTimetableReducer),
  TypedReducer(_updateCoursesReducer),
  TypedReducer(_updateExamsReducer),
  TypedReducer(_updateTranscriptReducer),
]);

QueryState _updateTimetableReducer(
        QueryState state, UpdateTimetableAction action) =>
    state.copyWith(timetable: action.response);

QueryState _updateCoursesReducer(
        QueryState state, UpdateCoursesAction action) =>
    state.copyWith(courses: action.response);

QueryState _updateExamsReducer(QueryState state, UpdateExamsAction action) =>
    state.copyWith(exams: action.response);

QueryState _updateTranscriptReducer(
        QueryState state, UpdateTranscriptAction action) =>
    state.copyWith(transcript: action.response);
