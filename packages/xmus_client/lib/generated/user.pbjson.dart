///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use registerReqDescriptor instead')
const RegisterReq$json = const {
  '1': 'RegisterReq',
  '2': const [
    const {'1': 'displayName', '3': 1, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `RegisterReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerReqDescriptor = $convert.base64Decode('CgtSZWdpc3RlclJlcRIgCgtkaXNwbGF5TmFtZRgBIAEoCVILZGlzcGxheU5hbWUSFAoFZW1haWwYAiABKAlSBWVtYWls');
@$core.Deprecated('Use loginRespDescriptor instead')
const LoginResp$json = const {
  '1': 'LoginResp',
  '2': const [
    const {'1': 'customToken', '3': 1, '4': 1, '5': 9, '10': 'customToken'},
  ],
};

/// Descriptor for `LoginResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRespDescriptor = $convert.base64Decode('CglMb2dpblJlc3ASIAoLY3VzdG9tVG9rZW4YASABKAlSC2N1c3RvbVRva2Vu');
@$core.Deprecated('Use getProfileReqDescriptor instead')
const GetProfileReq$json = const {
  '1': 'GetProfileReq',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `GetProfileReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfileReqDescriptor = $convert.base64Decode('Cg1HZXRQcm9maWxlUmVxEhAKA3VpZBgBIAEoCVIDdWlk');
@$core.Deprecated('Use profileDescriptor instead')
const Profile$json = const {
  '1': 'Profile',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'displayName', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'avatar', '3': 4, '4': 1, '5': 9, '10': 'avatar'},
    const {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nationality', '3': 6, '4': 1, '5': 9, '10': 'nationality'},
    const {'1': 'id', '3': 7, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `Profile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List profileDescriptor = $convert.base64Decode('CgdQcm9maWxlEhAKA3VpZBgBIAEoCVIDdWlkEhQKBWVtYWlsGAIgASgJUgVlbWFpbBIgCgtkaXNwbGF5TmFtZRgDIAEoCVILZGlzcGxheU5hbWUSFgoGYXZhdGFyGAQgASgJUgZhdmF0YXISEgoEbmFtZRgFIAEoCVIEbmFtZRIgCgtuYXRpb25hbGl0eRgGIAEoCVILbmF0aW9uYWxpdHkSDgoCaWQYByABKAlSAmlk');
@$core.Deprecated('Use refreshDeviceReqDescriptor instead')
const RefreshDeviceReq$json = const {
  '1': 'RefreshDeviceReq',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'deviceModel', '3': 2, '4': 1, '5': 9, '10': 'deviceModel'},
    const {'1': 'deviceName', '3': 3, '4': 1, '5': 9, '10': 'deviceName'},
    const {'1': 'pushChannel', '3': 4, '4': 1, '5': 14, '6': '.xmux.core.user.v4.RefreshDeviceReq.PushChannelType', '10': 'pushChannel'},
    const {'1': 'pushKey', '3': 5, '4': 1, '5': 9, '10': 'pushKey'},
  ],
  '4': const [RefreshDeviceReq_PushChannelType$json],
};

@$core.Deprecated('Use refreshDeviceReqDescriptor instead')
const RefreshDeviceReq_PushChannelType$json = const {
  '1': 'PushChannelType',
  '2': const [
    const {'1': 'fcm', '2': 0},
  ],
};

/// Descriptor for `RefreshDeviceReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshDeviceReqDescriptor = $convert.base64Decode('ChBSZWZyZXNoRGV2aWNlUmVxEhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIgCgtkZXZpY2VNb2RlbBgCIAEoCVILZGV2aWNlTW9kZWwSHgoKZGV2aWNlTmFtZRgDIAEoCVIKZGV2aWNlTmFtZRJVCgtwdXNoQ2hhbm5lbBgEIAEoDjIzLnhtdXguY29yZS51c2VyLnY0LlJlZnJlc2hEZXZpY2VSZXEuUHVzaENoYW5uZWxUeXBlUgtwdXNoQ2hhbm5lbBIYCgdwdXNoS2V5GAUgASgJUgdwdXNoS2V5IhoKD1B1c2hDaGFubmVsVHlwZRIHCgNmY20QAA==');
@$core.Deprecated('Use getDevicesRespDescriptor instead')
const GetDevicesResp$json = const {
  '1': 'GetDevicesResp',
  '2': const [
    const {'1': 'devices', '3': 1, '4': 3, '5': 11, '6': '.xmux.core.user.v4.GetDevicesResp.Device', '10': 'devices'},
  ],
  '3': const [GetDevicesResp_Device$json],
};

@$core.Deprecated('Use getDevicesRespDescriptor instead')
const GetDevicesResp_Device$json = const {
  '1': 'Device',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'deviceModel', '3': 2, '4': 1, '5': 9, '10': 'deviceModel'},
    const {'1': 'deviceName', '3': 3, '4': 1, '5': 9, '10': 'deviceName'},
    const {'1': 'lastSeen', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastSeen'},
  ],
};

/// Descriptor for `GetDevicesResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDevicesRespDescriptor = $convert.base64Decode('Cg5HZXREZXZpY2VzUmVzcBJCCgdkZXZpY2VzGAEgAygLMigueG11eC5jb3JlLnVzZXIudjQuR2V0RGV2aWNlc1Jlc3AuRGV2aWNlUgdkZXZpY2VzGp4BCgZEZXZpY2USGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEiAKC2RldmljZU1vZGVsGAIgASgJUgtkZXZpY2VNb2RlbBIeCgpkZXZpY2VOYW1lGAMgASgJUgpkZXZpY2VOYW1lEjYKCGxhc3RTZWVuGAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIIbGFzdFNlZW4=');
