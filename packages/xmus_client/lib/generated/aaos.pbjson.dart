///
//  Generated code. Do not modify.
//  source: aaos.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use infoDescriptor instead')
const Info$json = const {
  '1': 'Info',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'gender', '3': 2, '4': 1, '5': 9, '10': 'gender'},
    const {'1': 'id', '3': 3, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'programme', '3': 4, '4': 1, '5': 9, '10': 'programme'},
    const {'1': 'intake', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'intake'},
    const {'1': 'nationality', '3': 6, '4': 1, '5': 9, '10': 'nationality'},
  ],
};

/// Descriptor for `Info`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List infoDescriptor = $convert.base64Decode('CgRJbmZvEhIKBG5hbWUYASABKAlSBG5hbWUSFgoGZ2VuZGVyGAIgASgJUgZnZW5kZXISDgoCaWQYAyABKAlSAmlkEhwKCXByb2dyYW1tZRgEIAEoCVIJcHJvZ3JhbW1lEjIKBmludGFrZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBmludGFrZRIgCgtuYXRpb25hbGl0eRgGIAEoCVILbmF0aW9uYWxpdHk=');
@$core.Deprecated('Use timetableDescriptor instead')
const Timetable$json = const {
  '1': 'Timetable',
  '2': const [
    const {'1': 'classes', '3': 1, '4': 3, '5': 11, '6': '.xmux.core.aaos.v4.Timetable.Class', '10': 'classes'},
    const {'1': 'lastUpdate', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdate'},
  ],
  '3': const [Timetable_Class$json],
};

@$core.Deprecated('Use timetableDescriptor instead')
const Timetable_Class$json = const {
  '1': 'Class',
  '2': const [
    const {'1': 'cid', '3': 1, '4': 1, '5': 9, '10': 'cid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'lecturer', '3': 3, '4': 1, '5': 9, '10': 'lecturer'},
    const {'1': 'room', '3': 4, '4': 1, '5': 9, '10': 'room'},
    const {'1': 'begin', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'begin'},
    const {'1': 'end', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'end'},
    const {'1': 'day', '3': 7, '4': 1, '5': 13, '10': 'day'},
  ],
};

/// Descriptor for `Timetable`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timetableDescriptor = $convert.base64Decode('CglUaW1ldGFibGUSPAoHY2xhc3NlcxgBIAMoCzIiLnhtdXguY29yZS5hYW9zLnY0LlRpbWV0YWJsZS5DbGFzc1IHY2xhc3NlcxI6CgpsYXN0VXBkYXRlGAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKbGFzdFVwZGF0ZRrPAQoFQ2xhc3MSEAoDY2lkGAEgASgJUgNjaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIaCghsZWN0dXJlchgDIAEoCVIIbGVjdHVyZXISEgoEcm9vbRgEIAEoCVIEcm9vbRIwCgViZWdpbhgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBWJlZ2luEiwKA2VuZBgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSA2VuZBIQCgNkYXkYByABKA1SA2RheQ==');
@$core.Deprecated('Use coursesDescriptor instead')
const Courses$json = const {
  '1': 'Courses',
  '2': const [
    const {'1': 'courses', '3': 1, '4': 3, '5': 11, '6': '.xmux.core.aaos.v4.Courses.Course', '10': 'courses'},
  ],
  '3': const [Courses_Course$json],
};

@$core.Deprecated('Use coursesDescriptor instead')
const Courses_Course$json = const {
  '1': 'Course',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'credit', '3': 2, '4': 1, '5': 13, '10': 'credit'},
    const {'1': 'lecturer', '3': 3, '4': 1, '5': 9, '10': 'lecturer'},
  ],
};

