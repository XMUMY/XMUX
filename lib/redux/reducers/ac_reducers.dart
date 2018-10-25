part of 'reducer.dart';

final Reducer<AcState> acReducers = combineReducers([
  new TypedReducer<AcState, UpdateAcAction>(_acReducer),
]);

AcState _acReducer(AcState oldState, UpdateAcAction action) =>
    oldState.copyWith(
        status: action.status,
        timestamp: action.timestamp,
        timetable: action.acData.timetable,
        exams: action.acData.exams,
        examResult: action.acData.examResult);
