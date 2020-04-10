part of 'reducer.dart';

final Reducer<QueryState> queryReducers = combineReducers([
  TypedReducer(_updateBillReducer),
  TypedReducer(_updateEmgsReducer),
  TypedReducer(_updateTimetableReducer),
  TypedReducer(_updateAssignmentsReducer),
]);

QueryState _updateBillReducer(
        QueryState oldState, UpdateEPaymentRecordsAction action) =>
    oldState.copyWith(ePaymentRecords: action.ePaymentRecords);

QueryState _updateEmgsReducer(
        QueryState oldState, UpdateEmgsApplicationResultAction action) =>
    oldState.copyWith(emgsApplicationResult: action.result);

QueryState _updateTimetableReducer(
        QueryState oldState, UpdateTimetableAction action) =>
    oldState.copyWith(timetable: action.response.data);

QueryState _updateAssignmentsReducer(
        QueryState oldState, UpdateAssignmentsAction action) =>
    oldState.copyWith(assignments: action.response);
