// This is a generated file - do not edit.
//
// Generated from forum_thread.proto.

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

@$core.Deprecated('Use createThreadReqDescriptor instead')
const CreateThreadReq$json = {
  '1': 'CreateThreadReq',
  '2': [
    {'1': 'forumId', '3': 1, '4': 1, '5': 5, '10': 'forumId'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {
      '1': 'plainContent',
      '3': 30,
      '4': 1,
      '5': 11,
      '6': '.xmux.forum.v4.PlainContent',
      '9': 0,
      '10': 'plainContent'
    },
    {
      '1': 'markdownContent',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.xmux.forum.v4.MarkdownContent',
      '9': 0,
      '10': 'markdownContent'
    },
  ],
  '8': [
    {'1': 'body'},
  ],
};

/// Descriptor for `CreateThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createThreadReqDescriptor = $convert.base64Decode(
    'Cg9DcmVhdGVUaHJlYWRSZXESGAoHZm9ydW1JZBgBIAEoBVIHZm9ydW1JZBIUCgV0aXRsZRgCIA'
    'EoCVIFdGl0bGUSQQoMcGxhaW5Db250ZW50GB4gASgLMhsueG11eC5mb3J1bS52NC5QbGFpbkNv'
    'bnRlbnRIAFIMcGxhaW5Db250ZW50EkoKD21hcmtkb3duQ29udGVudBgfIAEoCzIeLnhtdXguZm'
    '9ydW0udjQuTWFya2Rvd25Db250ZW50SABSD21hcmtkb3duQ29udGVudEIGCgRib2R5');

@$core.Deprecated('Use createThreadRespDescriptor instead')
const CreateThreadResp$json = {
  '1': 'CreateThreadResp',
  '2': [
    {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
  ],
};

/// Descriptor for `CreateThreadResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createThreadRespDescriptor = $convert.base64Decode(
    'ChBDcmVhdGVUaHJlYWRSZXNwEhoKCHRocmVhZElkGAEgASgFUgh0aHJlYWRJZA==');

@$core.Deprecated('Use removeThreadReqDescriptor instead')
const RemoveThreadReq$json = {
  '1': 'RemoveThreadReq',
  '2': [
    {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
  ],
};

/// Descriptor for `RemoveThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeThreadReqDescriptor = $convert.base64Decode(
    'Cg9SZW1vdmVUaHJlYWRSZXESGgoIdGhyZWFkSWQYASABKAVSCHRocmVhZElk');

@$core.Deprecated('Use updateThreadReqDescriptor instead')
const UpdateThreadReq$json = {
  '1': 'UpdateThreadReq',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'body', '3': 3, '4': 1, '5': 9, '10': 'body'},
  ],
};

/// Descriptor for `UpdateThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateThreadReqDescriptor = $convert.base64Decode(
    'Cg9VcGRhdGVUaHJlYWRSZXESDgoCaWQYASABKAVSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZR'
    'ISCgRib2R5GAMgASgJUgRib2R5');

