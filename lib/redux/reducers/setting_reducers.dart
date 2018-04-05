import 'package:redux/redux.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/state.dart';

final Reducer<SettingState> settingReducers = combineReducers([
  new TypedReducer<SettingState, UpdateEPaymentPasswordAction>(
      _updateEPaymentPasswordReducer)
]);

SettingState _updateEPaymentPasswordReducer(
        SettingState state, UpdateEPaymentPasswordAction action) =>
    state.copyWith(ePaymentPassword: action.ePaymentPassword);
