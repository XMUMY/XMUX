import 'package:redux/redux.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/states/state.dart';

final Reducer<SettingState> settingReducers = combineReducers([
  new TypedReducer<SettingState, UpdateEPaymentPasswordAction>(
      _updateEPaymentPasswordReducer),
  new TypedReducer<SettingState, EnableFunctionsUnderDevAction>(
      _enableFunctionsUnderDevReducer),
]);

SettingState _updateEPaymentPasswordReducer(
        SettingState state, UpdateEPaymentPasswordAction action) =>
    state.copyWith(ePaymentPassword: action.ePaymentPassword);

SettingState _enableFunctionsUnderDevReducer(
        SettingState state, EnableFunctionsUnderDevAction action) =>
    state.copyWith(enableFunctionsUnderDev: action.enableFunctionsUnderDev);
