import 'package:emgs/model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moodle/model/assignment.dart';
import 'package:xmus_client/generated/aaos.pb.dart';

part 'query.g.dart';

@JsonSerializable()
class QueryState {
  /// Assignments from moodle.
  final List<AssignmentCourse> assignments;

  /// Application status for VISA.
  final EmgsApplicationResult emgsApplicationResult;

  /// Timetable for current semester.
  final Timetable timetable;

  /// Courses for current semester.
  final Courses courses;

  /// Exams for current semester.
  final Exams exams;

  /// Transcript of student.
  final Transcript transcript;

  QueryState({
    List<AssignmentCourse> assignments,
    this.emgsApplicationResult,
    Timetable timetable,
    Courses courses,
    Exams exams,
    Transcript transcript,
  })  : assignments = assignments ?? List.unmodifiable([]),
        timetable = timetable ?? Timetable(),
        courses = courses ?? Courses(),
        exams = exams ?? Exams(),
        transcript = transcript ?? Transcript();

  factory QueryState.fromJson(Map<String, dynamic> json) =>
      _$QueryStateFromJson(json);

  Map<String, dynamic> toJson() => _$QueryStateToJson(this);

  QueryState copyWith({
    List<AssignmentCourse> assignments,
    EmgsApplicationResult emgsApplicationResult,
    Timetable timetable,
    Courses courses,
    Exams exams,
    Transcript transcript,
  }) =>
      QueryState(
        assignments: assignments ?? this.assignments,
        emgsApplicationResult:
            emgsApplicationResult ?? this.emgsApplicationResult,
        timetable: timetable ?? this.timetable,
        courses: courses ?? this.courses,
        exams: exams ?? this.exams,
        transcript: transcript ?? this.transcript,
      );
}
