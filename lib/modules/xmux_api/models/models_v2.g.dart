// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcData _$AcDataFromJson(Map<String, dynamic> json) {
  return AcData(
      (json['timetable'] as List)
          ?.map((e) =>
              e == null ? null : Lesson.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['exams'] as List)
          ?.map((e) =>
              e == null ? null : Exam.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['examResult'] as List)
          ?.map((e) => e == null
              ? null
              : SessionExamResult.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return Lesson(
      json['courseCode'] as String,
      json['courseName'] as String,
      json['lecturer'] as String,
      json['classRoom'] as String,
      json['weeks'] == null
          ? null
          : Lesson._weeksFromJson(json['weeks'] as String),
      json['dayOfWeek'] as int,
      json['startTimeOfDay'] == null
          ? null
          : Lesson._timeOfDayFromJson(json['startTimeOfDay'] as String),
      json['endTimeOfDay'] == null
          ? null
          : Lesson._timeOfDayFromJson(json['endTimeOfDay'] as String));
}

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'courseCode': instance.courseCode,
      'courseName': instance.courseName,
      'lecturer': instance.lecturer,
      'classRoom': instance.classroom,
      'weeks':
          instance.weeks == null ? null : Lesson._weeksToJson(instance.weeks),
      'dayOfWeek': instance.dayOfWeek,
      'startTimeOfDay': instance.startTimeOfDay == null
          ? null
          : Lesson._timeOfDayToJson(instance.startTimeOfDay),
      'endTimeOfDay': instance.endTimeOfDay == null
          ? null
          : Lesson._timeOfDayToJson(instance.endTimeOfDay)
    };

Exam _$ExamFromJson(Map<String, dynamic> json) {
  return Exam(
      json['Exam (Academic Session)'] as String,
      json['Exam Date'] == null
          ? null
          : Exam._dateFromJson(json['Exam Date'] as String),
      json['Exam Time'] == null
          ? null
          : DurationOfDay.parse(json['Exam Time'] as String),
      json['Exam Venue'] as String,
      json['Course Name'] as String,
      json['Exam Type'] as String,
      json['Status'] as String);
}

Map<String, dynamic> _$ExamToJson(Exam instance) => <String, dynamic>{
      'Exam (Academic Session)': instance.session,
      'Exam Date':
          instance.date == null ? null : Exam._dateToJson(instance.date),
      'Exam Time': instance.durationOfDay == null
          ? null
          : DurationOfDay.toJson(instance.durationOfDay),
      'Exam Venue': instance.venue,
      'Course Name': instance.courseName,
      'Exam Type': instance.type,
      'Status': instance.status
    };

SessionExamResult _$SessionExamResultFromJson(Map<String, dynamic> json) {
  return SessionExamResult(
      json['academicSession'] as String,
      (json['result'] as List)
          ?.map((e) => e == null
              ? null
              : CourseExamResult.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['gpa'] as String,
      json['cGpa'] as String);
}

Map<String, dynamic> _$SessionExamResultToJson(SessionExamResult instance) =>
    <String, dynamic>{
      'academicSession': instance.academicSession,
      'result': instance.result,
      'gpa': instance.gpa,
      'cGpa': instance.cGpa
    };

CourseExamResult _$CourseExamResultFromJson(Map<String, dynamic> json) {
  return CourseExamResult(
      json['courseCode'] as String,
      json['courseName'] as String,
      json['credit'] as int,
      json['grade'] as String,
      (json['gradePoint'] as num)?.toDouble(),
      json['registrationType'] as String);
}

Map<String, dynamic> _$CourseExamResultToJson(CourseExamResult instance) =>
    <String, dynamic>{
      'courseCode': instance.courseCode,
      'courseName': instance.courseName,
      'credit': instance.credit,
      'grade': instance.grade,
      'gradePoint': instance.gradePoint,
      'registrationType': instance.registrationType
    };
