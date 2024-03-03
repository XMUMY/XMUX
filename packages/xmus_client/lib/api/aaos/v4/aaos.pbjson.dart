//
//  Generated code. Do not modify.
//  source: aaos/v4/aaos.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use infoDescriptor instead')
const Info$json = {
  '1': 'Info',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'gender', '3': 2, '4': 1, '5': 9, '10': 'gender'},
    {'1': 'id', '3': 3, '4': 1, '5': 9, '10': 'id'},
    {'1': 'programme', '3': 4, '4': 1, '5': 9, '10': 'programme'},
    {'1': 'intake', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'intake'},
    {'1': 'nationality', '3': 6, '4': 1, '5': 9, '10': 'nationality'},
  ],
};

/// Descriptor for `Info`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List infoDescriptor = $convert.base64Decode(
    'CgRJbmZvEhIKBG5hbWUYASABKAlSBG5hbWUSFgoGZ2VuZGVyGAIgASgJUgZnZW5kZXISDgoCaW'
    'QYAyABKAlSAmlkEhwKCXByb2dyYW1tZRgEIAEoCVIJcHJvZ3JhbW1lEjIKBmludGFrZRgFIAEo'
    'CzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBmludGFrZRIgCgtuYXRpb25hbGl0eRgGIA'
    'EoCVILbmF0aW9uYWxpdHk=');

@$core.Deprecated('Use timetableDescriptor instead')
const Timetable$json = {
  '1': 'Timetable',
  '2': [
    {'1': 'classes', '3': 1, '4': 3, '5': 11, '6': '.xmux.core.aaos.v4.Timetable.Class', '10': 'classes'},
    {'1': 'lastUpdate', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdate'},
  ],
  '3': [Timetable_Class$json],
};

@$core.Deprecated('Use timetableDescriptor instead')
const Timetable_Class$json = {
  '1': 'Class',
  '2': [
    {'1': 'cid', '3': 1, '4': 1, '5': 9, '10': 'cid'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'lecturer', '3': 3, '4': 1, '5': 9, '10': 'lecturer'},
    {'1': 'room', '3': 4, '4': 1, '5': 9, '10': 'room'},
    {'1': 'begin', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'begin'},
    {'1': 'end', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'end'},
    {'1': 'day', '3': 7, '4': 1, '5': 13, '10': 'day'},
  ],
};

/// Descriptor for `Timetable`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timetableDescriptor = $convert.base64Decode(
    'CglUaW1ldGFibGUSPAoHY2xhc3NlcxgBIAMoCzIiLnhtdXguY29yZS5hYW9zLnY0LlRpbWV0YW'
    'JsZS5DbGFzc1IHY2xhc3NlcxI6CgpsYXN0VXBkYXRlGAIgASgLMhouZ29vZ2xlLnByb3RvYnVm'
    'LlRpbWVzdGFtcFIKbGFzdFVwZGF0ZRrPAQoFQ2xhc3MSEAoDY2lkGAEgASgJUgNjaWQSEgoEbm'
    'FtZRgCIAEoCVIEbmFtZRIaCghsZWN0dXJlchgDIAEoCVIIbGVjdHVyZXISEgoEcm9vbRgEIAEo'
    'CVIEcm9vbRIwCgViZWdpbhgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBWJlZ2'
    'luEiwKA2VuZBgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSA2VuZBIQCgNkYXkY'
    'ByABKA1SA2RheQ==');

@$core.Deprecated('Use coursesDescriptor instead')
const Courses$json = {
  '1': 'Courses',
  '2': [
    {'1': 'courses', '3': 1, '4': 3, '5': 11, '6': '.xmux.core.aaos.v4.Courses.Course', '10': 'courses'},
  ],
  '3': [Courses_Course$json],
};

@$core.Deprecated('Use coursesDescriptor instead')
const Courses_Course$json = {
  '1': 'Course',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'credit', '3': 2, '4': 1, '5': 13, '10': 'credit'},
    {'1': 'lecturer', '3': 3, '4': 1, '5': 9, '10': 'lecturer'},
  ],
};

/// Descriptor for `Courses`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List coursesDescriptor = $convert.base64Decode(
    'CgdDb3Vyc2VzEjsKB2NvdXJzZXMYASADKAsyIS54bXV4LmNvcmUuYWFvcy52NC5Db3Vyc2VzLk'
    'NvdXJzZVIHY291cnNlcxpQCgZDb3Vyc2USEgoEbmFtZRgBIAEoCVIEbmFtZRIWCgZjcmVkaXQY'
    'AiABKA1SBmNyZWRpdBIaCghsZWN0dXJlchgDIAEoCVIIbGVjdHVyZXI=');

