///
//  Generated code. Do not modify.
//  source: chat/v1/chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use textMsgDescriptor instead')
const TextMsg$json = const {
  '1': 'TextMsg',
  '2': const [
    const {'1': 'from', '3': 1, '4': 1, '5': 9, '10': 'from'},
    const {'1': 'to', '3': 2, '4': 1, '5': 9, '10': 'to'},
    const {'1': 'msg', '3': 3, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `TextMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textMsgDescriptor = $convert.base64Decode('CgdUZXh0TXNnEhIKBGZyb20YASABKAlSBGZyb20SDgoCdG8YAiABKAlSAnRvEhAKA21zZxgDIAEoCVIDbXNn');
@$core.Deprecated('Use chatReqDescriptor instead')
const ChatReq$json = const {
  '1': 'ChatReq',
  '2': const [
    const {'1': 'heartbeat', '3': 1, '4': 1, '5': 11, '6': '.xmux.chat.v1.Heartbeat', '9': 0, '10': 'heartbeat'},
    const {'1': 'getOnlineUserReq', '3': 2, '4': 1, '5': 11, '6': '.xmux.chat.v1.GetOnlineUsersReq', '9': 0, '10': 'getOnlineUserReq'},
    const {'1': 'textMsg', '3': 3, '4': 1, '5': 11, '6': '.xmux.chat.v1.TextMsg', '9': 0, '10': 'textMsg'},
  ],
  '8': const [
    const {'1': 'req'},
  ],
};

/// Descriptor for `ChatReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatReqDescriptor = $convert.base64Decode('CgdDaGF0UmVxEjcKCWhlYXJ0YmVhdBgBIAEoCzIXLnhtdXguY2hhdC52MS5IZWFydGJlYXRIAFIJaGVhcnRiZWF0Ek0KEGdldE9ubGluZVVzZXJSZXEYAiABKAsyHy54bXV4LmNoYXQudjEuR2V0T25saW5lVXNlcnNSZXFIAFIQZ2V0T25saW5lVXNlclJlcRIxCgd0ZXh0TXNnGAMgASgLMhUueG11eC5jaGF0LnYxLlRleHRNc2dIAFIHdGV4dE1zZ0IFCgNyZXE=');
@$core.Deprecated('Use heartbeatDescriptor instead')
const Heartbeat$json = const {
  '1': 'Heartbeat',
};

/// Descriptor for `Heartbeat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heartbeatDescriptor = $convert.base64Decode('CglIZWFydGJlYXQ=');
@$core.Deprecated('Use getOnlineUsersReqDescriptor instead')
const GetOnlineUsersReq$json = const {
  '1': 'GetOnlineUsersReq',
};

/// Descriptor for `GetOnlineUsersReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOnlineUsersReqDescriptor = $convert.base64Decode('ChFHZXRPbmxpbmVVc2Vyc1JlcQ==');
@$core.Deprecated('Use chatRespDescriptor instead')
const ChatResp$json = const {
  '1': 'ChatResp',
  '2': const [
    const {'1': 'heartbeat', '3': 1, '4': 1, '5': 11, '6': '.xmux.chat.v1.HeartbeatResp', '9': 0, '10': 'heartbeat'},
    const {'1': 'getOnlineUserResp', '3': 2, '4': 1, '5': 11, '6': '.xmux.chat.v1.GetOnlineUsersResp', '9': 0, '10': 'getOnlineUserResp'},
    const {'1': 'textMsg', '3': 3, '4': 1, '5': 11, '6': '.xmux.chat.v1.TextMsg', '9': 0, '10': 'textMsg'},
  ],
  '8': const [
    const {'1': 'resp'},
  ],
};

/// Descriptor for `ChatResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRespDescriptor = $convert.base64Decode('CghDaGF0UmVzcBI7CgloZWFydGJlYXQYASABKAsyGy54bXV4LmNoYXQudjEuSGVhcnRiZWF0UmVzcEgAUgloZWFydGJlYXQSUAoRZ2V0T25saW5lVXNlclJlc3AYAiABKAsyIC54bXV4LmNoYXQudjEuR2V0T25saW5lVXNlcnNSZXNwSABSEWdldE9ubGluZVVzZXJSZXNwEjEKB3RleHRNc2cYAyABKAsyFS54bXV4LmNoYXQudjEuVGV4dE1zZ0gAUgd0ZXh0TXNnQgYKBHJlc3A=');
@$core.Deprecated('Use heartbeatRespDescriptor instead')
const HeartbeatResp$json = const {
  '1': 'HeartbeatResp',
};

/// Descriptor for `HeartbeatResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heartbeatRespDescriptor = $convert.base64Decode('Cg1IZWFydGJlYXRSZXNw');
@$core.Deprecated('Use getOnlineUsersRespDescriptor instead')
const GetOnlineUsersResp$json = const {
  '1': 'GetOnlineUsersResp',
  '2': const [
    const {'1': 'onlineUsers', '3': 1, '4': 3, '5': 9, '10': 'onlineUsers'},
  ],
};

/// Descriptor for `GetOnlineUsersResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOnlineUsersRespDescriptor = $convert.base64Decode('ChJHZXRPbmxpbmVVc2Vyc1Jlc3ASIAoLb25saW5lVXNlcnMYASADKAlSC29ubGluZVVzZXJz');
