// This is a generated file - do not edit.
//
// Generated from forum.proto.

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

@$core.Deprecated('Use getForumsReqDescriptor instead')
const GetForumsReq$json = {
  '1': 'GetForumsReq',
  '2': [
    {'1': 'from', '3': 1, '4': 1, '5': 5, '10': 'from'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetForumsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getForumsReqDescriptor = $convert.base64Decode(
    'CgxHZXRGb3J1bXNSZXESEgoEZnJvbRgBIAEoBVIEZnJvbRIUCgVjb3VudBgCIAEoBVIFY291bn'
    'Q=');

@$core.Deprecated('Use getForumsRespDescriptor instead')
const GetForumsResp$json = {
  '1': 'GetForumsResp',
  '2': [
    {
      '1': 'forums',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.xmux.forum.v4.ForumDetail',
      '10': 'forums'
    },
  ],
};

/// Descriptor for `GetForumsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getForumsRespDescriptor = $convert.base64Decode(
    'Cg1HZXRGb3J1bXNSZXNwEjIKBmZvcnVtcxgBIAMoCzIaLnhtdXguZm9ydW0udjQuRm9ydW1EZX'
    'RhaWxSBmZvcnVtcw==');

@$core.Deprecated('Use forumDetailDescriptor instead')
const ForumDetail$json = {
  '1': 'ForumDetail',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'creatorUid', '3': 4, '4': 1, '5': 9, '10': 'creatorUid'},
  ],
};

/// Descriptor for `ForumDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forumDetailDescriptor = $convert.base64Decode(
    'CgtGb3J1bURldGFpbBIOCgJpZBgBIAEoBVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEiAKC2'
    'Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIeCgpjcmVhdG9yVWlkGAQgASgJUgpjcmVh'
    'dG9yVWlk');
