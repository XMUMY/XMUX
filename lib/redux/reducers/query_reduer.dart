part of 'reducer.dart';

final Reducer<QueryState> queryReducers = combineReducers([
  TypedReducer(_updateAssignmentsReducer),
  TypedReducer(_updateCoursesReducer),
  TypedReducer(_updateBillReducer),
  TypedReducer(_updateEmgsReducer),
  TypedReducer(_updateTimetableReducer),
  TypedReducer(_updateTranscriptReducer),
]);

QueryState _updateAssignmentsReducer(
        QueryState oldState, UpdateAssignmentsAction action) =>
    oldState.copyWith(assignments: action.response);

QueryState _updateCoursesReducer(
        QueryState oldState, UpdateCoursesAction action) =>
    oldState.copyWith(courses: action.response.data);

QueryState _updateBillReducer(
        QueryState oldState, UpdateEPaymentRecordsAction action) =>
    oldState.copyWith(ePaymentRecords: action.ePaymentRecords);

QueryState _updateEmgsReducer(
        QueryState oldState, UpdateEmgsApplicationResultAction action) =>
    oldState.copyWith(emgsApplicationResult: action.result);

QueryState _updateTimetableReducer(
        QueryState oldState, UpdateTimetableAction action) =>
    oldState.copyWith(timetable: action.response.data);

QueryState _updateTranscriptReducer(
        QueryState oldState, UpdateTranscriptAction action) =>
    oldState.copyWith(transcript: action.response.data);
