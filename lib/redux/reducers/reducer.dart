import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../state/state.dart';

part 'query_reducers.dart';
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
      userReducers(oldState.user, action),
      queryReducers(oldState.queryState, action),
      settingReducers(oldState.settingState, action),
      uiState: uiReducers(oldState.uiState, action),
    );
}

/// Reducers for user.
final Reducer<User> userReducers = combineReducers([
  TypedReducer(_loginReducer),
  TypedReducer(_updateUserProfileReducer),
  TypedReducer(_updateEPaymentPasswordReducer),
]);

User _loginReducer(User oldState, LoginAction action) => oldState.copyWith(
      campusID: action.campusId,
      campusIDPassword: action.password,
    );

User _updateUserProfileReducer(User oldState, SyncUserProfileAction action) =>
    oldState.copyWith(profile: action.response);

User _updateEPaymentPasswordReducer(
        User oldState, UpdateEPaymentPasswordAction action) =>
    oldState.copyWith(ePaymentPassword: action.ePaymentPassword);