@$core.Deprecated('Use examsDescriptor instead')
const Exams$json = {
  '1': 'Exams',
  '2': [
    {'1': 'exams', '3': 1, '4': 3, '5': 11, '6': '.xmux.core.aaos.v4.Exams.Exam', '10': 'exams'},
    {'1': 'lastUpdate', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdate'},
  ],
  '3': [Exams_Exam$json],
};

@$core.Deprecated('Use examsDescriptor instead')
const Exams_Exam$json = {
  '1': 'Exam',
  '2': [
    {'1': 'exam', '3': 1, '4': 1, '5': 9, '10': 'exam'},
    {'1': 'begin', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'begin'},
    {'1': 'end', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'end'},
    {'1': 'venue', '3': 4, '4': 1, '5': 9, '10': 'venue'},
    {'1': 'courseName', '3': 5, '4': 1, '5': 9, '10': 'courseName'},
    {'1': 'type', '3': 6, '4': 1, '5': 9, '10': 'type'},
    {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `Exams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List examsDescriptor = $convert.base64Decode(
    'CgVFeGFtcxIzCgVleGFtcxgBIAMoCzIdLnhtdXguY29yZS5hYW9zLnY0LkV4YW1zLkV4YW1SBW'
    'V4YW1zEjoKCmxhc3RVcGRhdGUYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgps'
    'YXN0VXBkYXRlGtwBCgRFeGFtEhIKBGV4YW0YASABKAlSBGV4YW0SMAoFYmVnaW4YAiABKAsyGi'
    '5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgViZWdpbhIsCgNlbmQYAyABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wUgNlbmQSFAoFdmVudWUYBCABKAlSBXZlbnVlEh4KCmNvdXJzZU'
    '5hbWUYBSABKAlSCmNvdXJzZU5hbWUSEgoEdHlwZRgGIAEoCVIEdHlwZRIWCgZzdGF0dXMYByAB'
    'KAlSBnN0YXR1cw==');

@$core.Deprecated('Use transcriptDescriptor instead')
const Transcript$json = {
  '1': 'Transcript',
  '2': [
    {'1': 'sessions', '3': 1, '4': 3, '5': 11, '6': '.xmux.core.aaos.v4.Transcript.Session', '10': 'sessions'},
  ],
  '3': [Transcript_Session$json],
};

@$core.Deprecated('Use transcriptDescriptor instead')
const Transcript_Session$json = {
  '1': 'Session',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
    {'1': 'courses', '3': 2, '4': 3, '5': 11, '6': '.xmux.core.aaos.v4.Transcript.Session.Course', '10': 'courses'},
    {'1': 'gpa', '3': 3, '4': 1, '5': 2, '10': 'gpa'},
    {'1': 'cGpa', '3': 4, '4': 1, '5': 2, '10': 'cGpa'},
  ],
  '3': [Transcript_Session_Course$json],
};

@$core.Deprecated('Use transcriptDescriptor instead')
const Transcript_Session_Course$json = {
  '1': 'Course',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'credit', '3': 3, '4': 1, '5': 13, '10': 'credit'},
    {'1': 'grade', '3': 4, '4': 1, '5': 9, '10': 'grade'},
    {'1': 'point', '3': 5, '4': 1, '5': 2, '10': 'point'},
  ],
};

/// Descriptor for `Transcript`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transcriptDescriptor = $convert.base64Decode(
    'CgpUcmFuc2NyaXB0EkEKCHNlc3Npb25zGAEgAygLMiUueG11eC5jb3JlLmFhb3MudjQuVHJhbn'
    'NjcmlwdC5TZXNzaW9uUghzZXNzaW9ucxqHAgoHU2Vzc2lvbhIYCgdzZXNzaW9uGAEgASgJUgdz'
    'ZXNzaW9uEkYKB2NvdXJzZXMYAiADKAsyLC54bXV4LmNvcmUuYWFvcy52NC5UcmFuc2NyaXB0Ll'
    'Nlc3Npb24uQ291cnNlUgdjb3Vyc2VzEhAKA2dwYRgDIAEoAlIDZ3BhEhIKBGNHcGEYBCABKAJS'
    'BGNHcGEadAoGQ291cnNlEhIKBGNvZGUYASABKAlSBGNvZGUSEgoEbmFtZRgCIAEoCVIEbmFtZR'
    'IWCgZjcmVkaXQYAyABKA1SBmNyZWRpdBIUCgVncmFkZRgEIAEoCVIFZ3JhZGUSFAoFcG9pbnQY'
    'BSABKAJSBXBvaW50');

