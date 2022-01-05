///
//  Generated code. Do not modify.
//  source: group.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createGroupReqDescriptor instead')
const CreateGroupReq$json = const {
  '1': 'CreateGroupReq',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `CreateGroupReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGroupReqDescriptor = $convert.base64Decode('Cg5DcmVhdGVHcm91cFJlcRIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YAiABKAlSC2Rlc2NyaXB0aW9u');
@$core.Deprecated('Use createGroupRespDescriptor instead')
const CreateGroupResp$json = const {
  '1': 'CreateGroupResp',
  '2': const [
    const {'1': 'groupId', '3': 1, '4': 1, '5': 5, '10': 'groupId'},
  ],
};

/// Descriptor for `CreateGroupResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGroupRespDescriptor = $convert.base64Decode('Cg9DcmVhdGVHcm91cFJlc3ASGAoHZ3JvdXBJZBgBIAEoBVIHZ3JvdXBJZA==');
@$core.Deprecated('Use groupIdMsgDescriptor instead')
const GroupIdMsg$json = const {
  '1': 'GroupIdMsg',
  '2': const [
    const {'1': 'groupId', '3': 1, '4': 1, '5': 5, '10': 'groupId'},
  ],
};

/// Descriptor for `GroupIdMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupIdMsgDescriptor = $convert.base64Decode('CgpHcm91cElkTXNnEhgKB2dyb3VwSWQYASABKAVSB2dyb3VwSWQ=');
@$core.Deprecated('Use membershipMsgDescriptor instead')
const MembershipMsg$json = const {
  '1': 'MembershipMsg',
  '2': const [
    const {'1': 'groupId', '3': 1, '4': 1, '5': 5, '10': 'groupId'},
    const {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `MembershipMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List membershipMsgDescriptor = $convert.base64Decode('Cg1NZW1iZXJzaGlwTXNnEhgKB2dyb3VwSWQYASABKAVSB2dyb3VwSWQSEAoDdWlkGAIgASgJUgN1aWQ=');
@$core.Deprecated('Use getGroupsReqDescriptor instead')
const GetGroupsReq$json = const {
  '1': 'GetGroupsReq',
  '2': const [
    const {'1': 'pageNo', '3': 1, '4': 1, '5': 5, '10': 'pageNo'},
    const {'1': 'pageSize', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
  ],
};

/// Descriptor for `GetGroupsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGroupsReqDescriptor = $convert.base64Decode('CgxHZXRHcm91cHNSZXESFgoGcGFnZU5vGAEgASgFUgZwYWdlTm8SGgoIcGFnZVNpemUYAiABKAVSCHBhZ2VTaXpl');
@$core.Deprecated('Use getGroupsRespDescriptor instead')
const GetGroupsResp$json = const {
  '1': 'GetGroupsResp',
  '2': const [
    const {'1': 'groups', '3': 1, '4': 3, '5': 11, '6': '.xdea.xmux.forum.Group', '10': 'groups'},
  ],
};

/// Descriptor for `GetGroupsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGroupsRespDescriptor = $convert.base64Decode('Cg1HZXRHcm91cHNSZXNwEi4KBmdyb3VwcxgBIAMoCzIWLnhkZWEueG11eC5mb3J1bS5Hcm91cFIGZ3JvdXBz');
@$core.Deprecated('Use groupDescriptor instead')
const Group$json = const {
  '1': 'Group',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'creatorUid', '3': 2, '4': 1, '5': 9, '10': 'creatorUid'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'createTime', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createTime'},
  ],
};

/// Descriptor for `Group`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupDescriptor = $convert.base64Decode('CgVHcm91cBIOCgJpZBgBIAEoBVICaWQSHgoKY3JlYXRvclVpZBgCIAEoCVIKY3JlYXRvclVpZBIUCgV0aXRsZRgDIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2NyaXB0aW9uEjoKCmNyZWF0ZVRpbWUYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgpjcmVhdGVUaW1l');
