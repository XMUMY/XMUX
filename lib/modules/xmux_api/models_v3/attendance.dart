part of 'models.dart';

enum StudentAttendanceStatus { none, waiting, attended, failed }

@JsonSerializable()
class StudentAttendanceBrief {
  final String cid;
  final String name;
  @JsonKey(name: 'timestampS')
  final DateTime timestamp;
  final int total;
  final int attended;

  StudentAttendanceBrief(
      this.cid, this.name, this.timestamp, this.total, this.attended);

  static StudentAttendanceBrief fromJson(Map<String, dynamic> json) =>
      _$StudentAttendanceBriefFromJson(json);
}

@JsonSerializable()
class StudentAttendanceDetail {
  final String cid;
  final String name;
  @JsonKey(name: 'timestampS')
  final DateTime timestamp;
  final int total;
  final int attended;
  final List<StudentAttendance> students;

  StudentAttendanceDetail(this.cid, this.name, this.timestamp, this.total,
      this.attended, this.students);

  static StudentAttendanceDetail fromJson(Map<String, dynamic> json) =>
      _$StudentAttendanceDetailFromJson(json);
}

extension StudentAttendanceListWithCount on List<StudentAttendance> {
  /// Get selected student count.
  int get selectedCount =>
      this.fold<int>(0, (sum, s) => s.selected ? sum + 1 : sum);
}

@JsonSerializable()
class StudentAttendance extends _StudentAttendance with _$StudentAttendance {
  StudentAttendance(String uid, String name, StudentAttendanceStatus status)
      : super(uid, name, status);

  factory StudentAttendance.fromJson(Map<String, dynamic> json) =>
      _$StudentAttendanceFromJson(json);
}

abstract class _StudentAttendance with Store {
  final String uid;
  final String name;
  final StudentAttendanceStatus status;

  @JsonKey(ignore: true)
  @observable
  bool selected = false;

  _StudentAttendance(this.uid, this.name, this.status);
}
