// This is a generated file - do not edit.
//
// Generated from forum_post.proto.

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

@$core.Deprecated('Use createPostReqDescriptor instead')
const CreatePostReq$json = {
  '1': 'CreatePostReq',
  '2': [
    {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
    {'1': 'parentId', '3': 2, '4': 1, '5': 5, '10': 'parentId'},
    {'1': 'refPostId', '3': 3, '4': 1, '5': 5, '10': 'refPostId'},
    {'1': 'refPostUid', '3': 4, '4': 1, '5': 9, '10': 'refPostUid'},
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
    {'1': 'content'},
  ],
};

/// Descriptor for `CreatePostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPostReqDescriptor = $convert.base64Decode(
    'Cg1DcmVhdGVQb3N0UmVxEhoKCHRocmVhZElkGAEgASgFUgh0aHJlYWRJZBIaCghwYXJlbnRJZB'
    'gCIAEoBVIIcGFyZW50SWQSHAoJcmVmUG9zdElkGAMgASgFUglyZWZQb3N0SWQSHgoKcmVmUG9z'
    'dFVpZBgEIAEoCVIKcmVmUG9zdFVpZBJBCgxwbGFpbkNvbnRlbnQYHiABKAsyGy54bXV4LmZvcn'
    'VtLnY0LlBsYWluQ29udGVudEgAUgxwbGFpbkNvbnRlbnQSSgoPbWFya2Rvd25Db250ZW50GB8g'
    'ASgLMh4ueG11eC5mb3J1bS52NC5NYXJrZG93bkNvbnRlbnRIAFIPbWFya2Rvd25Db250ZW50Qg'
    'kKB2NvbnRlbnQ=');

@$core.Deprecated('Use createPostRespDescriptor instead')
const CreatePostResp$json = {
  '1': 'CreatePostResp',
  '2': [
    {'1': 'postId', '3': 1, '4': 1, '5': 5, '10': 'postId'},
  ],
};

/// Descriptor for `CreatePostResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPostRespDescriptor = $convert
    .base64Decode('Cg5DcmVhdGVQb3N0UmVzcBIWCgZwb3N0SWQYASABKAVSBnBvc3RJZA==');

@$core.Deprecated('Use removePostReqDescriptor instead')
const RemovePostReq$json = {
  '1': 'RemovePostReq',
  '2': [
    {'1': 'postId', '3': 1, '4': 1, '5': 5, '10': 'postId'},
  ],
};

/// Descriptor for `RemovePostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removePostReqDescriptor = $convert
    .base64Decode('Cg1SZW1vdmVQb3N0UmVxEhYKBnBvc3RJZBgBIAEoBVIGcG9zdElk');

@$core.Deprecated('Use getPostsReqDescriptor instead')
const GetPostsReq$json = {
  '1': 'GetPostsReq',
  '2': [
    {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
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

/// Descriptor for `GetPostsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsReqDescriptor = $convert.base64Decode(
    'CgtHZXRQb3N0c1JlcRIaCgh0aHJlYWRJZBgBIAEoBVIIdGhyZWFkSWQSMwoIb3JkZXJpbmcYAi'
    'ABKA4yFy54bXV4LmZvcnVtLnY0Lk9yZGVyaW5nUghvcmRlcmluZxIWCgZvZmZzZXQYAyABKAVS'
    'Bm9mZnNldBIUCgVjb3VudBgEIAEoBVIFY291bnQ=');

@$core.Deprecated('Use getPostsByUidReqDescriptor instead')
const GetPostsByUidReq$json = {
  '1': 'GetPostsByUidReq',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
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

/// Descriptor for `GetPostsByUidReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsByUidReqDescriptor = $convert.base64Decode(
    'ChBHZXRQb3N0c0J5VWlkUmVxEhAKA3VpZBgBIAEoCVIDdWlkEjMKCG9yZGVyaW5nGAIgASgOMh'
    'cueG11eC5mb3J1bS52NC5PcmRlcmluZ1IIb3JkZXJpbmcSFgoGb2Zmc2V0GAMgASgFUgZvZmZz'
    'ZXQSFAoFY291bnQYBCABKAVSBWNvdW50');

@$core.Deprecated('Use getPostsByParentReqDescriptor instead')
const GetPostsByParentReq$json = {
  '1': 'GetPostsByParentReq',
  '2': [
    {'1': 'parentId', '3': 1, '4': 1, '5': 5, '10': 'parentId'},
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

/// Descriptor for `GetPostsByParentReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsByParentReqDescriptor = $convert.base64Decode(
    'ChNHZXRQb3N0c0J5UGFyZW50UmVxEhoKCHBhcmVudElkGAEgASgFUghwYXJlbnRJZBIzCghvcm'
    'RlcmluZxgCIAEoDjIXLnhtdXguZm9ydW0udjQuT3JkZXJpbmdSCG9yZGVyaW5nEhYKBm9mZnNl'
    'dBgDIAEoBVIGb2Zmc2V0EhQKBWNvdW50GAQgASgFUgVjb3VudA==');

@$core.Deprecated('Use getPostsRespDescriptor instead')
const GetPostsResp$json = {
  '1': 'GetPostsResp',
  '2': [
    {
      '1': 'posts',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.xmux.forum.v4.Post',
      '10': 'posts'
    },
  ],
};

/// Descriptor for `GetPostsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsRespDescriptor = $convert.base64Decode(
    'CgxHZXRQb3N0c1Jlc3ASKQoFcG9zdHMYASADKAsyEy54bXV4LmZvcnVtLnY0LlBvc3RSBXBvc3'
    'Rz');

@$core.Deprecated('Use postDescriptor instead')
const Post$json = {
  '1': 'Post',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'threadId', '3': 3, '4': 1, '5': 5, '10': 'threadId'},
    {'1': 'parentId', '3': 4, '4': 1, '5': 5, '10': 'parentId'},
    {'1': 'refPostId', '3': 5, '4': 1, '5': 5, '10': 'refPostId'},
    {'1': 'refPostUid', '3': 6, '4': 1, '5': 9, '10': 'refPostUid'},
    {'1': 'likes', '3': 7, '4': 1, '5': 5, '10': 'likes'},
    {'1': 'pinned', '3': 8, '4': 1, '5': 8, '10': 'pinned'},
    {
      '1': 'createAt',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createAt'
    },
    {'1': 'liked', '3': 10, '4': 1, '5': 5, '10': 'liked'},
    {'1': 'saved', '3': 11, '4': 1, '5': 8, '10': 'saved'},
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
    {'1': 'content'},
  ],
};

