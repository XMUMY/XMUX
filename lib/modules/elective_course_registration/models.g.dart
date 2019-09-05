// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectiveCourse _$ElectiveCourseFromJson(Map<String, dynamic> json) {
  return ElectiveCourse(
    json['Classification'] as String,
    int.parse(json['Credits(max)'] as String),
    json['Round'] as String,
    ElectiveCourse._periodFromJson(json['Deadline'] as String),
    json['Entry'] as String,
  );
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
        ?.toList(),
  );
}

FormGeneralInfo _$FormGeneralInfoFromJson(Map<String, dynamic> json) {
  return FormGeneralInfo(
    json['Round'] as String,
    json['Stage'] as String,
    int.parse(json['Credits (max)'] as String),
    int.parse(json['Credits Chosen'] as String),
  );
}

CourseSelected _$CourseSelectedFromJson(Map<String, dynamic> json) {
  return CourseSelected(
    json['Waiting List'] as String,
    int.parse(json['Credit'] as String),
    json['Teaching Week'] as String,
    json['Lecturer'] as String,
    json['Time & Venue'] as String,
    int.parse(json['Quota'] as String),
    int.parse(json['Applicant No.'] as String),
    json['Cancel'] as String,
  );
}

CourseUnselected _$CourseUnselectedFromJson(Map<String, dynamic> json) {
  return CourseUnselected(
    json['Course Information (by group)'] as String,
    int.parse(json['Credit'] as String),
    json['Teaching Week'] as String,
    json['Lecturer'] as String,
    json['Time & Venue'] as String,
    int.parse(json['Quota'] as String),
    int.parse(json['Applicant No.'] as String),
    json['Option'] as String,
  );
}
