// This is a generated file - do not edit.
//
// Generated from forum_saved.proto.

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

@$core.Deprecated('Use saveThreadReqDescriptor instead')
const SaveThreadReq$json = {
  '1': 'SaveThreadReq',
  '2': [
    {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
  ],
};

/// Descriptor for `SaveThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveThreadReqDescriptor = $convert.base64Decode(
    'Cg1TYXZlVGhyZWFkUmVxEhoKCHRocmVhZElkGAEgASgFUgh0aHJlYWRJZA==');

@$core.Deprecated('Use unsaveThreadReqDescriptor instead')
const UnsaveThreadReq$json = {
  '1': 'UnsaveThreadReq',
  '2': [
    {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
  ],
};

/// Descriptor for `UnsaveThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unsaveThreadReqDescriptor = $convert.base64Decode(
    'Cg9VbnNhdmVUaHJlYWRSZXESGgoIdGhyZWFkSWQYASABKAVSCHRocmVhZElk');

@$core.Deprecated('Use savePostReqDescriptor instead')
const SavePostReq$json = {
  '1': 'SavePostReq',
  '2': [
    {'1': 'postId', '3': 1, '4': 1, '5': 5, '10': 'postId'},
  ],
};

/// Descriptor for `SavePostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List savePostReqDescriptor = $convert
    .base64Decode('CgtTYXZlUG9zdFJlcRIWCgZwb3N0SWQYASABKAVSBnBvc3RJZA==');

@$core.Deprecated('Use unsavePostReqDescriptor instead')
const UnsavePostReq$json = {
  '1': 'UnsavePostReq',
  '2': [
    {'1': 'postId', '3': 1, '4': 1, '5': 5, '10': 'postId'},
  ],
};

/// Descriptor for `UnsavePostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unsavePostReqDescriptor = $convert
    .base64Decode('Cg1VbnNhdmVQb3N0UmVxEhYKBnBvc3RJZBgBIAEoBVIGcG9zdElk');

@$core.Deprecated('Use getSavedThreadsReqDescriptor instead')
const GetSavedThreadsReq$json = {
  '1': 'GetSavedThreadsReq',
  '2': [
    {'1': 'offset', '3': 1, '4': 1, '5': 5, '10': 'offset'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetSavedThreadsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSavedThreadsReqDescriptor = $convert.base64Decode(
    'ChJHZXRTYXZlZFRocmVhZHNSZXESFgoGb2Zmc2V0GAEgASgFUgZvZmZzZXQSFAoFY291bnQYAi'
    'ABKAVSBWNvdW50');

@$core.Deprecated('Use getSavedPostsReqDescriptor instead')
const GetSavedPostsReq$json = {
  '1': 'GetSavedPostsReq',
  '2': [
    {'1': 'offset', '3': 1, '4': 1, '5': 5, '10': 'offset'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetSavedPostsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSavedPostsReqDescriptor = $convert.base64Decode(
    'ChBHZXRTYXZlZFBvc3RzUmVxEhYKBm9mZnNldBgBIAEoBVIGb2Zmc2V0EhQKBWNvdW50GAIgAS'
    'gFUgVjb3VudA==');
