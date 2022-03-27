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
      settings: settingsReducer(state.settings, action),
    );

AppState _initializedReducer(AppState state, InitializedAction action) =>
    state.copyWith(isInitialized: true);

AppState _restoreReducer(AppState state, RestoreAction action) => action.state;

final Reducer<UserState> userReducer = combineReducers([
  TypedReducer(_loginReducer),
  TypedReducer(_updateEPaymentPasswordReducer),
  TypedReducer(_updateUserProfileReducer),
]);

UserState _loginReducer(UserState state, LoginAction action) => state.copyWith(
      campusId: action.campusId,
      password: action.password,
    );

UserState _updateEPaymentPasswordReducer(
  UserState state,
  UpdateEPaymentPasswordAction action,
) =>
    state.copyWith(ePaymentPassword: action.ePaymentPassword);

UserState _updateUserProfileReducer(
  UserState state,
  UpdateUserProfileAction action,
) =>
    state.copyWith(profile: action.response);

// Queries

final Reducer<QueryState> queriesReducer = combineReducers([
  TypedReducer(_updateTimetableReducer),
  TypedReducer(_updateCoursesReducer),
  TypedReducer(_updateExamsReducer),
  TypedReducer(_updateTranscriptReducer),
  TypedReducer(_updateAssignmentsReducer),
  TypedReducer(_updateEmgsApplicationResultReducer),
]);

QueryState _updateTimetableReducer(
  QueryState state,
  UpdateTimetableAction action,
) =>
    state.copyWith(timetable: action.response);

QueryState _updateCoursesReducer(
  QueryState state,
  UpdateCoursesAction action,
) =>
    state.copyWith(courses: action.response);

QueryState _updateExamsReducer(QueryState state, UpdateExamsAction action) =>
    state.copyWith(exams: action.response);

QueryState _updateTranscriptReducer(
  QueryState state,
  UpdateTranscriptAction action,
) =>
    state.copyWith(transcript: action.response);

QueryState _updateAssignmentsReducer(
  QueryState state,
  UpdateAssignmentsAction action,
) =>
    state.copyWith(assignments: action.response);

QueryState _updateEmgsApplicationResultReducer(
  QueryState state,
  UpdateEmgsApplicationResultAction action,
) =>
    state.copyWith(emgsApplicationResult: action.result);

// Settings

final Reducer<SettingState> settingsReducer = combineReducers([
  TypedReducer(_showPerformanceOverlayReducer),
  TypedReducer(_showSemanticsDebuggerReducer),
  TypedReducer(_enableDevFunctionsReducer),
]);

SettingState _showPerformanceOverlayReducer(
  SettingState state,
  ShowPerformanceOverlayAction action,
) =>
    state.copyWith(showPerformanceOverlay: action.show);

SettingState _showSemanticsDebuggerReducer(
  SettingState state,
  ShowSemanticsDebuggerAction action,
) =>
    state.copyWith(showSemanticsDebugger: action.show);

SettingState _enableDevFunctionsReducer(
  SettingState state,
  EnableDevFunctionsAction action,
) =>
    state.copyWith(enableDevFunctions: action.enable);
