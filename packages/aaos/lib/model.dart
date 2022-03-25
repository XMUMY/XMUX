import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

class PeriodOfDate {
  final DateTime start;
  final DateTime end;

  PeriodOfDate({required this.start, required this.end});

  factory PeriodOfDate.fromJson(String deadline) => PeriodOfDate(
        start: DateTime.parse(deadline.substring(0, 16)),
        end: DateTime.parse(deadline.substring(16)),
      );
}

@JsonSerializable(createToJson: false)
class ElectiveSession {
  @JsonKey(name: 'Classification')
  final String classification;
  @JsonKey(name: 'Credits(max)', fromJson: int.parse)
  final int maxCredit;
  @JsonKey(name: 'CourseRegistered')
  final String registered;
  @JsonKey(name: 'Round')
  final String round;
  @JsonKey(name: 'Deadline')
  final PeriodOfDate period;
  @JsonKey(name: 'Entry')
  final String entry;

  ElectiveSession({
    required this.classification,
    required this.maxCredit,
    required this.registered,
    required this.round,
    required this.period,
    required this.entry,
  });

  static ElectiveSession fromJson(Map<String, dynamic> json) =>
      _$ElectiveSessionFromJson(json);
}

@JsonSerializable(createToJson: false)
class CourseRegistered {
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

  CourseRegistered({
    required this.name,
    required this.credit,
    required this.week,
    required this.lecturer,
    required this.timeAndVenue,
  });

  static CourseRegistered fromJson(Map<String, dynamic> json) =>
      _$CourseRegisteredFromJson(json);
}

@JsonSerializable(createToJson: false)
class ElectiveSessionFormData {
  final FormGeneralInfo formGeneralInfo;
  final List<CourseSelected> coursesSelected;
  final List<CourseUnselected> coursesList;

  ElectiveSessionFormData({
    required this.formGeneralInfo,
    required this.coursesSelected,
    required this.coursesList,
  });

  static ElectiveSessionFormData fromJson(Map<String, dynamic> json) =>
      _$ElectiveSessionFormDataFromJson(json);
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

  FormGeneralInfo({
    required this.round,
    required this.stage,
    required this.maxCredit,
    required this.chosenCredit,
  });

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

  CourseSelected({
    required this.name,
    required this.credit,
    required this.week,
    required this.lecturer,
    required this.timeAndVenue,
    required this.quota,
    required this.numChosen,
    required this.cancel,
  });

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

  CourseUnselected({
    required this.name,
    required this.credit,
    required this.week,
    required this.lecturer,
    required this.timeAndVenue,
    required this.quota,
    required this.numChosen,
    required this.option,
  });

  static CourseUnselected fromJson(Map<String, dynamic> json) =>
      _$CourseUnselectedFromJson(json);

  /// If course can be registered.
  bool get canSelect => option != 'Full';

  /// If course is Full.
  bool get canListen => option == 'Full';
}
