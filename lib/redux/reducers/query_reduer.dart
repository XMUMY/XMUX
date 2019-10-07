part of 'reducer.dart';

final Reducer<QueryState> queryReducers = combineReducers([
  TypedReducer<QueryState, UpdateEPaymentRecordsAction>(_updateBillReducer),
  TypedReducer<QueryState, UpdateEmgsApplicationResultAction>(
      _updateEmgsReducer),
  TypedReducer<QueryState, UpdateTimetableAction>(_updateTimetableReducer),
]);

QueryState _updateBillReducer(
        QueryState oldState, UpdateEPaymentRecordsAction action) =>
    oldState.copyWith(ePaymentRecords: action.ePaymentRecords);

QueryState _updateEmgsReducer(
        QueryState oldState, UpdateEmgsApplicationResultAction action) =>
    oldState.copyWith(emgsApplicationResult: action.result);

QueryState _updateTimetableReducer(
        QueryState oldState, UpdateTimetableAction action) =>
    oldState.copyWith(timetable: action.timetable);