/// Descriptor for `Post`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postDescriptor = $convert.base64Decode(
    'CgRQb3N0Eg4KAmlkGAEgASgFUgJpZBIQCgN1aWQYAiABKAlSA3VpZBIaCgh0aHJlYWRJZBgDIA'
    'EoBVIIdGhyZWFkSWQSGgoIcGFyZW50SWQYBCABKAVSCHBhcmVudElkEhwKCXJlZlBvc3RJZBgF'
    'IAEoBVIJcmVmUG9zdElkEh4KCnJlZlBvc3RVaWQYBiABKAlSCnJlZlBvc3RVaWQSFAoFbGlrZX'
    'MYByABKAVSBWxpa2VzEhYKBnBpbm5lZBgIIAEoCFIGcGlubmVkEjYKCGNyZWF0ZUF0GAkgASgL'
    'MhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIIY3JlYXRlQXQSFAoFbGlrZWQYCiABKAVSBW'
    'xpa2VkEhQKBXNhdmVkGAsgASgIUgVzYXZlZBJBCgxwbGFpbkNvbnRlbnQYHiABKAsyGy54bXV4'
    'LmZvcnVtLnY0LlBsYWluQ29udGVudEgAUgxwbGFpbkNvbnRlbnQSSgoPbWFya2Rvd25Db250ZW'
    '50GB8gASgLMh4ueG11eC5mb3J1bS52NC5NYXJrZG93bkNvbnRlbnRIAFIPbWFya2Rvd25Db250'
    'ZW50QgkKB2NvbnRlbnQ=');

@$core.Deprecated('Use likePostReqDescriptor instead')
const LikePostReq$json = {
  '1': 'LikePostReq',
  '2': [
    {'1': 'postId', '3': 1, '4': 1, '5': 5, '10': 'postId'},
    {'1': 'like', '3': 2, '4': 1, '5': 5, '10': 'like'},
  ],
};

/// Descriptor for `LikePostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likePostReqDescriptor = $convert.base64Decode(
    'CgtMaWtlUG9zdFJlcRIWCgZwb3N0SWQYASABKAVSBnBvc3RJZBISCgRsaWtlGAIgASgFUgRsaW'
    'tl');

@$core.Deprecated('Use pinPostReqDescriptor instead')
const PinPostReq$json = {
  '1': 'PinPostReq',
  '2': [
    {'1': 'postId', '3': 1, '4': 1, '5': 5, '10': 'postId'},
    {'1': 'pinned', '3': 2, '4': 1, '5': 8, '10': 'pinned'},
  ],
};

/// Descriptor for `PinPostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pinPostReqDescriptor = $convert.base64Decode(
    'CgpQaW5Qb3N0UmVxEhYKBnBvc3RJZBgBIAEoBVIGcG9zdElkEhYKBnBpbm5lZBgCIAEoCFIGcG'
    'lubmVk');
