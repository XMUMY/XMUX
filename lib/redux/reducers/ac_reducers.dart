part of 'reducer.dart';

final Reducer<ACState> oacReducers = combineReducers([
  new TypedReducer<ACState, UpdateACAction>(_oacReducer),
  new TypedReducer<ACState, UpdateAssignmentsAction>(_updateAssignmentsReducer),
]);

final Reducer<AcState> acReducers = combineReducers([
  new TypedReducer<AcState, UpdateAcAction>(_acReducer),
]);

ACState _oacReducer(ACState oldState, UpdateACAction action) {
  List oldAssignments = oldState.assignments;
  return new ACState.fromMap(action.acMap)
      .copyWith(assignments: oldAssignments);
}

AcState _acReducer(AcState oldState, UpdateAcAction action) =>
    oldState.copyWith(
        status: action.status,
        timestamp: action.timestamp,
        timetable: action.acData.timetable,
        exams: action.acData.exams,
        examResult: action.acData.examResult);

ACState _updateAssignmentsReducer(
        ACState oldState, UpdateAssignmentsAction action) =>
    oldState.copyWith(assignments: action.assignments);
