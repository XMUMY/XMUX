// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectiveCourse _$ElectiveCourseFromJson(Map<String, dynamic> json) {
  return ElectiveCourse(
      json['Classification'] as String,
      json['Credits(max)'] == null
          ? null
          : int.parse(json['Credits(max)'] as String),
      json['Round'] as String,
      json['Deadline'] == null
          ? null
          : ElectiveCourse._periodFromJson(json['Deadline'] as String),
      json['Entry'] as String);
}

abstract class _$ElectiveCourseSerializerMixin {
  String get classification;
  int get maxCredit;
  String get round;
  PeriodOfDate get period;
  String get entry;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Classification': classification,
        'Credits(max)': maxCredit,
        'Round': round,
        'Deadline': period,
        'Entry': entry
      };
}

ElectiveCourseFormData _$ElectiveCourseFormDataFromJson(
    Map<String, dynamic> json) {
  return ElectiveCourseFormData(
      json['formGeneralInfo'] == null
          ? null
          : FormGeneralInfo.fromJson(
              json['formGeneralInfo'] as Map<String, dynamic>),
      (json['coursesSelected'] as List)
          ?.map((e) => e == null
              ? null
              : CourseSelected.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['coursesList'] as List)
          ?.map((e) => e == null
              ? null
              : CourseUnselected.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$ElectiveCourseFormDataSerializerMixin {
  FormGeneralInfo get formGeneralInfo;
  List<CourseSelected> get coursesSelected;
  List<CourseUnselected> get coursesList;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'formGeneralInfo': formGeneralInfo,
        'coursesSelected': coursesSelected,
        'coursesList': coursesList
      };
}

FormGeneralInfo _$FormGeneralInfoFromJson(Map<String, dynamic> json) {
  return FormGeneralInfo(
      json['Round'] as String,
      json['Stage'] as String,
      json['Credits (max)'] == null
          ? null
          : int.parse(json['Credits (max)'] as String),
      json['Credits Chosen'] == null
          ? null
          : int.parse(json['Credits Chosen'] as String));
}

abstract class _$FormGeneralInfoSerializerMixin {
  String get round;
  String get stage;
  int get maxCredit;
  int get chosenCredit;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Round': round,
        'Stage': stage,
        'Credits (max)': maxCredit,
        'Credits Chosen': chosenCredit
      };
}

CourseSelected _$CourseSelectedFromJson(Map<String, dynamic> json) {
  return CourseSelected(
      json['Waiting List'] as String,
      json['Credit'] == null ? null : int.parse(json['Credit'] as String),
      json['Teaching Week'] as String,
      json['Lecturer'] as String,
      json['Time & Venue'] as String,
      json['Quota'] == null ? null : int.parse(json['Quota'] as String),
      json['Applicant No.'] == null
          ? null
          : int.parse(json['Applicant No.'] as String),
      json['Cancel'] as String);
}

abstract class _$CourseSelectedSerializerMixin {
  String get name;
  int get credit;
  String get week;
  String get lecturer;
  String get timeAndVenue;
  int get quota;
  int get numChosen;
  String get cancel;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Waiting List': name,
        'Credit': credit,
        'Teaching Week': week,
        'Lecturer': lecturer,
        'Time & Venue': timeAndVenue,
        'Quota': quota,
        'Applicant No.': numChosen,
        'Cancel': cancel
      };
}

CourseUnselected _$CourseUnselectedFromJson(Map<String, dynamic> json) {
  return CourseUnselected(
      json['Course Information (by group)'] as String,
      json['Credit'] == null ? null : int.parse(json['Credit'] as String),
      json['Teaching Week'] as String,
      json['Lecturer'] as String,
      json['Time & Venue'] as String,
      json['Quota'] == null ? null : int.parse(json['Quota'] as String),
      json['Applicant No.'] == null
          ? null
          : int.parse(json['Applicant No.'] as String));
}

abstract class _$CourseUnselectedSerializerMixin {
  String get name;
  int get credit;
  String get week;
  String get lecturer;
  String get timeAndVenue;
  int get quota;
  int get numChosen;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Course Information (by group)': name,
        'Credit': credit,
        'Teaching Week': week,
        'Lecturer': lecturer,
        'Time & Venue': timeAndVenue,
        'Quota': quota,
        'Applicant No.': numChosen
      };
}
