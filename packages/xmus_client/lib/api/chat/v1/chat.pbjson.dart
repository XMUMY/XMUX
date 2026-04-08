// This is a generated file - do not edit.
//
// Generated from chat/v1/chat.proto.

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

@$core.Deprecated('Use chatReqDescriptor instead')
const ChatReq$json = {
  '1': 'ChatReq',
  '2': [
    {
      '1': 'heartbeat',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.xmux.chat.v1.Heartbeat',
      '9': 0,
      '10': 'heartbeat'
    },
    {
      '1': 'getOnlineUserReq',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.xmux.chat.v1.GetOnlineUsersReq',
      '9': 0,
      '10': 'getOnlineUserReq'
    },
    {
      '1': 'chatMsg',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.xmux.chat.v1.ChatMsg',
      '9': 0,
      '10': 'chatMsg'
    },
  ],
  '8': [
    {'1': 'req'},
  ],
};

/// Descriptor for `ChatReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatReqDescriptor = $convert.base64Decode(
    'CgdDaGF0UmVxEjcKCWhlYXJ0YmVhdBgBIAEoCzIXLnhtdXguY2hhdC52MS5IZWFydGJlYXRIAF'
    'IJaGVhcnRiZWF0Ek0KEGdldE9ubGluZVVzZXJSZXEYAiABKAsyHy54bXV4LmNoYXQudjEuR2V0'
    'T25saW5lVXNlcnNSZXFIAFIQZ2V0T25saW5lVXNlclJlcRIxCgdjaGF0TXNnGAMgASgLMhUueG'
    '11eC5jaGF0LnYxLkNoYXRNc2dIAFIHY2hhdE1zZ0IFCgNyZXE=');

@$core.Deprecated('Use heartbeatDescriptor instead')
const Heartbeat$json = {
  '1': 'Heartbeat',
};

/// Descriptor for `Heartbeat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heartbeatDescriptor =
    $convert.base64Decode('CglIZWFydGJlYXQ=');

@$core.Deprecated('Use getOnlineUsersReqDescriptor instead')
const GetOnlineUsersReq$json = {
  '1': 'GetOnlineUsersReq',
  '2': [
    {'1': 'uids', '3': 1, '4': 3, '5': 9, '10': 'uids'},
  ],
};

/// Descriptor for `GetOnlineUsersReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOnlineUsersReqDescriptor = $convert
    .base64Decode('ChFHZXRPbmxpbmVVc2Vyc1JlcRISCgR1aWRzGAEgAygJUgR1aWRz');

@$core.Deprecated('Use chatRespDescriptor instead')
const ChatResp$json = {
  '1': 'ChatResp',
  '2': [
    {
      '1': 'heartbeat',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.xmux.chat.v1.HeartbeatResp',
      '9': 0,
      '10': 'heartbeat'
    },
    {
      '1': 'getOnlineUserResp',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.xmux.chat.v1.GetOnlineUsersResp',
      '9': 0,
      '10': 'getOnlineUserResp'
    },
    {
      '1': 'chatMsg',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.xmux.chat.v1.ChatMsg',
      '9': 0,
      '10': 'chatMsg'
    },
  ],
  '8': [
    {'1': 'resp'},
  ],
};

/// Descriptor for `ChatResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRespDescriptor = $convert.base64Decode(
    'CghDaGF0UmVzcBI7CgloZWFydGJlYXQYASABKAsyGy54bXV4LmNoYXQudjEuSGVhcnRiZWF0Um'
    'VzcEgAUgloZWFydGJlYXQSUAoRZ2V0T25saW5lVXNlclJlc3AYAiABKAsyIC54bXV4LmNoYXQu'
    'djEuR2V0T25saW5lVXNlcnNSZXNwSABSEWdldE9ubGluZVVzZXJSZXNwEjEKB2NoYXRNc2cYAy'
    'ABKAsyFS54bXV4LmNoYXQudjEuQ2hhdE1zZ0gAUgdjaGF0TXNnQgYKBHJlc3A=');

@$core.Deprecated('Use heartbeatRespDescriptor instead')
const HeartbeatResp$json = {
  '1': 'HeartbeatResp',
};

/// Descriptor for `HeartbeatResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heartbeatRespDescriptor =
    $convert.base64Decode('Cg1IZWFydGJlYXRSZXNw');

@$core.Deprecated('Use getOnlineUsersRespDescriptor instead')
const GetOnlineUsersResp$json = {
  '1': 'GetOnlineUsersResp',
  '2': [
    {'1': 'onlineUsers', '3': 1, '4': 3, '5': 9, '10': 'onlineUsers'},
    {'1': 'offlineUsers', '3': 2, '4': 3, '5': 9, '10': 'offlineUsers'},
  ],
};

/// Descriptor for `GetOnlineUsersResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOnlineUsersRespDescriptor = $convert.base64Decode(
    'ChJHZXRPbmxpbmVVc2Vyc1Jlc3ASIAoLb25saW5lVXNlcnMYASADKAlSC29ubGluZVVzZXJzEi'
    'IKDG9mZmxpbmVVc2VycxgCIAMoCVIMb2ZmbGluZVVzZXJz');
