part of 'reducer.dart';

final settingReducers = combineReducers<SettingState>([
  TypedReducer(_themeModeReducer),
  TypedReducer(_enableFunctionsUnderDevReducer),
]);

SettingState _themeModeReducer(SettingState state, ThemeModeAction action) =>
    state.copyWith(themeMode: action.themeMode);

SettingState _enableFunctionsUnderDevReducer(
        SettingState state, EnableFunctionsUnderDevAction action) =>
    state.copyWith(enableFunctionsUnderDev: action.enableFunctionsUnderDev);
