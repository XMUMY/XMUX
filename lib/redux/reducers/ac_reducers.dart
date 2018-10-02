import 'package:redux/redux.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/states/state.dart';

final Reducer<ACState> acReducers = combineReducers([
  new TypedReducer<ACState, UpdateACAction>(_acReducer),
  new TypedReducer<ACState, UpdateAssignmentsAction>(_updateAssignmentsReducer),
]);

ACState _acReducer(ACState oldState, UpdateACAction action) {
  List oldAssignments = oldState.assignments;
  return new ACState.fromMap(action.acMap)
      .copyWith(assignments: oldAssignments);
}

ACState _updateAssignmentsReducer(
        ACState oldState, UpdateAssignmentsAction action) =>
    oldState.copyWith(assignments: action.assignments);
