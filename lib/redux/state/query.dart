part of 'state.dart';

@JsonSerializable()
class QueryState {
  /// Billing records from E-Payment.
  final List<BillingRecord> ePaymentRecords;

  /// Application status for VISA.
  final EmgsApplicationResult emgsApplicationResult;

  /// Timetable for current semester.
  final GetTimetableResp timetable;

  QueryState(this.ePaymentRecords, this.emgsApplicationResult, this.timetable);

  QueryState.def()
      : this.ePaymentRecords = null,
        this.emgsApplicationResult = null,
        this.timetable = null;

  factory QueryState.fromJson(Map<String, dynamic> json) =>
      _$QueryStateFromJson(json);

  Map<String, dynamic> toJson() => _$QueryStateToJson(this);

  QueryState copyWith(
          {List<BillingRecord> ePaymentRecords,
          EmgsApplicationResult emgsApplicationResult,
          GetTimetableResp timetable}) =>
      QueryState(
          ePaymentRecords ?? this.ePaymentRecords,
          emgsApplicationResult ?? this.emgsApplicationResult,
          timetable ?? this.timetable);
}