/// Descriptor for `Courses`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List coursesDescriptor = $convert.base64Decode('CgdDb3Vyc2VzEjsKB2NvdXJzZXMYASADKAsyIS54bXV4LmNvcmUuYWFvcy52NC5Db3Vyc2VzLkNvdXJzZVIHY291cnNlcxpQCgZDb3Vyc2USEgoEbmFtZRgBIAEoCVIEbmFtZRIWCgZjcmVkaXQYAiABKA1SBmNyZWRpdBIaCghsZWN0dXJlchgDIAEoCVIIbGVjdHVyZXI=');
@$core.Deprecated('Use examsDescriptor instead')
const Exams$json = const {
  '1': 'Exams',
  '2': const [
    const {'1': 'exams', '3': 1, '4': 3, '5': 11, '6': '.xmux.core.aaos.v4.Exams.Exam', '10': 'exams'},
    const {'1': 'lastUpdate', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdate'},
  ],
  '3': const [Exams_Exam$json],
};

@$core.Deprecated('Use examsDescriptor instead')
const Exams_Exam$json = const {
  '1': 'Exam',
  '2': const [
    const {'1': 'exam', '3': 1, '4': 1, '5': 9, '10': 'exam'},
    const {'1': 'begin', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'begin'},
    const {'1': 'end', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'end'},
    const {'1': 'venue', '3': 4, '4': 1, '5': 9, '10': 'venue'},
    const {'1': 'courseName', '3': 5, '4': 1, '5': 9, '10': 'courseName'},
    const {'1': 'type', '3': 6, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `Exams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List examsDescriptor = $convert.base64Decode('CgVFeGFtcxIzCgVleGFtcxgBIAMoCzIdLnhtdXguY29yZS5hYW9zLnY0LkV4YW1zLkV4YW1SBWV4YW1zEjoKCmxhc3RVcGRhdGUYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgpsYXN0VXBkYXRlGtwBCgRFeGFtEhIKBGV4YW0YASABKAlSBGV4YW0SMAoFYmVnaW4YAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgViZWdpbhIsCgNlbmQYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgNlbmQSFAoFdmVudWUYBCABKAlSBXZlbnVlEh4KCmNvdXJzZU5hbWUYBSABKAlSCmNvdXJzZU5hbWUSEgoEdHlwZRgGIAEoCVIEdHlwZRIWCgZzdGF0dXMYByABKAlSBnN0YXR1cw==');
@$core.Deprecated('Use transcriptDescriptor instead')
const Transcript$json = const {
  '1': 'Transcript',
  '2': const [
    const {'1': 'sessions', '3': 1, '4': 3, '5': 11, '6': '.xmux.core.aaos.v4.Transcript.Session', '10': 'sessions'},
  ],
  '3': const [Transcript_Session$json],
};

@$core.Deprecated('Use transcriptDescriptor instead')
const Transcript_Session$json = const {
  '1': 'Session',
  '2': const [
    const {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
    const {'1': 'courses', '3': 2, '4': 3, '5': 11, '6': '.xmux.core.aaos.v4.Transcript.Session.Course', '10': 'courses'},
    const {'1': 'gpa', '3': 3, '4': 1, '5': 2, '10': 'gpa'},
    const {'1': 'cGpa', '3': 4, '4': 1, '5': 2, '10': 'cGpa'},
  ],
  '3': const [Transcript_Session_Course$json],
};

@$core.Deprecated('Use transcriptDescriptor instead')
const Transcript_Session_Course$json = const {
  '1': 'Course',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'credit', '3': 3, '4': 1, '5': 13, '10': 'credit'},
    const {'1': 'grade', '3': 4, '4': 1, '5': 9, '10': 'grade'},
    const {'1': 'point', '3': 5, '4': 1, '5': 2, '10': 'point'},
  ],
};

/// Descriptor for `Transcript`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transcriptDescriptor = $convert.base64Decode('CgpUcmFuc2NyaXB0EkEKCHNlc3Npb25zGAEgAygLMiUueG11eC5jb3JlLmFhb3MudjQuVHJhbnNjcmlwdC5TZXNzaW9uUghzZXNzaW9ucxqHAgoHU2Vzc2lvbhIYCgdzZXNzaW9uGAEgASgJUgdzZXNzaW9uEkYKB2NvdXJzZXMYAiADKAsyLC54bXV4LmNvcmUuYWFvcy52NC5UcmFuc2NyaXB0LlNlc3Npb24uQ291cnNlUgdjb3Vyc2VzEhAKA2dwYRgDIAEoAlIDZ3BhEhIKBGNHcGEYBCABKAJSBGNHcGEadAoGQ291cnNlEhIKBGNvZGUYASABKAlSBGNvZGUSEgoEbmFtZRgCIAEoCVIEbmFtZRIWCgZjcmVkaXQYAyABKA1SBmNyZWRpdBIUCgVncmFkZRgEIAEoCVIFZ3JhZGUSFAoFcG9pbnQYBSABKAJSBXBvaW50');
