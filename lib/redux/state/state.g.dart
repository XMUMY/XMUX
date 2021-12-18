// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) => AppState(
      user: json['user'] == null
          ? null
          : UserState.fromJson(json['user'] as Map<String, dynamic>),
      queries: json['queries'] == null
          ? null
          : QueryState.fromJson(json['queries'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'user': instance.user,
      'queries': instance.queries,
    };

QueryState _$QueryStateFromJson(Map<String, dynamic> json) => QueryState(
      timetable: json['timetable'] == null
          ? null
          : Timetable.fromJson(json['timetable'] as Map<String, dynamic>),
      courses: json['courses'] == null
          ? null
          : Courses.fromJson(json['courses'] as Map<String, dynamic>),
      exams: json['exams'] == null
          ? null
          : Exams.fromJson(json['exams'] as Map<String, dynamic>),
      transcript: json['transcript'] == null
          ? null
          : Transcript.fromJson(json['transcript'] as Map<String, dynamic>),
      assignments: (json['assignments'] as List<dynamic>?)
              ?.map((e) => AssignmentCourse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      emgsApplicationResult: json['emgsApplicationResult'] == null
          ? null
          : EmgsApplicationResult.fromJson(
              json['emgsApplicationResult'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QueryStateToJson(QueryState instance) =>
    <String, dynamic>{
      'timetable': instance.timetable,
      'courses': instance.courses,
      'exams': instance.exams,
      'transcript': instance.transcript,
      'assignments': instance.assignments,
      'emgsApplicationResult': instance.emgsApplicationResult,
    };

UserState _$UserStateFromJson(Map<String, dynamic> json) => UserState(
      campusId: json['campusId'] as String? ?? '',
      password: json['password'] as String? ?? '',
      ePaymentPassword: json['ePaymentPassword'] as String? ?? '',
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserStateToJson(UserState instance) => <String, dynamic>{
      'campusId': instance.campusId,
      'password': instance.password,
      'ePaymentPassword': instance.ePaymentPassword,
      'profile': instance.profile,
    };
