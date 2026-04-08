// This is a generated file - do not edit.
//
// Generated from user/v4/user.proto.

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

@$core.Deprecated('Use registerReqDescriptor instead')
const RegisterReq$json = {
  '1': 'RegisterReq',
  '2': [
    {'1': 'displayName', '3': 1, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `RegisterReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerReqDescriptor = $convert.base64Decode(
    'CgtSZWdpc3RlclJlcRIgCgtkaXNwbGF5TmFtZRgBIAEoCVILZGlzcGxheU5hbWUSFAoFZW1haW'
    'wYAiABKAlSBWVtYWls');

@$core.Deprecated('Use loginRespDescriptor instead')
const LoginResp$json = {
  '1': 'LoginResp',
  '2': [
    {'1': 'customToken', '3': 1, '4': 1, '5': 9, '10': 'customToken'},
  ],
};

/// Descriptor for `LoginResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRespDescriptor = $convert.base64Decode(
    'CglMb2dpblJlc3ASIAoLY3VzdG9tVG9rZW4YASABKAlSC2N1c3RvbVRva2Vu');

@$core.Deprecated('Use getProfileReqDescriptor instead')
const GetProfileReq$json = {
  '1': 'GetProfileReq',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `GetProfileReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfileReqDescriptor =
    $convert.base64Decode('Cg1HZXRQcm9maWxlUmVxEhAKA3VpZBgBIAEoCVIDdWlk');

@$core.Deprecated('Use profileDescriptor instead')
const Profile$json = {
  '1': 'Profile',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'displayName', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'avatar', '3': 4, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    {'1': 'nationality', '3': 6, '4': 1, '5': 9, '10': 'nationality'},
    {'1': 'id', '3': 7, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `Profile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List profileDescriptor = $convert.base64Decode(
    'CgdQcm9maWxlEhAKA3VpZBgBIAEoCVIDdWlkEhQKBWVtYWlsGAIgASgJUgVlbWFpbBIgCgtkaX'
    'NwbGF5TmFtZRgDIAEoCVILZGlzcGxheU5hbWUSFgoGYXZhdGFyGAQgASgJUgZhdmF0YXISEgoE'
    'bmFtZRgFIAEoCVIEbmFtZRIgCgtuYXRpb25hbGl0eRgGIAEoCVILbmF0aW9uYWxpdHkSDgoCaW'
    'QYByABKAlSAmlk');

@$core.Deprecated('Use refreshDeviceReqDescriptor instead')
const RefreshDeviceReq$json = {
  '1': 'RefreshDeviceReq',
  '2': [
    {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'deviceModel', '3': 2, '4': 1, '5': 9, '10': 'deviceModel'},
    {'1': 'deviceName', '3': 3, '4': 1, '5': 9, '10': 'deviceName'},
    {
      '1': 'pushChannel',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.xmux.core.user.v4.RefreshDeviceReq.PushChannelType',
      '10': 'pushChannel'
    },
    {'1': 'pushKey', '3': 5, '4': 1, '5': 9, '10': 'pushKey'},
  ],
  '4': [RefreshDeviceReq_PushChannelType$json],
};

@$core.Deprecated('Use refreshDeviceReqDescriptor instead')
const RefreshDeviceReq_PushChannelType$json = {
  '1': 'PushChannelType',
  '2': [
    {'1': 'fcm', '2': 0},
  ],
};

/// Descriptor for `RefreshDeviceReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshDeviceReqDescriptor = $convert.base64Decode(
    'ChBSZWZyZXNoRGV2aWNlUmVxEhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIgCgtkZXZpY2'
    'VNb2RlbBgCIAEoCVILZGV2aWNlTW9kZWwSHgoKZGV2aWNlTmFtZRgDIAEoCVIKZGV2aWNlTmFt'
    'ZRJVCgtwdXNoQ2hhbm5lbBgEIAEoDjIzLnhtdXguY29yZS51c2VyLnY0LlJlZnJlc2hEZXZpY2'
    'VSZXEuUHVzaENoYW5uZWxUeXBlUgtwdXNoQ2hhbm5lbBIYCgdwdXNoS2V5GAUgASgJUgdwdXNo'
    'S2V5IhoKD1B1c2hDaGFubmVsVHlwZRIHCgNmY20QAA==');

@$core.Deprecated('Use getDevicesRespDescriptor instead')
const GetDevicesResp$json = {
  '1': 'GetDevicesResp',
  '2': [
    {
      '1': 'devices',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.xmux.core.user.v4.GetDevicesResp.Device',
      '10': 'devices'
    },
  ],
  '3': [GetDevicesResp_Device$json],
};

@$core.Deprecated('Use getDevicesRespDescriptor instead')
const GetDevicesResp_Device$json = {
  '1': 'Device',
  '2': [
    {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'deviceModel', '3': 2, '4': 1, '5': 9, '10': 'deviceModel'},
    {'1': 'deviceName', '3': 3, '4': 1, '5': 9, '10': 'deviceName'},
    {
      '1': 'lastSeen',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'lastSeen'
    },
  ],
};

/// Descriptor for `GetDevicesResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDevicesRespDescriptor = $convert.base64Decode(
    'Cg5HZXREZXZpY2VzUmVzcBJCCgdkZXZpY2VzGAEgAygLMigueG11eC5jb3JlLnVzZXIudjQuR2'
    'V0RGV2aWNlc1Jlc3AuRGV2aWNlUgdkZXZpY2VzGp4BCgZEZXZpY2USGgoIZGV2aWNlSWQYASAB'
    'KAlSCGRldmljZUlkEiAKC2RldmljZU1vZGVsGAIgASgJUgtkZXZpY2VNb2RlbBIeCgpkZXZpY2'
    'VOYW1lGAMgASgJUgpkZXZpY2VOYW1lEjYKCGxhc3RTZWVuGAQgASgLMhouZ29vZ2xlLnByb3Rv'
    'YnVmLlRpbWVzdGFtcFIIbGFzdFNlZW4=');
