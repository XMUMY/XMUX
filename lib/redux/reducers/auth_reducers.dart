part of 'reducer.dart';

final Reducer<AuthState> authReducers = combineReducers([
  new TypedReducer<AuthState, LoginAction>(_loginReducer),
  new TypedReducer<AuthState, UpdateEPaymentPasswordAction>(
      _updateEPaymentPasswordReducer),
]);

AuthState _loginReducer(AuthState oldState, LoginAction action) =>
    oldState.copyWith(
        campusID: action.auth.campusID,
        campusIDPassword: action.auth.campusIDPassword,
        moodleKey: action.moodleKey);

AuthState _updateEPaymentPasswordReducer(
        AuthState oldState, UpdateEPaymentPasswordAction action) =>
    oldState.copyWith(ePaymentPassword: action.ePaymentPassword);
