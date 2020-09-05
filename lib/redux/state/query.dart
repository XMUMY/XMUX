import 'package:json_annotation/json_annotation.dart';
import 'package:xmux/modules/emgs/model.dart';
import 'package:xmux/modules/moodle/models/assignment.dart';
import 'package:xmux/modules/rpc/clients/aaos.pb.dart';
import 'package:xmux/modules/xmux_api/models/models_v2.dart';

part 'query.g.dart';

@JsonSerializable()
class QueryState {
  /// Assignments from moodle.
  final List<AssignmentCourse> assignments;

  /// Courses for current semester.
  final Courses courses;

  /// Billing records from E-Payment.
  final List<BillingRecord> ePaymentRecords;

  /// Application status for VISA.
  final EmgsApplicationResult emgsApplicationResult;

  /// Timetable for current semester.
  final Timetable timetable;

  /// Transcript of student.
  final Transcript transcript;

  QueryState(
    this.assignments,
    this.courses,
    this.ePaymentRecords,
    this.emgsApplicationResult,
    this.timetable,
    this.transcript,
  );

  QueryState.def()
      : assignments = null,
        courses = null,
        ePaymentRecords = null,
        emgsApplicationResult = null,
        timetable = null,
        transcript = null;

  factory QueryState.fromJson(Map<String, dynamic> json) =>
      _$QueryStateFromJson(json);

  Map<String, dynamic> toJson() => _$QueryStateToJson(this);

  QueryState copyWith({
    List<AssignmentCourse> assignments,
    Courses courses,
    List<BillingRecord> ePaymentRecords,
    EmgsApplicationResult emgsApplicationResult,
    Timetable timetable,
    Transcript transcript,
  }) =>
      QueryState(
        assignments ?? this.assignments,
        courses ?? this.courses,
        ePaymentRecords ?? this.ePaymentRecords,
        emgsApplicationResult ?? this.emgsApplicationResult,
        timetable ?? this.timetable,
        transcript ?? this.transcript,
      );
}
