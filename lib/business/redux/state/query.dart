part of 'state.dart';

@JsonSerializable()
class QueryState {
  /// Timetable for current semester.
  final Timetable timetable;

  /// Courses for current semester.
  final Courses courses;

  /// Exams for current semester.
  final Exams exams;

  /// Transcript of student.
  final Transcript transcript;

  final List<AssignmentCourse> assignments;

  final EmgsApplicationResult? emgsApplicationResult;

  QueryState({
    Timetable? timetable,
    Courses? courses,
    Exams? exams,
    Transcript? transcript,
    this.assignments = const [],
    this.emgsApplicationResult,
  })  : timetable = timetable ?? Timetable(),
        courses = courses ?? Courses(),
        exams = exams ?? Exams(),
        transcript = transcript ?? Transcript();

  factory QueryState.fromJson(Map<String, dynamic> json) =>
      _$QueryStateFromJson(json);

  Map<String, dynamic> toJson() => _$QueryStateToJson(this);

  QueryState copyWith({
    Timetable? timetable,
    Courses? courses,
    Exams? exams,
    Transcript? transcript,
    List<AssignmentCourse>? assignments,
    EmgsApplicationResult? emgsApplicationResult,
  }) =>
      QueryState(
        timetable: timetable ?? this.timetable,
        courses: courses ?? this.courses,
        exams: exams ?? this.exams,
        transcript: transcript ?? this.transcript,
        assignments: assignments ?? this.assignments,
        emgsApplicationResult:
            emgsApplicationResult ?? this.emgsApplicationResult,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QueryState &&
          timetable == other.timetable &&
          courses == other.courses &&
          exams == other.exams &&
          transcript == other.transcript &&
          assignments == other.assignments &&
          emgsApplicationResult == other.emgsApplicationResult;

  @override
  int get hashCode =>
      timetable.hashCode ^
      courses.hashCode ^
      exams.hashCode ^
      transcript.hashCode ^
      assignments.hashCode ^
      emgsApplicationResult.hashCode;
}
