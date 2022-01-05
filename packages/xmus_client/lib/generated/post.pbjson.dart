///
//  Generated code. Do not modify.
//  source: post.proto
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
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'body', '3': 2, '4': 1, '5': 9, '10': 'body'},
    const {'1': 'groupId', '3': 3, '4': 1, '5': 5, '10': 'groupId'},
  ],
};

/// Descriptor for `CreatePostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPostReqDescriptor = $convert.base64Decode('Cg1DcmVhdGVQb3N0UmVxEhQKBXRpdGxlGAEgASgJUgV0aXRsZRISCgRib2R5GAIgASgJUgRib2R5EhgKB2dyb3VwSWQYAyABKAVSB2dyb3VwSWQ=');
@$core.Deprecated('Use createPostRespDescriptor instead')
const CreatePostResp$json = const {
  '1': 'CreatePostResp',
  '2': const [
    const {'1': 'postId', '3': 1, '4': 1, '5': 5, '10': 'postId'},
  ],
};

/// Descriptor for `CreatePostResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPostRespDescriptor = $convert.base64Decode('Cg5DcmVhdGVQb3N0UmVzcBIWCgZwb3N0SWQYASABKAVSBnBvc3RJZA==');
@$core.Deprecated('Use getPostReqDescriptor instead')
const GetPostReq$json = const {
  '1': 'GetPostReq',
  '2': const [
    const {'1': 'pageNo', '3': 1, '4': 1, '5': 5, '10': 'pageNo'},
    const {'1': 'pageSize', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
    const {'1': 'groupIds', '3': 3, '4': 3, '5': 5, '10': 'groupIds'},
  ],
};

/// Descriptor for `GetPostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostReqDescriptor = $convert.base64Decode('CgpHZXRQb3N0UmVxEhYKBnBhZ2VObxgBIAEoBVIGcGFnZU5vEhoKCHBhZ2VTaXplGAIgASgFUghwYWdlU2l6ZRIaCghncm91cElkcxgDIAMoBVIIZ3JvdXBJZHM=');
@$core.Deprecated('Use getPostRespDescriptor instead')
const GetPostResp$json = const {
  '1': 'GetPostResp',
  '2': const [
    const {'1': 'pd', '3': 1, '4': 3, '5': 11, '6': '.xdea.xmux.forum.PostDetails', '10': 'pd'},
  ],
};

/// Descriptor for `GetPostResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostRespDescriptor = $convert.base64Decode('CgtHZXRQb3N0UmVzcBIsCgJwZBgBIAMoCzIcLnhkZWEueG11eC5mb3J1bS5Qb3N0RGV0YWlsc1ICcGQ=');
@$core.Deprecated('Use updatePostReqDescriptor instead')
const UpdatePostReq$json = const {
  '1': 'UpdatePostReq',
  '2': const [
    const {'1': 'postId', '3': 1, '4': 1, '5': 5, '10': 'postId'},
  ],
};

/// Descriptor for `UpdatePostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePostReqDescriptor = $convert.base64Decode('Cg1VcGRhdGVQb3N0UmVxEhYKBnBvc3RJZBgBIAEoBVIGcG9zdElk');
@$core.Deprecated('Use postDetailsDescriptor instead')
const PostDetails$json = const {
  '1': 'PostDetails',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'body', '3': 3, '4': 1, '5': 9, '10': 'body'},
    const {'1': 'vote', '3': 4, '4': 1, '5': 5, '10': 'vote'},
    const {'1': 'createTime', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createTime'},
    const {'1': 'updateTime', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updateTime'},
    const {'1': 'uid', '3': 6, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'groupId', '3': 7, '4': 1, '5': 5, '10': 'groupId'},
    const {'1': 'topped', '3': 8, '4': 1, '5': 8, '10': 'topped'},
    const {'1': 'best', '3': 9, '4': 1, '5': 8, '10': 'best'},
  ],
};

/// Descriptor for `PostDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postDetailsDescriptor = $convert.base64Decode('CgtQb3N0RGV0YWlscxIOCgJpZBgBIAEoBVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEhIKBGJvZHkYAyABKAlSBGJvZHkSEgoEdm90ZRgEIAEoBVIEdm90ZRI6CgpjcmVhdGVUaW1lGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKY3JlYXRlVGltZRI6Cgp1cGRhdGVUaW1lGAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKdXBkYXRlVGltZRIQCgN1aWQYBiABKAlSA3VpZBIYCgdncm91cElkGAcgASgFUgdncm91cElkEhYKBnRvcHBlZBgIIAEoCFIGdG9wcGVkEhIKBGJlc3QYCSABKAhSBGJlc3Q=');
