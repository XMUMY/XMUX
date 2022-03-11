///
//  Generated code. Do not modify.
//  source: forum_saved.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use saveThreadReqDescriptor instead')
const SaveThreadReq$json = const {
  '1': 'SaveThreadReq',
  '2': const [
    const {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
  ],
};

/// Descriptor for `SaveThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveThreadReqDescriptor = $convert.base64Decode('Cg1TYXZlVGhyZWFkUmVxEhoKCHRocmVhZElkGAEgASgFUgh0aHJlYWRJZA==');
@$core.Deprecated('Use unsaveThreadReqDescriptor instead')
const UnsaveThreadReq$json = const {
  '1': 'UnsaveThreadReq',
  '2': const [
    const {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
  ],
};

/// Descriptor for `UnsaveThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unsaveThreadReqDescriptor = $convert.base64Decode('Cg9VbnNhdmVUaHJlYWRSZXESGgoIdGhyZWFkSWQYASABKAVSCHRocmVhZElk');
@$core.Deprecated('Use savePostReqDescriptor instead')
const SavePostReq$json = const {
  '1': 'SavePostReq',
  '2': const [
    const {'1': 'postId', '3': 1, '4': 1, '5': 5, '10': 'postId'},
  ],
};

/// Descriptor for `SavePostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List savePostReqDescriptor = $convert.base64Decode('CgtTYXZlUG9zdFJlcRIWCgZwb3N0SWQYASABKAVSBnBvc3RJZA==');
@$core.Deprecated('Use unsavePostReqDescriptor instead')
const UnsavePostReq$json = const {
  '1': 'UnsavePostReq',
  '2': const [
    const {'1': 'postId', '3': 1, '4': 1, '5': 5, '10': 'postId'},
  ],
};

/// Descriptor for `UnsavePostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unsavePostReqDescriptor = $convert.base64Decode('Cg1VbnNhdmVQb3N0UmVxEhYKBnBvc3RJZBgBIAEoBVIGcG9zdElk');
@$core.Deprecated('Use getSavedThreadsReqDescriptor instead')
const GetSavedThreadsReq$json = const {
  '1': 'GetSavedThreadsReq',
  '2': const [
    const {'1': 'cursor', '3': 1, '4': 1, '5': 5, '10': 'cursor'},
    const {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetSavedThreadsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSavedThreadsReqDescriptor = $convert.base64Decode('ChJHZXRTYXZlZFRocmVhZHNSZXESFgoGY3Vyc29yGAEgASgFUgZjdXJzb3ISFAoFY291bnQYAiABKAVSBWNvdW50');
@$core.Deprecated('Use getSavedPostsReqDescriptor instead')
const GetSavedPostsReq$json = const {
  '1': 'GetSavedPostsReq',
  '2': const [
    const {'1': 'cursor', '3': 1, '4': 1, '5': 5, '10': 'cursor'},
    const {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetSavedPostsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSavedPostsReqDescriptor = $convert.base64Decode('ChBHZXRTYXZlZFBvc3RzUmVxEhYKBmN1cnNvchgBIAEoBVIGY3Vyc29yEhQKBWNvdW50GAIgASgFUgVjb3VudA==');
