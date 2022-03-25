// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectiveSession _$ElectiveSessionFromJson(Map<String, dynamic> json) =>
    ElectiveSession(
      classification: json['Classification'] as String,
      maxCredit: int.parse(json['Credits(max)'] as String),
      registered: json['CourseRegistered'] as String,
      round: json['Round'] as String,
      period: PeriodOfDate.fromJson(json['Deadline'] as String),
      entry: json['Entry'] as String,
    );

CourseRegistered _$CourseRegisteredFromJson(Map<String, dynamic> json) =>
    CourseRegistered(
      name: json['Course Information (by group)'] as String,
      credit: int.parse(json['Credit'] as String),
      week: json['Teaching Week'] as String,
      lecturer: json['Lecturer'] as String,
      timeAndVenue: json['Time & Venue'] as String,
    );

ElectiveSessionFormData _$ElectiveSessionFormDataFromJson(
        Map<String, dynamic> json) =>
    ElectiveSessionFormData(
      formGeneralInfo: FormGeneralInfo.fromJson(
          json['formGeneralInfo'] as Map<String, dynamic>),
      coursesSelected: (json['coursesSelected'] as List<dynamic>)
          .map((e) => CourseSelected.fromJson(e as Map<String, dynamic>))
          .toList(),
      coursesList: (json['coursesList'] as List<dynamic>)
          .map((e) => CourseUnselected.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

FormGeneralInfo _$FormGeneralInfoFromJson(Map<String, dynamic> json) =>
    FormGeneralInfo(
      round: json['Round'] as String,
      stage: json['Stage'] as String,
      maxCredit: int.parse(json['Credits (max)'] as String),
      chosenCredit: int.parse(json['Credits Chosen'] as String),
    );

CourseSelected _$CourseSelectedFromJson(Map<String, dynamic> json) =>
    CourseSelected(
      name: json['Waiting List'] as String,
      credit: int.parse(json['Credit'] as String),
      week: json['Teaching Week'] as String,
      lecturer: json['Lecturer'] as String,
      timeAndVenue: json['Time & Venue'] as String,
      quota: int.parse(json['Quota'] as String),
      numChosen: int.parse(json['Applicant No.'] as String),
      cancel: json['Cancel'] as String,
    );

CourseUnselected _$CourseUnselectedFromJson(Map<String, dynamic> json) =>
    CourseUnselected(
      name: json['Course Information (by group)'] as String,
      credit: int.parse(json['Credit'] as String),
      week: json['Teaching Week'] as String,
      lecturer: json['Lecturer'] as String,
      timeAndVenue: json['Time & Venue'] as String,
      quota: int.parse(json['Quota'] as String),
      numChosen: int.parse(json['Applicant No.'] as String),
      option: json['Option'] as String,
    );
