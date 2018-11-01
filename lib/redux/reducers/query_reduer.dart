part of 'reducer.dart';

final Reducer<QueryState> queryReducers = combineReducers([
  TypedReducer<QueryState, UpdateEPaymentRecordsAction>(_updateBillReducer),
]);

QueryState _updateBillReducer(
        QueryState oldState, UpdateEPaymentRecordsAction action) =>
    oldState.copyWith(ePaymentRecords: action.ePaymentRecords);
