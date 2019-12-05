import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../state/state.dart';

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
      userReducers(oldState.user, action),
      queryReducers(oldState.queryState, action),
      settingReducers(oldState.settingState, action),
      uiState: uiReducers(oldState.uiState, action),
    );
}

/// Reducers for user.
final Reducer<User> userReducers = combineReducers([
  TypedReducer<User, LoginAction>(_loginReducer),
  TypedReducer<User, UpdateEPaymentRecordsAction>(
      _updateEPaymentPasswordReducer),
  TypedReducer<User, UpdateAssignmentsAction>(_updateMoodleKeyReducer),
]);

User _loginReducer(User oldState, LoginAction action) => oldState.copyWith(
      campusID: action.campusId,
      campusIDPassword: action.password,
    );

/// Update ePayment password when first login.
User _updateEPaymentPasswordReducer(
        User oldState, UpdateEPaymentRecordsAction action) =>
    action.auth == null
        ? oldState
        : oldState.copyWith(ePaymentPassword: action.auth.ePaymentPassword);

/// Update moodleKey when updating assignments.
User _updateMoodleKeyReducer(User oldState, UpdateAssignmentsAction action) =>
    oldState.copyWith(moodleKey: action.moodleKey);
