import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/state.dart';

MainAppState mainAppReducer(MainAppState oldState, dynamic action) {
  if (!(action is MainAppAction))
    return oldState;
  else if (action is InitAction)
    return new MainAppState.fromJson(action.initMap);
  else if (action == "delete")
    return new MainAppState();
  else
    return new MainAppState.raw(
        (action is OpenDrawerAction)
            ? action.drawerStatus
            : oldState.drawerIsOpen,
        _personalInfoReducer(oldState.personalInfoState, action),
        _settingReducer(oldState.settingState, action),
        _acReducer(oldState.acState, action));
}

PersonalInfoState _personalInfoReducer(
    PersonalInfoState oldState, dynamic action) {
  return oldState;
}

SettingState _settingReducer(SettingState oldState, dynamic action) {
  if (action is UpdateSettingAction) {
    return oldState.copyWith(ePaymentPassword: action.ePaymentPassword);
  } else
    return oldState;
}

ACState _acReducer(ACState oldState, dynamic action) {
  if (action is UpdateACAction) {
    if (action.acInitMap != null) return new ACState.fromJson(action.acInitMap);
    return oldState.copyWith(assignments: action.assignments);
  } else
    return oldState;
}
