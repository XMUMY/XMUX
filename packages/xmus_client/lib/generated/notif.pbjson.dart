///
//  Generated code. Do not modify.
//  source: notif.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use notifTypeDescriptor instead')
const NotifType$json = const {
  '1': 'NotifType',
  '2': const [
    const {'1': 'POST_REPLY', '2': 0},
    const {'1': 'REPLY_REPLY', '2': 1},
  ],
};

/// Descriptor for `NotifType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List notifTypeDescriptor = $convert.base64Decode('CglOb3RpZlR5cGUSDgoKUE9TVF9SRVBMWRAAEg8KC1JFUExZX1JFUExZEAE=');
@$core.Deprecated('Use notifMarkAsReadReqDescriptor instead')
const NotifMarkAsReadReq$json = const {
  '1': 'NotifMarkAsReadReq',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 5, '10': 'ids'},
  ],
};

/// Descriptor for `NotifMarkAsReadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notifMarkAsReadReqDescriptor = $convert.base64Decode('ChJOb3RpZk1hcmtBc1JlYWRSZXESEAoDaWRzGAEgAygFUgNpZHM=');
@$core.Deprecated('Use getNotifNumRespDescriptor instead')
const GetNotifNumResp$json = const {
  '1': 'GetNotifNumResp',
  '2': const [
    const {'1': 'num', '3': 1, '4': 1, '5': 5, '10': 'num'},
  ],
};

/// Descriptor for `GetNotifNumResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotifNumRespDescriptor = $convert.base64Decode('Cg9HZXROb3RpZk51bVJlc3ASEAoDbnVtGAEgASgFUgNudW0=');
@$core.Deprecated('Use getNotifReqDescriptor instead')
const GetNotifReq$json = const {
  '1': 'GetNotifReq',
  '2': const [
    const {'1': 'pageNo', '3': 1, '4': 1, '5': 5, '10': 'pageNo'},
    const {'1': 'pageSize', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
  ],
};

/// Descriptor for `GetNotifReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotifReqDescriptor = $convert.base64Decode('CgtHZXROb3RpZlJlcRIWCgZwYWdlTm8YASABKAVSBnBhZ2VObxIaCghwYWdlU2l6ZRgCIAEoBVIIcGFnZVNpemU=');
@$core.Deprecated('Use getNotifRespDescriptor instead')
const GetNotifResp$json = const {
  '1': 'GetNotifResp',
  '2': const [
    const {'1': 'notifs', '3': 1, '4': 3, '5': 11, '6': '.xmux.forum.v4.Notif', '10': 'notifs'},
  ],
};

/// Descriptor for `GetNotifResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotifRespDescriptor = $convert.base64Decode('CgxHZXROb3RpZlJlc3ASLAoGbm90aWZzGAEgAygLMhQueG11eC5mb3J1bS52NC5Ob3RpZlIGbm90aWZz');
@$core.Deprecated('Use notifDescriptor instead')
const Notif$json = const {
  '1': 'Notif',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.xmux.forum.v4.NotifType', '10': 'type'},
    const {'1': 'refId', '3': 3, '4': 1, '5': 5, '10': 'refId'},
    const {'1': 'objId', '3': 4, '4': 1, '5': 5, '10': 'objId'},
    const {'1': 'refContent', '3': 5, '4': 1, '5': 9, '10': 'refContent'},
    const {'1': 'objContent', '3': 6, '4': 1, '5': 9, '10': 'objContent'},
    const {'1': 'hasRead', '3': 7, '4': 1, '5': 8, '10': 'hasRead'},
    const {'1': 'createTime', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createTime'},
  ],
};

/// Descriptor for `Notif`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notifDescriptor = $convert.base64Decode('CgVOb3RpZhIOCgJpZBgBIAEoBVICaWQSLAoEdHlwZRgCIAEoDjIYLnhtdXguZm9ydW0udjQuTm90aWZUeXBlUgR0eXBlEhQKBXJlZklkGAMgASgFUgVyZWZJZBIUCgVvYmpJZBgEIAEoBVIFb2JqSWQSHgoKcmVmQ29udGVudBgFIAEoCVIKcmVmQ29udGVudBIeCgpvYmpDb250ZW50GAYgASgJUgpvYmpDb250ZW50EhgKB2hhc1JlYWQYByABKAhSB2hhc1JlYWQSOgoKY3JlYXRlVGltZRgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCmNyZWF0ZVRpbWU=');
