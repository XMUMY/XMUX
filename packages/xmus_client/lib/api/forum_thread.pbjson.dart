///
//  Generated code. Do not modify.
//  source: forum_thread.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createThreadReqDescriptor instead')
const CreateThreadReq$json = const {
  '1': 'CreateThreadReq',
  '2': const [
    const {'1': 'forumId', '3': 1, '4': 1, '5': 5, '10': 'forumId'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'plainContent', '3': 30, '4': 1, '5': 11, '6': '.xmux.forum.v4.PlainContent', '9': 0, '10': 'plainContent'},
    const {'1': 'markdownContent', '3': 31, '4': 1, '5': 11, '6': '.xmux.forum.v4.MarkdownContent', '9': 0, '10': 'markdownContent'},
  ],
  '8': const [
    const {'1': 'body'},
  ],
};

/// Descriptor for `CreateThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createThreadReqDescriptor = $convert.base64Decode('Cg9DcmVhdGVUaHJlYWRSZXESGAoHZm9ydW1JZBgBIAEoBVIHZm9ydW1JZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSQQoMcGxhaW5Db250ZW50GB4gASgLMhsueG11eC5mb3J1bS52NC5QbGFpbkNvbnRlbnRIAFIMcGxhaW5Db250ZW50EkoKD21hcmtkb3duQ29udGVudBgfIAEoCzIeLnhtdXguZm9ydW0udjQuTWFya2Rvd25Db250ZW50SABSD21hcmtkb3duQ29udGVudEIGCgRib2R5');
@$core.Deprecated('Use createThreadRespDescriptor instead')
const CreateThreadResp$json = const {
  '1': 'CreateThreadResp',
  '2': const [
    const {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
  ],
};

/// Descriptor for `CreateThreadResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createThreadRespDescriptor = $convert.base64Decode('ChBDcmVhdGVUaHJlYWRSZXNwEhoKCHRocmVhZElkGAEgASgFUgh0aHJlYWRJZA==');
@$core.Deprecated('Use removeThreadReqDescriptor instead')
const RemoveThreadReq$json = const {
  '1': 'RemoveThreadReq',
  '2': const [
    const {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
  ],
};

/// Descriptor for `RemoveThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeThreadReqDescriptor = $convert.base64Decode('Cg9SZW1vdmVUaHJlYWRSZXESGgoIdGhyZWFkSWQYASABKAVSCHRocmVhZElk');
@$core.Deprecated('Use updateThreadReqDescriptor instead')
const UpdateThreadReq$json = const {
  '1': 'UpdateThreadReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'body', '3': 3, '4': 1, '5': 9, '10': 'body'},
  ],
};

/// Descriptor for `UpdateThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateThreadReqDescriptor = $convert.base64Decode('Cg9VcGRhdGVUaHJlYWRSZXESDgoCaWQYASABKAVSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZRISCgRib2R5GAMgASgJUgRib2R5');
@$core.Deprecated('Use getThreadsReqDescriptor instead')
const GetThreadsReq$json = const {
  '1': 'GetThreadsReq',
  '2': const [
    const {'1': 'forumId', '3': 1, '4': 1, '5': 5, '10': 'forumId'},
    const {'1': 'ordering', '3': 2, '4': 1, '5': 14, '6': '.xmux.forum.v4.Ordering', '10': 'ordering'},
    const {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
    const {'1': 'count', '3': 4, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetThreadsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getThreadsReqDescriptor = $convert.base64Decode('Cg1HZXRUaHJlYWRzUmVxEhgKB2ZvcnVtSWQYASABKAVSB2ZvcnVtSWQSMwoIb3JkZXJpbmcYAiABKA4yFy54bXV4LmZvcnVtLnY0Lk9yZGVyaW5nUghvcmRlcmluZxIWCgZvZmZzZXQYAyABKAVSBm9mZnNldBIUCgVjb3VudBgEIAEoBVIFY291bnQ=');
@$core.Deprecated('Use getThreadsRespDescriptor instead')
const GetThreadsResp$json = const {
  '1': 'GetThreadsResp',
  '2': const [
    const {'1': 'threads', '3': 1, '4': 3, '5': 11, '6': '.xmux.forum.v4.Thread', '10': 'threads'},
  ],
};

/// Descriptor for `GetThreadsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getThreadsRespDescriptor = $convert.base64Decode('Cg5HZXRUaHJlYWRzUmVzcBIvCgd0aHJlYWRzGAEgAygLMhUueG11eC5mb3J1bS52NC5UaHJlYWRSB3RocmVhZHM=');
@$core.Deprecated('Use threadDescriptor instead')
const Thread$json = const {
  '1': 'Thread',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'likes', '3': 4, '4': 1, '5': 5, '10': 'likes'},
    const {'1': 'posts', '3': 5, '4': 1, '5': 5, '10': 'posts'},
    const {'1': 'pinned', '3': 6, '4': 1, '5': 8, '10': 'pinned'},
    const {'1': 'digest', '3': 7, '4': 1, '5': 8, '10': 'digest'},
    const {'1': 'createAt', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createAt'},
    const {'1': 'updateAt', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updateAt'},
    const {'1': 'lastUpdate', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdate'},
    const {'1': 'liked', '3': 11, '4': 1, '5': 5, '10': 'liked'},
    const {'1': 'saved', '3': 12, '4': 1, '5': 8, '10': 'saved'},
    const {'1': 'plainContent', '3': 30, '4': 1, '5': 11, '6': '.xmux.forum.v4.PlainContent', '9': 0, '10': 'plainContent'},
    const {'1': 'markdownContent', '3': 31, '4': 1, '5': 11, '6': '.xmux.forum.v4.MarkdownContent', '9': 0, '10': 'markdownContent'},
  ],
  '8': const [
    const {'1': 'body'},
  ],
};

/// Descriptor for `Thread`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List threadDescriptor = $convert.base64Decode('CgZUaHJlYWQSDgoCaWQYASABKAVSAmlkEhAKA3VpZBgCIAEoCVIDdWlkEhQKBXRpdGxlGAMgASgJUgV0aXRsZRIUCgVsaWtlcxgEIAEoBVIFbGlrZXMSFAoFcG9zdHMYBSABKAVSBXBvc3RzEhYKBnBpbm5lZBgGIAEoCFIGcGlubmVkEhYKBmRpZ2VzdBgHIAEoCFIGZGlnZXN0EjYKCGNyZWF0ZUF0GAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIIY3JlYXRlQXQSNgoIdXBkYXRlQXQYCSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgh1cGRhdGVBdBI6CgpsYXN0VXBkYXRlGAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKbGFzdFVwZGF0ZRIUCgVsaWtlZBgLIAEoBVIFbGlrZWQSFAoFc2F2ZWQYDCABKAhSBXNhdmVkEkEKDHBsYWluQ29udGVudBgeIAEoCzIbLnhtdXguZm9ydW0udjQuUGxhaW5Db250ZW50SABSDHBsYWluQ29udGVudBJKCg9tYXJrZG93bkNvbnRlbnQYHyABKAsyHi54bXV4LmZvcnVtLnY0Lk1hcmtkb3duQ29udGVudEgAUg9tYXJrZG93bkNvbnRlbnRCBgoEYm9keQ==');
@$core.Deprecated('Use likeThreadReqDescriptor instead')
const LikeThreadReq$json = const {
  '1': 'LikeThreadReq',
  '2': const [
    const {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
    const {'1': 'like', '3': 2, '4': 1, '5': 5, '10': 'like'},
  ],
};

/// Descriptor for `LikeThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likeThreadReqDescriptor = $convert.base64Decode('Cg1MaWtlVGhyZWFkUmVxEhoKCHRocmVhZElkGAEgASgFUgh0aHJlYWRJZBISCgRsaWtlGAIgASgFUgRsaWtl');
@$core.Deprecated('Use pinThreadReqDescriptor instead')
const PinThreadReq$json = const {
  '1': 'PinThreadReq',
  '2': const [
    const {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
    const {'1': 'pinned', '3': 2, '4': 1, '5': 8, '10': 'pinned'},
  ],
};

/// Descriptor for `PinThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pinThreadReqDescriptor = $convert.base64Decode('CgxQaW5UaHJlYWRSZXESGgoIdGhyZWFkSWQYASABKAVSCHRocmVhZElkEhYKBnBpbm5lZBgCIAEoCFIGcGlubmVk');
@$core.Deprecated('Use digestThreadReqDescriptor instead')
const DigestThreadReq$json = const {
  '1': 'DigestThreadReq',
  '2': const [
    const {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
    const {'1': 'digest', '3': 2, '4': 1, '5': 8, '10': 'digest'},
  ],
};

/// Descriptor for `DigestThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List digestThreadReqDescriptor = $convert.base64Decode('Cg9EaWdlc3RUaHJlYWRSZXESGgoIdGhyZWFkSWQYASABKAVSCHRocmVhZElkEhYKBmRpZ2VzdBgCIAEoCFIGZGlnZXN0');
