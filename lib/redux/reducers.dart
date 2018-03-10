import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/state.dart';

MainAppState mainAppReducer(MainAppState oldState, dynamic action) {
  if (!(action is MainAppAction))
    return oldState;
  else if (action is InitAction)
    return new MainAppState.fromJson(action.initMap);
  else
    return new MainAppState.raw(
        (action is OpenDrawerAction)
            ? action.drawerStatus
            : oldState.drawerIsOpen,
        _personalInfoReducer(oldState.personalInfoState, action),
        _settingReducer(oldState.settingState, action),
        _homePageReducer(oldState.homePageState, action),
        _acReducer(oldState.acState, action),
        _moodleReducer(oldState.moodleState, action));
}

PersonalInfoState _personalInfoReducer(
    PersonalInfoState oldState, dynamic action) {
  return oldState;
}

SettingState _settingReducer(SettingState oldState, dynamic action) {
  return oldState;
}

HomePageState _homePageReducer(HomePageState oldState, dynamic action) {
  return oldState;
}

ACState _acReducer(ACState oldState, dynamic action) {
  return oldState;
}

MoodleState _moodleReducer(MoodleState oldState, dynamic action) {
  return oldState;
}
