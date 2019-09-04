import 'package:json_annotation/json_annotation.dart';
import 'package:xmux/modules/common/period_of_date.dart';

part 'models.g.dart';

@JsonSerializable(createToJson: false)
class ElectiveCourse {
  @JsonKey(name: 'Classification')
  final String classification;
  @JsonKey(name: 'Credits(max)', fromJson: int.parse)
  final int maxCredit;
  @JsonKey(name: 'Round')
  final String round;
  @JsonKey(name: 'Deadline', fromJson: _periodFromJson)
  final PeriodOfDate period;
  @JsonKey(name: 'Entry')
  final String entry;

  ElectiveCourse(
      this.classification, this.maxCredit, this.round, this.period, this.entry);

  static ElectiveCourse fromJson(Map<String, dynamic> json) =>
      _$ElectiveCourseFromJson(json);

  static PeriodOfDate _periodFromJson(String deadline) => PeriodOfDate(
      start: DateTime.parse(deadline.substring(0, 16)),
      end: DateTime.parse(deadline.substring(16)));
}

@JsonSerializable(createToJson: false)
class ElectiveCourseFormData {
  final FormGeneralInfo formGeneralInfo;
  final List<CourseSelected> coursesSelected;
  final List<CourseUnselected> coursesList;

  ElectiveCourseFormData(
      this.formGeneralInfo, this.coursesSelected, this.coursesList);

  static ElectiveCourseFormData fromJson(Map<String, dynamic> json) =>
      _$ElectiveCourseFormDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class FormGeneralInfo {
  @JsonKey(name: 'Round')
  final String round;
  @JsonKey(name: 'Stage')
  final String stage;
  @JsonKey(name: 'Credits (max)', fromJson: int.parse)
  final int maxCredit;
  @JsonKey(name: 'Credits Chosen', fromJson: int.parse)
  final int chosenCredit;

  FormGeneralInfo(this.round, this.stage, this.maxCredit, this.chosenCredit);

  static FormGeneralInfo fromJson(Map<String, dynamic> json) =>
      _$FormGeneralInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class CourseSelected {
  @JsonKey(name: 'Waiting List')
  final String name;
  @JsonKey(name: 'Credit', fromJson: int.parse)
  final int credit;
  @JsonKey(name: 'Teaching Week')
  final String week;
  @JsonKey(name: 'Lecturer')
  final String lecturer;
  @JsonKey(name: 'Time & Venue')
  final String timeAndVenue;
  @JsonKey(name: 'Quota', fromJson: int.parse)
  final int quota;
  @JsonKey(name: 'Applicant No.', fromJson: int.parse)
  final int numChosen;
  @JsonKey(name: 'Cancel')
  final String cancel;

  CourseSelected(this.name, this.credit, this.week, this.lecturer,
      this.timeAndVenue, this.quota, this.numChosen, this.cancel);

  static CourseSelected fromJson(Map<String, dynamic> json) =>
      _$CourseSelectedFromJson(json);
}

@JsonSerializable(createToJson: false)
class CourseUnselected {
  @JsonKey(name: 'Course Information (by group)')
  final String name;
  @JsonKey(name: 'Credit', fromJson: int.parse)
  final int credit;
  @JsonKey(name: 'Teaching Week')
  final String week;
  @JsonKey(name: 'Lecturer')
  final String lecturer;
  @JsonKey(name: 'Time & Venue')
  final String timeAndVenue;
  @JsonKey(name: 'Quota', fromJson: int.parse)
  final int quota;
  @JsonKey(name: 'Applicant No.', fromJson: int.parse)
  final int numChosen;
  @JsonKey(name: 'Option')
  final String option;

  CourseUnselected(this.name, this.credit, this.week, this.lecturer,
      this.timeAndVenue, this.quota, this.numChosen, this.option);

  static CourseUnselected fromJson(Map<String, dynamic> json) =>
      _$CourseUnselectedFromJson(json);

  /// If course can be registered.
  bool get canSelect => option != 'Full';

  /// If course is Full.
  bool get canListen => option == 'Full';
}
