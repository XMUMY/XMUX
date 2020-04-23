part of 'reducer.dart';

final Reducer<AcState> acReducers = combineReducers([
  TypedReducer<AcState, UpdateAcAction>(_acReducer),
]);

AcState _acReducer(AcState oldState, UpdateAcAction action) =>
    oldState.copyWith(timestamp: action.timestamp, exams: action.acData.exams);