@$core.Deprecated('Use getThreadsReqDescriptor instead')
const GetThreadsReq$json = {
  '1': 'GetThreadsReq',
  '2': [
    {'1': 'forumId', '3': 1, '4': 1, '5': 5, '10': 'forumId'},
    {
      '1': 'ordering',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.xmux.forum.v4.Ordering',
      '10': 'ordering'
    },
    {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
    {'1': 'count', '3': 4, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetThreadsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getThreadsReqDescriptor = $convert.base64Decode(
    'Cg1HZXRUaHJlYWRzUmVxEhgKB2ZvcnVtSWQYASABKAVSB2ZvcnVtSWQSMwoIb3JkZXJpbmcYAi'
    'ABKA4yFy54bXV4LmZvcnVtLnY0Lk9yZGVyaW5nUghvcmRlcmluZxIWCgZvZmZzZXQYAyABKAVS'
    'Bm9mZnNldBIUCgVjb3VudBgEIAEoBVIFY291bnQ=');

@$core.Deprecated('Use getThreadsRespDescriptor instead')
const GetThreadsResp$json = {
  '1': 'GetThreadsResp',
  '2': [
    {
      '1': 'threads',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.xmux.forum.v4.Thread',
      '10': 'threads'
    },
  ],
};

/// Descriptor for `GetThreadsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getThreadsRespDescriptor = $convert.base64Decode(
    'Cg5HZXRUaHJlYWRzUmVzcBIvCgd0aHJlYWRzGAEgAygLMhUueG11eC5mb3J1bS52NC5UaHJlYW'
    'RSB3RocmVhZHM=');

@$core.Deprecated('Use threadDescriptor instead')
const Thread$json = {
  '1': 'Thread',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'likes', '3': 4, '4': 1, '5': 5, '10': 'likes'},
    {'1': 'posts', '3': 5, '4': 1, '5': 5, '10': 'posts'},
    {'1': 'pinned', '3': 6, '4': 1, '5': 8, '10': 'pinned'},
    {'1': 'digest', '3': 7, '4': 1, '5': 8, '10': 'digest'},
    {
      '1': 'createAt',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createAt'
    },
    {
      '1': 'updateAt',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updateAt'
    },
    {
      '1': 'lastUpdate',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'lastUpdate'
    },
    {'1': 'liked', '3': 11, '4': 1, '5': 5, '10': 'liked'},
    {'1': 'saved', '3': 12, '4': 1, '5': 8, '10': 'saved'},
    {
      '1': 'plainContent',
      '3': 30,
      '4': 1,
      '5': 11,
      '6': '.xmux.forum.v4.PlainContent',
      '9': 0,
      '10': 'plainContent'
    },
    {
      '1': 'markdownContent',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.xmux.forum.v4.MarkdownContent',
      '9': 0,
      '10': 'markdownContent'
    },
  ],
  '8': [
    {'1': 'body'},
  ],
};

/// Descriptor for `Thread`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List threadDescriptor = $convert.base64Decode(
    'CgZUaHJlYWQSDgoCaWQYASABKAVSAmlkEhAKA3VpZBgCIAEoCVIDdWlkEhQKBXRpdGxlGAMgAS'
    'gJUgV0aXRsZRIUCgVsaWtlcxgEIAEoBVIFbGlrZXMSFAoFcG9zdHMYBSABKAVSBXBvc3RzEhYK'
    'BnBpbm5lZBgGIAEoCFIGcGlubmVkEhYKBmRpZ2VzdBgHIAEoCFIGZGlnZXN0EjYKCGNyZWF0ZU'
    'F0GAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIIY3JlYXRlQXQSNgoIdXBkYXRl'
    'QXQYCSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgh1cGRhdGVBdBI6CgpsYXN0VX'
    'BkYXRlGAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKbGFzdFVwZGF0ZRIUCgVs'
    'aWtlZBgLIAEoBVIFbGlrZWQSFAoFc2F2ZWQYDCABKAhSBXNhdmVkEkEKDHBsYWluQ29udGVudB'
    'geIAEoCzIbLnhtdXguZm9ydW0udjQuUGxhaW5Db250ZW50SABSDHBsYWluQ29udGVudBJKCg9t'
    'YXJrZG93bkNvbnRlbnQYHyABKAsyHi54bXV4LmZvcnVtLnY0Lk1hcmtkb3duQ29udGVudEgAUg'
    '9tYXJrZG93bkNvbnRlbnRCBgoEYm9keQ==');

@$core.Deprecated('Use likeThreadReqDescriptor instead')
const LikeThreadReq$json = {
  '1': 'LikeThreadReq',
  '2': [
    {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
    {'1': 'like', '3': 2, '4': 1, '5': 5, '10': 'like'},
  ],
};

/// Descriptor for `LikeThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likeThreadReqDescriptor = $convert.base64Decode(
    'Cg1MaWtlVGhyZWFkUmVxEhoKCHRocmVhZElkGAEgASgFUgh0aHJlYWRJZBISCgRsaWtlGAIgAS'
    'gFUgRsaWtl');

@$core.Deprecated('Use pinThreadReqDescriptor instead')
const PinThreadReq$json = {
  '1': 'PinThreadReq',
  '2': [
    {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
    {'1': 'pinned', '3': 2, '4': 1, '5': 8, '10': 'pinned'},
  ],
};

/// Descriptor for `PinThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pinThreadReqDescriptor = $convert.base64Decode(
    'CgxQaW5UaHJlYWRSZXESGgoIdGhyZWFkSWQYASABKAVSCHRocmVhZElkEhYKBnBpbm5lZBgCIA'
    'EoCFIGcGlubmVk');

@$core.Deprecated('Use digestThreadReqDescriptor instead')
const DigestThreadReq$json = {
  '1': 'DigestThreadReq',
  '2': [
    {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
    {'1': 'digest', '3': 2, '4': 1, '5': 8, '10': 'digest'},
  ],
};

/// Descriptor for `DigestThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List digestThreadReqDescriptor = $convert.base64Decode(
    'Cg9EaWdlc3RUaHJlYWRSZXESGgoIdGhyZWFkSWQYASABKAVSCHRocmVhZElkEhYKBmRpZ2VzdB'
    'gCIAEoCFIGZGlnZXN0');
