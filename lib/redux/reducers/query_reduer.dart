part of 'reducer.dart';

final Reducer<QueryState> queryReducers = combineReducers([
  TypedReducer<QueryState, UpdateEPaymentRecordsAction>(_updateBillReducer),
  TypedReducer<QueryState, UpdateEmgsApplicationResultAction>(
      _updateEmgsReducer),
]);

QueryState _updateBillReducer(
        QueryState oldState, UpdateEPaymentRecordsAction action) =>
    oldState.copyWith(ePaymentRecords: action.ePaymentRecords);

QueryState _updateEmgsReducer(
        QueryState oldState, UpdateEmgsApplicationResultAction action) =>
    oldState.copyWith(emgsApplicationResult: action.result);
