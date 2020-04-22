import 'package:json_annotation/json_annotation.dart';
import 'package:xmux/modules/api/xmux_api.dart';
import 'package:xmux/modules/emgs/model.dart';
import 'package:xmux/modules/moodle/models/assignment.dart';
import 'package:xmux/modules/xmux_api/models/models_v2.dart' hide Course;

part 'query.g.dart';

@JsonSerializable()
class QueryState {
  /// Assignments from moodle.
  final List<Course> assignments;

  /// Billing records from E-Payment.
  final List<BillingRecord> ePaymentRecords;

  /// Application status for VISA.
  final EmgsApplicationResult emgsApplicationResult;

  /// Timetable for current semester.
  final GetTimetableResp timetable;

  /// Transcript of student.
  final List<TranscriptSession> transcript;

  QueryState(
    this.assignments,
    this.ePaymentRecords,
    this.emgsApplicationResult,
    this.timetable,
    this.transcript,
  );

  QueryState.def()
      : ePaymentRecords = null,
        emgsApplicationResult = null,
        timetable = null,
        assignments = null,
        transcript = null;

  factory QueryState.fromJson(Map<String, dynamic> json) =>
      _$QueryStateFromJson(json);

  Map<String, dynamic> toJson() => _$QueryStateToJson(this);

  QueryState copyWith({
    List<Course> assignments,
    List<BillingRecord> ePaymentRecords,
    EmgsApplicationResult emgsApplicationResult,
    GetTimetableResp timetable,
    List<TranscriptSession> transcript,
  }) =>
      QueryState(
        assignments ?? this.assignments,
        ePaymentRecords ?? this.ePaymentRecords,
        emgsApplicationResult ?? this.emgsApplicationResult,
        timetable ?? this.timetable,
        transcript ?? this.transcript,
      );
}
