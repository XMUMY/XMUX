part of 'reducer.dart';

final Reducer<SettingState> settingReducers = combineReducers([
  new TypedReducer<SettingState, EnableFunctionsUnderDevAction>(
      _enableFunctionsUnderDevReducer),
]);

SettingState _enableFunctionsUnderDevReducer(
        SettingState state, EnableFunctionsUnderDevAction action) =>
    state.copyWith(enableFunctionsUnderDev: action.enableFunctionsUnderDev);
