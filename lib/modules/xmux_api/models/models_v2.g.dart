// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Announcement _$AnnouncementFromJson(Map<String, dynamic> json) {
  return Announcement(
      json['headline'] as String,
      json['detail'] as String,
      json['timestamp'] == null
          ? null
          : Announcement._timestampFromJson(json['timestamp'] as int),
      json['uri'] as String);
}

Map<String, dynamic> _$AnnouncementToJson(Announcement instance) =>
    <String, dynamic>{
      'headline': instance.headline,
      'detail': instance.detail,
      'timestamp': instance.timestamp == null
          ? null
          : Announcement._timestampToJson(instance.timestamp),
      'uri': instance.uri
    };

BillingRecord _$BillingRecordFromJson(Map<String, dynamic> json) {
  return BillingRecord(
      json['item'] as String,
      json['amount'] == null
          ? null
          : BillingRecord._amountFromJson(json['amount'] as String),
      json['balance'] as String);
}

Map<String, dynamic> _$BillingRecordToJson(BillingRecord instance) =>
    <String, dynamic>{
      'item': instance.item,
      'amount': instance.amount == null
          ? null
          : BillingRecord._amountToJson(instance.amount),
      'balance': instance.balance
    };

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(json['name'] as String, json['imageURL'] as String,
      json['uri'] as String);
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'name': instance.name,
      'imageURL': instance.imageURL,
      'uri': instance.uri
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['campusId'] as String, json['name'] as String,
      json['headpic'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'campusId': instance.campusId,
      'name': instance.name,
      'headpic': instance.photoUrl
    };

AcData _$AcDataFromJson(Map<String, dynamic> json) {
  return AcData(
      timetable: (json['timetable'] as List)
          ?.map((e) =>
              e == null ? null : Lesson.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      exams: (json['exams'] as List)
          ?.map((e) =>
              e == null ? null : Exam.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      examResult: (json['examResult'] as List)
          ?.map((e) => e == null
              ? null
              : SessionExamResult.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      courses: (json['courses'] as List)
          ?.map((e) =>
              e == null ? null : Course.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(
      json['Name'] as String,
      json['Chinese Name'] as String,
      json['Gender'] as String,
      json['NRIC/Passport No.'] as String,
      json['Programme'] as String,
      json['Intake'] as String,
      json['Registration Time'] as String,
      json['Nationality'] as String,
      json['Phone'] as String);
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'Name': instance.name,
      'Chinese Name': instance.cnName,
      'Gender': instance.gender,
      'NRIC/Passport No.': instance.idNumber,
      'Programme': instance.programme,
      'Intake': instance.intake,
      'Registration Time': instance.regTime,
      'Nationality': instance.nationality,
      'Phone': instance.phone
    };

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
      'Exam Time': instance.durationOfDay,
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
      json['GPA'] as String,
      json['CGPA'] as String);
}

Map<String, dynamic> _$SessionExamResultToJson(SessionExamResult instance) =>
    <String, dynamic>{
      'academicSession': instance.academicSession,
      'result': instance.result,
      'GPA': instance.gpa,
      'CGPA': instance.cGpa
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

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
      json['Course Name (by group)'] as String,
      json['Credit'] == null
          ? null
          : Course._creditFromJson(json['Credit'] as String),
      json['Lecturer'] as String,
      json['Registration Type'] as String);
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'Course Name (by group)': instance.courseName,
      'Credit': instance.credit == null
          ? null
          : Course._creditToJson(instance.credit),
      'Lecturer': instance.lecturer,
      'Registration Type': instance.registrationType
    };

MoodleData _$MoodleDataFromJson(Map<String, dynamic> json) {
  return MoodleData(
      assignments: (json['assignments'] as List)
          ?.map((e) => e == null
              ? null
              : LessonAssignments.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

LessonAssignments _$LessonAssignmentsFromJson(Map<String, dynamic> json) {
  return LessonAssignments(
      json['fullname'] as String,
      json['shortname'] as String,
      (json['assignments'] as List)
          ?.map((e) =>
              e == null ? null : Assignment.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LessonAssignmentsToJson(LessonAssignments instance) =>
    <String, dynamic>{
      'fullname': instance.courseFullName,
      'shortname': instance.courseShortName,
      'assignments': instance.assignments
    };

Assignment _$AssignmentFromJson(Map<String, dynamic> json) {
  return Assignment(
      json['id'] as int,
      json['name'] as String,
      json['duedateTimestamp'] == null
          ? null
          : Assignment._timestampFromJson(json['duedateTimestamp'] as int));
}

Map<String, dynamic> _$AssignmentToJson(Assignment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duedateTimestamp': instance.timestamp == null
          ? null
          : Assignment._timestampToJson(instance.timestamp)
    };
