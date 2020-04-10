import 'package:json_annotation/json_annotation.dart';
import 'package:xmux/modules/api/xmux_api.dart';
import 'package:xmux/modules/emgs/model.dart';
import 'package:xmux/modules/moodle/models/assignment.dart';
import 'package:xmux/modules/xmux_api/models/models_v2.dart' hide Course;

part 'query.g.dart';

@JsonSerializable()
class QueryState {
  /// Billing records from E-Payment.
  final List<BillingRecord> ePaymentRecords;

  /// Application status for VISA.
  final EmgsApplicationResult emgsApplicationResult;

  /// Timetable for current semester.
  final GetTimetableResp timetable;

  /// Assignments from moodle.
  final List<Course> assignments;

  QueryState(
    this.ePaymentRecords,
    this.emgsApplicationResult,
    this.timetable,
    this.assignments,
  );

  QueryState.def()
      : ePaymentRecords = null,
        emgsApplicationResult = null,
        timetable = null,
        assignments = null;

  factory QueryState.fromJson(Map<String, dynamic> json) =>
      _$QueryStateFromJson(json);

  Map<String, dynamic> toJson() => _$QueryStateToJson(this);

  QueryState copyWith({
    List<BillingRecord> ePaymentRecords,
    EmgsApplicationResult emgsApplicationResult,
    GetTimetableResp timetable,
    List<Course> assignments,
  }) =>
      QueryState(
        ePaymentRecords ?? this.ePaymentRecords,
        emgsApplicationResult ?? this.emgsApplicationResult,
        timetable ?? this.timetable,
        assignments ?? this.assignments,
      );
}
