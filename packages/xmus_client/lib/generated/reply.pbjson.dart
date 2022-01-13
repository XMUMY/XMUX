///
//  Generated code. Do not modify.
//  source: reply.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use sortingMethodDescriptor instead')
const SortingMethod$json = const {
  '1': 'SortingMethod',
  '2': const [
    const {'1': 'NEWEST', '2': 0},
    const {'1': 'VOTE', '2': 1},
    const {'1': 'OLDEST', '2': 2},
  ],
};

/// Descriptor for `SortingMethod`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sortingMethodDescriptor = $convert.base64Decode('Cg1Tb3J0aW5nTWV0aG9kEgoKBk5FV0VTVBAAEggKBFZPVEUQARIKCgZPTERFU1QQAg==');
@$core.Deprecated('Use createReplyReqDescriptor instead')
const CreateReplyReq$json = const {
  '1': 'CreateReplyReq',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'refReplyId', '3': 3, '4': 1, '5': 5, '10': 'refReplyId'},
    const {'1': 'refPostId', '3': 4, '4': 1, '5': 5, '10': 'refPostId'},
  ],
};

/// Descriptor for `CreateReplyReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReplyReqDescriptor = $convert.base64Decode('Cg5DcmVhdGVSZXBseVJlcRIYCgdjb250ZW50GAEgASgJUgdjb250ZW50Eh4KCnJlZlJlcGx5SWQYAyABKAVSCnJlZlJlcGx5SWQSHAoJcmVmUG9zdElkGAQgASgFUglyZWZQb3N0SWQ=');
@$core.Deprecated('Use createReplyRespDescriptor instead')
const CreateReplyResp$json = const {
  '1': 'CreateReplyResp',
  '2': const [
    const {'1': 'replyId', '3': 1, '4': 1, '5': 5, '10': 'replyId'},
  ],
};

/// Descriptor for `CreateReplyResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReplyRespDescriptor = $convert.base64Decode('Cg9DcmVhdGVSZXBseVJlc3ASGAoHcmVwbHlJZBgBIAEoBVIHcmVwbHlJZA==');
@$core.Deprecated('Use getReplyReqDescriptor instead')
const GetReplyReq$json = const {
  '1': 'GetReplyReq',
  '2': const [
    const {'1': 'pageNo', '3': 1, '4': 1, '5': 5, '10': 'pageNo'},
    const {'1': 'pageSize', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
    const {'1': 'refPostId', '3': 3, '4': 1, '5': 5, '10': 'refPostId'},
    const {'1': 'sort', '3': 4, '4': 1, '5': 14, '6': '.xdea.xmux.forum.SortingMethod', '10': 'sort'},
  ],
};

/// Descriptor for `GetReplyReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getReplyReqDescriptor = $convert.base64Decode('CgtHZXRSZXBseVJlcRIWCgZwYWdlTm8YASABKAVSBnBhZ2VObxIaCghwYWdlU2l6ZRgCIAEoBVIIcGFnZVNpemUSHAoJcmVmUG9zdElkGAMgASgFUglyZWZQb3N0SWQSMgoEc29ydBgEIAEoDjIeLnhkZWEueG11eC5mb3J1bS5Tb3J0aW5nTWV0aG9kUgRzb3J0');
@$core.Deprecated('Use getReplyByIdReqDescriptor instead')
const GetReplyByIdReq$json = const {
  '1': 'GetReplyByIdReq',
  '2': const [
    const {'1': 'replyId', '3': 1, '4': 1, '5': 5, '10': 'replyId'},
  ],
};

/// Descriptor for `GetReplyByIdReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getReplyByIdReqDescriptor = $convert.base64Decode('Cg9HZXRSZXBseUJ5SWRSZXESGAoHcmVwbHlJZBgBIAEoBVIHcmVwbHlJZA==');
@$core.Deprecated('Use getReplyRespDescriptor instead')
const GetReplyResp$json = const {
  '1': 'GetReplyResp',
  '2': const [
    const {'1': 'replies', '3': 1, '4': 3, '5': 11, '6': '.xdea.xmux.forum.Reply', '10': 'replies'},
  ],
};

/// Descriptor for `GetReplyResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getReplyRespDescriptor = $convert.base64Decode('CgxHZXRSZXBseVJlc3ASMAoHcmVwbGllcxgBIAMoCzIWLnhkZWEueG11eC5mb3J1bS5SZXBseVIHcmVwbGllcw==');
@$core.Deprecated('Use updateReplyReqDescriptor instead')
const UpdateReplyReq$json = const {
  '1': 'UpdateReplyReq',
  '2': const [
    const {'1': 'replyId', '3': 1, '4': 1, '5': 5, '10': 'replyId'},
  ],
};

/// Descriptor for `UpdateReplyReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateReplyReqDescriptor = $convert.base64Decode('Cg5VcGRhdGVSZXBseVJlcRIYCgdyZXBseUlkGAEgASgFUgdyZXBseUlk');
@$core.Deprecated('Use replyDescriptor instead')
const Reply$json = const {
  '1': 'Reply',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'vote', '3': 3, '4': 1, '5': 5, '10': 'vote'},
    const {'1': 'uid', '3': 4, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'topped', '3': 5, '4': 1, '5': 8, '10': 'topped'},
    const {'1': 'createTime', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createTime'},
    const {'1': 'refReplyId', '3': 7, '4': 1, '5': 5, '10': 'refReplyId'},
    const {'1': 'refUid', '3': 8, '4': 1, '5': 9, '10': 'refUid'},
  ],
};

/// Descriptor for `Reply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyDescriptor = $convert.base64Decode('CgVSZXBseRIOCgJpZBgBIAEoBVICaWQSGAoHY29udGVudBgCIAEoCVIHY29udGVudBISCgR2b3RlGAMgASgFUgR2b3RlEhAKA3VpZBgEIAEoCVIDdWlkEhYKBnRvcHBlZBgFIAEoCFIGdG9wcGVkEjoKCmNyZWF0ZVRpbWUYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgpjcmVhdGVUaW1lEh4KCnJlZlJlcGx5SWQYByABKAVSCnJlZlJlcGx5SWQSFgoGcmVmVWlkGAggASgJUgZyZWZVaWQ=');
