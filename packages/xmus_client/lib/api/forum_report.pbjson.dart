// This is a generated file - do not edit.
//
// Generated from forum_report.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use reportPostOrThreadReqDescriptor instead')
const ReportPostOrThreadReq$json = {
  '1': 'ReportPostOrThreadReq',
  '2': [
    {'1': 'postId', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'postId'},
    {'1': 'threadId', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'threadId'},
    {'1': 'typeId', '3': 3, '4': 1, '5': 5, '10': 'typeId'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
  ],
  '8': [
    {'1': 'target'},
  ],
};

/// Descriptor for `ReportPostOrThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportPostOrThreadReqDescriptor = $convert.base64Decode(
    'ChVSZXBvcnRQb3N0T3JUaHJlYWRSZXESGAoGcG9zdElkGAEgASgFSABSBnBvc3RJZBIcCgh0aH'
    'JlYWRJZBgCIAEoBUgAUgh0aHJlYWRJZBIWCgZ0eXBlSWQYAyABKAVSBnR5cGVJZBIgCgtkZXNj'
    'cmlwdGlvbhgEIAEoCVILZGVzY3JpcHRpb25CCAoGdGFyZ2V0');

@$core.Deprecated('Use reportPostOrThreadRespDescriptor instead')
const ReportPostOrThreadResp$json = {
  '1': 'ReportPostOrThreadResp',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ReportPostOrThreadResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportPostOrThreadRespDescriptor =
    $convert.base64Decode(
        'ChZSZXBvcnRQb3N0T3JUaHJlYWRSZXNwEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbW'
        'Vzc2FnZRgCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use getReportTypesRespDescriptor instead')
const GetReportTypesResp$json = {
  '1': 'GetReportTypesResp',
  '2': [
    {
      '1': 'types',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.xmux.forum.v4.ReportType',
      '10': 'types'
    },
  ],
};

/// Descriptor for `GetReportTypesResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getReportTypesRespDescriptor = $convert.base64Decode(
    'ChJHZXRSZXBvcnRUeXBlc1Jlc3ASLwoFdHlwZXMYASADKAsyGS54bXV4LmZvcnVtLnY0LlJlcG'
    '9ydFR5cGVSBXR5cGVz');

@$core.Deprecated('Use reportTypeDescriptor instead')
const ReportType$json = {
  '1': 'ReportType',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `ReportType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportTypeDescriptor = $convert.base64Decode(
    'CgpSZXBvcnRUeXBlEg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW1l');
