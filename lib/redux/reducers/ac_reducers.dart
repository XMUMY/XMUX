import 'package:redux/redux.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/state.dart';

final Reducer<ACState> acReducers =
    combineReducers([new TypedReducer<ACState, UpdateACAction>(_acReducer)]);

ACState _acReducer(ACState oldState, dynamic action) {
  if (action is UpdateACAction) {
    if (action.acInitMap != null) return new ACState.fromMap(action.acInitMap);
    return oldState.copyWith(assignments: action.assignments);
  } else
    return oldState;
}
