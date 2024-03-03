///
//  Generated code. Do not modify.
//  source: forum.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createForumReqDescriptor instead')
const CreateForumReq$json = const {
  '1': 'CreateForumReq',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `CreateForumReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createForumReqDescriptor = $convert.base64Decode('Cg5DcmVhdGVGb3J1bVJlcRIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YAiABKAlSC2Rlc2NyaXB0aW9u');
@$core.Deprecated('Use createForumRespDescriptor instead')
const CreateForumResp$json = const {
  '1': 'CreateForumResp',
  '2': const [
    const {'1': 'forumId', '3': 1, '4': 1, '5': 5, '10': 'forumId'},
  ],
};

/// Descriptor for `CreateForumResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createForumRespDescriptor = $convert.base64Decode('Cg9DcmVhdGVGb3J1bVJlc3ASGAoHZm9ydW1JZBgBIAEoBVIHZm9ydW1JZA==');
@$core.Deprecated('Use removeForumReqDescriptor instead')
const RemoveForumReq$json = const {
  '1': 'RemoveForumReq',
  '2': const [
    const {'1': 'forumId', '3': 1, '4': 1, '5': 5, '10': 'forumId'},
  ],
};

/// Descriptor for `RemoveForumReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeForumReqDescriptor = $convert.base64Decode('Cg5SZW1vdmVGb3J1bVJlcRIYCgdmb3J1bUlkGAEgASgFUgdmb3J1bUlk');
@$core.Deprecated('Use getForumsReqDescriptor instead')
const GetForumsReq$json = const {
  '1': 'GetForumsReq',
  '2': const [
    const {'1': 'from', '3': 1, '4': 1, '5': 5, '10': 'from'},
    const {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetForumsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getForumsReqDescriptor = $convert.base64Decode('CgxHZXRGb3J1bXNSZXESEgoEZnJvbRgBIAEoBVIEZnJvbRIUCgVjb3VudBgCIAEoBVIFY291bnQ=');
@$core.Deprecated('Use getForumsRespDescriptor instead')
const GetForumsResp$json = const {
  '1': 'GetForumsResp',
  '2': const [
    const {'1': 'forums', '3': 1, '4': 3, '5': 11, '6': '.xmux.forum.v4.ForumDetail', '10': 'forums'},
  ],
};

/// Descriptor for `GetForumsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getForumsRespDescriptor = $convert.base64Decode('Cg1HZXRGb3J1bXNSZXNwEjIKBmZvcnVtcxgBIAMoCzIaLnhtdXguZm9ydW0udjQuRm9ydW1EZXRhaWxSBmZvcnVtcw==');
@$core.Deprecated('Use forumDetailDescriptor instead')
const ForumDetail$json = const {
  '1': 'ForumDetail',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'creatorUid', '3': 4, '4': 1, '5': 9, '10': 'creatorUid'},
  ],
};

/// Descriptor for `ForumDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forumDetailDescriptor = $convert.base64Decode('CgtGb3J1bURldGFpbBIOCgJpZBgBIAEoBVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIeCgpjcmVhdG9yVWlkGAQgASgJUgpjcmVhdG9yVWlk');
