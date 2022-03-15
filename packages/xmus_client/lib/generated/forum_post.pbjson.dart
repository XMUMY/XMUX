///
//  Generated code. Do not modify.
//  source: forum_post.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createPostReqDescriptor instead')
const CreatePostReq$json = const {
  '1': 'CreatePostReq',
  '2': const [
    const {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
    const {'1': 'parentId', '3': 2, '4': 1, '5': 5, '10': 'parentId'},
    const {'1': 'refPostId', '3': 3, '4': 1, '5': 5, '10': 'refPostId'},
    const {'1': 'refPostUid', '3': 4, '4': 1, '5': 9, '10': 'refPostUid'},
    const {'1': 'content', '3': 5, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `CreatePostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPostReqDescriptor = $convert.base64Decode('Cg1DcmVhdGVQb3N0UmVxEhoKCHRocmVhZElkGAEgASgFUgh0aHJlYWRJZBIaCghwYXJlbnRJZBgCIAEoBVIIcGFyZW50SWQSHAoJcmVmUG9zdElkGAMgASgFUglyZWZQb3N0SWQSHgoKcmVmUG9zdFVpZBgEIAEoCVIKcmVmUG9zdFVpZBIYCgdjb250ZW50GAUgASgJUgdjb250ZW50');
@$core.Deprecated('Use createPostRespDescriptor instead')
const CreatePostResp$json = const {
  '1': 'CreatePostResp',
  '2': const [
    const {'1': 'postId', '3': 1, '4': 1, '5': 5, '10': 'postId'},
  ],
};

/// Descriptor for `CreatePostResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPostRespDescriptor = $convert.base64Decode('Cg5DcmVhdGVQb3N0UmVzcBIWCgZwb3N0SWQYASABKAVSBnBvc3RJZA==');
@$core.Deprecated('Use removePostReqDescriptor instead')
const RemovePostReq$json = const {
  '1': 'RemovePostReq',
  '2': const [
    const {'1': 'postId', '3': 1, '4': 1, '5': 5, '10': 'postId'},
  ],
};

/// Descriptor for `RemovePostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removePostReqDescriptor = $convert.base64Decode('Cg1SZW1vdmVQb3N0UmVxEhYKBnBvc3RJZBgBIAEoBVIGcG9zdElk');
@$core.Deprecated('Use getPostsReqDescriptor instead')
const GetPostsReq$json = const {
  '1': 'GetPostsReq',
  '2': const [
    const {'1': 'threadId', '3': 1, '4': 1, '5': 5, '10': 'threadId'},
    const {'1': 'ordering', '3': 2, '4': 1, '5': 14, '6': '.xmux.forum.v4.Ordering', '10': 'ordering'},
    const {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
    const {'1': 'count', '3': 4, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetPostsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsReqDescriptor = $convert.base64Decode('CgtHZXRQb3N0c1JlcRIaCgh0aHJlYWRJZBgBIAEoBVIIdGhyZWFkSWQSMwoIb3JkZXJpbmcYAiABKA4yFy54bXV4LmZvcnVtLnY0Lk9yZGVyaW5nUghvcmRlcmluZxIWCgZvZmZzZXQYAyABKAVSBm9mZnNldBIUCgVjb3VudBgEIAEoBVIFY291bnQ=');
@$core.Deprecated('Use getPostsByUidReqDescriptor instead')
const GetPostsByUidReq$json = const {
  '1': 'GetPostsByUidReq',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'ordering', '3': 2, '4': 1, '5': 14, '6': '.xmux.forum.v4.Ordering', '10': 'ordering'},
    const {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
    const {'1': 'count', '3': 4, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetPostsByUidReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsByUidReqDescriptor = $convert.base64Decode('ChBHZXRQb3N0c0J5VWlkUmVxEhAKA3VpZBgBIAEoCVIDdWlkEjMKCG9yZGVyaW5nGAIgASgOMhcueG11eC5mb3J1bS52NC5PcmRlcmluZ1IIb3JkZXJpbmcSFgoGb2Zmc2V0GAMgASgFUgZvZmZzZXQSFAoFY291bnQYBCABKAVSBWNvdW50');
@$core.Deprecated('Use getPostsByParentReqDescriptor instead')
const GetPostsByParentReq$json = const {
  '1': 'GetPostsByParentReq',
  '2': const [
    const {'1': 'parentId', '3': 1, '4': 1, '5': 5, '10': 'parentId'},
    const {'1': 'ordering', '3': 2, '4': 1, '5': 14, '6': '.xmux.forum.v4.Ordering', '10': 'ordering'},
    const {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
    const {'1': 'count', '3': 4, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetPostsByParentReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsByParentReqDescriptor = $convert.base64Decode('ChNHZXRQb3N0c0J5UGFyZW50UmVxEhoKCHBhcmVudElkGAEgASgFUghwYXJlbnRJZBIzCghvcmRlcmluZxgCIAEoDjIXLnhtdXguZm9ydW0udjQuT3JkZXJpbmdSCG9yZGVyaW5nEhYKBm9mZnNldBgDIAEoBVIGb2Zmc2V0EhQKBWNvdW50GAQgASgFUgVjb3VudA==');
@$core.Deprecated('Use getPostsRespDescriptor instead')
const GetPostsResp$json = const {
  '1': 'GetPostsResp',
  '2': const [
    const {'1': 'posts', '3': 1, '4': 3, '5': 11, '6': '.xmux.forum.v4.Post', '10': 'posts'},
  ],
};

/// Descriptor for `GetPostsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsRespDescriptor = $convert.base64Decode('CgxHZXRQb3N0c1Jlc3ASKQoFcG9zdHMYASADKAsyEy54bXV4LmZvcnVtLnY0LlBvc3RSBXBvc3Rz');
@$core.Deprecated('Use postDescriptor instead')
const Post$json = const {
  '1': 'Post',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'threadId', '3': 3, '4': 1, '5': 5, '10': 'threadId'},
    const {'1': 'parentId', '3': 4, '4': 1, '5': 5, '10': 'parentId'},
    const {'1': 'refPostId', '3': 5, '4': 1, '5': 5, '10': 'refPostId'},
    const {'1': 'refPostUid', '3': 6, '4': 1, '5': 9, '10': 'refPostUid'},
    const {'1': 'content', '3': 7, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'likes', '3': 8, '4': 1, '5': 5, '10': 'likes'},
    const {'1': 'pinned', '3': 9, '4': 1, '5': 8, '10': 'pinned'},
    const {'1': 'createAt', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createAt'},
    const {'1': 'liked', '3': 11, '4': 1, '5': 5, '10': 'liked'},
    const {'1': 'saved', '3': 12, '4': 1, '5': 8, '10': 'saved'},
  ],
};

/// Descriptor for `Post`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postDescriptor = $convert.base64Decode('CgRQb3N0Eg4KAmlkGAEgASgFUgJpZBIQCgN1aWQYAiABKAlSA3VpZBIaCgh0aHJlYWRJZBgDIAEoBVIIdGhyZWFkSWQSGgoIcGFyZW50SWQYBCABKAVSCHBhcmVudElkEhwKCXJlZlBvc3RJZBgFIAEoBVIJcmVmUG9zdElkEh4KCnJlZlBvc3RVaWQYBiABKAlSCnJlZlBvc3RVaWQSGAoHY29udGVudBgHIAEoCVIHY29udGVudBIUCgVsaWtlcxgIIAEoBVIFbGlrZXMSFgoGcGlubmVkGAkgASgIUgZwaW5uZWQSNgoIY3JlYXRlQXQYCiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUghjcmVhdGVBdBIUCgVsaWtlZBgLIAEoBVIFbGlrZWQSFAoFc2F2ZWQYDCABKAhSBXNhdmVk');
@$core.Deprecated('Use likePostReqDescriptor instead')
const LikePostReq$json = const {
  '1': 'LikePostReq',
  '2': const [
    const {'1': 'postId', '3': 1, '4': 1, '5': 5, '10': 'postId'},
    const {'1': 'like', '3': 2, '4': 1, '5': 5, '10': 'like'},
  ],
};

/// Descriptor for `LikePostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likePostReqDescriptor = $convert.base64Decode('CgtMaWtlUG9zdFJlcRIWCgZwb3N0SWQYASABKAVSBnBvc3RJZBISCgRsaWtlGAIgASgFUgRsaWtl');
@$core.Deprecated('Use pinPostReqDescriptor instead')
const PinPostReq$json = const {
  '1': 'PinPostReq',
  '2': const [
    const {'1': 'postId', '3': 1, '4': 1, '5': 5, '10': 'postId'},
    const {'1': 'pinned', '3': 2, '4': 1, '5': 8, '10': 'pinned'},
  ],
};

/// Descriptor for `PinPostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pinPostReqDescriptor = $convert.base64Decode('CgpQaW5Qb3N0UmVxEhYKBnBvc3RJZBgBIAEoBVIGcG9zdElkEhYKBnBpbm5lZBgCIAEoCFIGcGlubmVk');
