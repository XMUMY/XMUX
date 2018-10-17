import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../state.dart';

part 'ac_reducers.dart';
part 'pi_reducers.dart';
part 'setting_reducers.dart';
part 'ui_reducers.dart';

MainAppState appReducer(MainAppState oldState, dynamic action) {
  if (action is LogoutAction)
    return new MainAppState.def();
  else if (action is InitAction)
    return new MainAppState.fromMap(action.initMap);
  else
    return new MainAppState(
        uiReducers(oldState.uiState, action),
        personalInfoReducers(oldState.personalInfoState, action),
        settingReducers(oldState.settingState, action),
        oacReducers(oldState.oacState, action),
        acReducers(oldState.acState, action));
}
