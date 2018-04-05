import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/reducers/ac_reducers.dart';
import 'package:xmux/redux/reducers/pi_reducers.dart';
import 'package:xmux/redux/reducers/setting_reducers.dart';
import 'package:xmux/redux/reducers/ui_reducers.dart';
import 'package:xmux/redux/state.dart';

MainAppState mainAppReducer(MainAppState oldState, dynamic action) {
  if (action == "delete")
    return new MainAppState();
  else if (action is InitAction)
    return new MainAppState.fromMap(action.initMap);
  else
    return new MainAppState.raw(
        uiReducers(oldState.uiState, action),
        personalInfoReducers(oldState.personalInfoState, action),
        settingReducers(oldState.settingState, action),
        acReducers(oldState.acState, action));
}
