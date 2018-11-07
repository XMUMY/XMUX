import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../state.dart';

part 'ac_reducers.dart';
part 'query_reduer.dart';
part 'setting_reducers.dart';
part 'ui_reducers.dart';

/// Reducers for MainAppState.
MainAppState appReducer(MainAppState oldState, dynamic action) {
  if (action is LogoutAction)
    return MainAppState.def();
  else if (action is InitAction)
    return MainAppState.fromJson(action.initMap);
  else
    return MainAppState(
      acReducers(oldState.acState, action),
      authReducers(oldState.authState, action),
      queryReducers(oldState.queryState, action),
      settingReducers(oldState.settingState, action),
      uiState: uiReducers(oldState.uiState, action),
    );
}

/// Reducers for AuthState.
final Reducer<AuthState> authReducers = combineReducers([
  TypedReducer<AuthState, LoginAction>(_loginReducer),
  TypedReducer<AuthState, UpdateEPaymentRecordsAction>(
      _updateEPaymentPasswordReducer),
  TypedReducer<AuthState, UpdateAssignmentsAction>(_updateMoodleKeyReducer),
]);

AuthState _loginReducer(AuthState oldState, LoginAction action) =>
    oldState.copyWith(
        campusID: action.auth.campusID,
        campusIDPassword: action.auth.campusIDPassword,
        moodleKey: action.moodleKey);

/// Update ePayment password when first login.
AuthState _updateEPaymentPasswordReducer(
        AuthState oldState, UpdateEPaymentRecordsAction action) =>
    action.auth == null
        ? oldState
        : oldState.copyWith(ePaymentPassword: action.auth.ePaymentPassword);

/// Update moodleKey when updating assignments.
AuthState _updateMoodleKeyReducer(
        AuthState oldState, UpdateAssignmentsAction action) =>
    oldState.copyWith(moodleKey: action.moodleKey);
