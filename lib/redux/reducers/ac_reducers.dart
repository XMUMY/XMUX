part of 'reducer.dart';

final Reducer<AcState> acReducers = combineReducers([
  TypedReducer<AcState, UpdateAcAction>(_acReducer),
  TypedReducer<AcState, UpdateInfoAction>(_acInfoReducer),
]);

AcState _acReducer(AcState oldState, UpdateAcAction action) =>
    oldState.copyWith(
        status: action.status,
        timestamp: action.timestamp,
        timetable: action.acData.timetable,
        exams: action.acData.exams);

AcState _acInfoReducer(AcState oldState, UpdateInfoAction action) =>
    oldState.copyWith(info: action.info);
