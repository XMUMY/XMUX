import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../state.dart';

part 'ac_reducers.dart';
part 'auth_reducers.dart';
part 'setting_reducers.dart';
part 'ui_reducers.dart';

MainAppState appReducer(MainAppState oldState, dynamic action) {
  if (action is LogoutAction)
    return new MainAppState.def();
  else if (action is InitAction)
    return new MainAppState.fromJson(action.initMap);
  else
    return new MainAppState(
        authReducers(oldState.authState, action),
        settingReducers(oldState.settingState, action),
        acReducers(oldState.acState, action),
        uiState: uiReducers(oldState.uiState, action));
}
