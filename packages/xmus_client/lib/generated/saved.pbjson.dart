///
//  Generated code. Do not modify.
//  source: saved.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use saveReqDescriptor instead')
const SaveReq$json = const {
  '1': 'SaveReq',
  '2': const [
    const {'1': 'refId', '3': 1, '4': 1, '5': 5, '10': 'refId'},
  ],
};

/// Descriptor for `SaveReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveReqDescriptor = $convert.base64Decode('CgdTYXZlUmVxEhQKBXJlZklkGAEgASgFUgVyZWZJZA==');
@$core.Deprecated('Use saveRespDescriptor instead')
const SaveResp$json = const {
  '1': 'SaveResp',
  '2': const [
    const {'1': 'alreadySaved', '3': 1, '4': 1, '5': 8, '10': 'alreadySaved'},
  ],
};

/// Descriptor for `SaveResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveRespDescriptor = $convert.base64Decode('CghTYXZlUmVzcBIiCgxhbHJlYWR5U2F2ZWQYASABKAhSDGFscmVhZHlTYXZlZA==');
@$core.Deprecated('Use getSavedReqDescriptor instead')
const GetSavedReq$json = const {
  '1': 'GetSavedReq',
  '2': const [
    const {'1': 'pageNo', '3': 1, '4': 1, '5': 5, '10': 'pageNo'},
    const {'1': 'pageSize', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
  ],
};

/// Descriptor for `GetSavedReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSavedReqDescriptor = $convert.base64Decode('CgtHZXRTYXZlZFJlcRIWCgZwYWdlTm8YASABKAVSBnBhZ2VObxIaCghwYWdlU2l6ZRgCIAEoBVIIcGFnZVNpemU=');
