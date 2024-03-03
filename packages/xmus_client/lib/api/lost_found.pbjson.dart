///
//  Generated code. Do not modify.
//  source: lost_found.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use lostAndFoundTypeDescriptor instead')
const LostAndFoundType$json = const {
  '1': 'LostAndFoundType',
  '2': const [
    const {'1': 'Lost', '2': 0},
    const {'1': 'Found', '2': 1},
  ],
};

/// Descriptor for `LostAndFoundType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List lostAndFoundTypeDescriptor = $convert.base64Decode('ChBMb3N0QW5kRm91bmRUeXBlEggKBExvc3QQABIJCgVGb3VuZBAB');
@$core.Deprecated('Use getBriefsReqDescriptor instead')
const GetBriefsReq$json = const {
  '1': 'GetBriefsReq',
  '2': const [
    const {'1': 'before', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'before'},
  ],
};

/// Descriptor for `GetBriefsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBriefsReqDescriptor = $convert.base64Decode('CgxHZXRCcmllZnNSZXESMgoGYmVmb3JlGAEgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIGYmVmb3Jl');
@$core.Deprecated('Use getBriefsRespDescriptor instead')
const GetBriefsResp$json = const {
  '1': 'GetBriefsResp',
  '2': const [
    const {'1': 'briefs', '3': 1, '4': 3, '5': 11, '6': '.xmux.lost_found.v4.LostAndFoundBrief', '10': 'briefs'},
  ],
};

/// Descriptor for `GetBriefsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBriefsRespDescriptor = $convert.base64Decode('Cg1HZXRCcmllZnNSZXNwEj0KBmJyaWVmcxgBIAMoCzIlLnhtdXgubG9zdF9mb3VuZC52NC5Mb3N0QW5kRm91bmRCcmllZlIGYnJpZWZz');
@$core.Deprecated('Use lostAndFoundBriefDescriptor instead')
const LostAndFoundBrief$json = const {
  '1': 'LostAndFoundBrief',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.xmux.lost_found.v4.LostAndFoundType', '10': 'type'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'time', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'time'},
    const {'1': 'location', '3': 6, '4': 1, '5': 9, '10': 'location'},
  ],
};

/// Descriptor for `LostAndFoundBrief`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lostAndFoundBriefDescriptor = $convert.base64Decode('ChFMb3N0QW5kRm91bmRCcmllZhIOCgJpZBgBIAEoCVICaWQSEAoDdWlkGAIgASgJUgN1aWQSOAoEdHlwZRgDIAEoDjIkLnhtdXgubG9zdF9mb3VuZC52NC5Mb3N0QW5kRm91bmRUeXBlUgR0eXBlEhIKBG5hbWUYBCABKAlSBG5hbWUSLgoEdGltZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBHRpbWUSGgoIbG9jYXRpb24YBiABKAlSCGxvY2F0aW9u');
@$core.Deprecated('Use getDetailReqDescriptor instead')
const GetDetailReq$json = const {
  '1': 'GetDetailReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
  ],
};

/// Descriptor for `GetDetailReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDetailReqDescriptor = $convert.base64Decode('CgxHZXREZXRhaWxSZXESGAoCaWQYASABKAlCCPpCBXIDmAEYUgJpZA==');
@$core.Deprecated('Use lostAndFoundDetailDescriptor instead')
const LostAndFoundDetail$json = const {
  '1': 'LostAndFoundDetail',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.xmux.lost_found.v4.LostAndFoundType', '10': 'type'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'time', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'time'},
    const {'1': 'location', '3': 5, '4': 1, '5': 9, '10': 'location'},
    const {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'contacts', '3': 7, '4': 3, '5': 11, '6': '.xmux.lost_found.v4.LostAndFoundDetail.ContactsEntry', '10': 'contacts'},
    const {'1': 'pictures', '3': 8, '4': 3, '5': 9, '10': 'pictures'},
  ],
  '3': const [LostAndFoundDetail_ContactsEntry$json],
};

@$core.Deprecated('Use lostAndFoundDetailDescriptor instead')
const LostAndFoundDetail_ContactsEntry$json = const {
  '1': 'ContactsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `LostAndFoundDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lostAndFoundDetailDescriptor = $convert.base64Decode('ChJMb3N0QW5kRm91bmREZXRhaWwSEAoDdWlkGAEgASgJUgN1aWQSOAoEdHlwZRgCIAEoDjIkLnhtdXgubG9zdF9mb3VuZC52NC5Mb3N0QW5kRm91bmRUeXBlUgR0eXBlEhIKBG5hbWUYAyABKAlSBG5hbWUSLgoEdGltZRgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBHRpbWUSGgoIbG9jYXRpb24YBSABKAlSCGxvY2F0aW9uEiAKC2Rlc2NyaXB0aW9uGAYgASgJUgtkZXNjcmlwdGlvbhJQCghjb250YWN0cxgHIAMoCzI0LnhtdXgubG9zdF9mb3VuZC52NC5Mb3N0QW5kRm91bmREZXRhaWwuQ29udGFjdHNFbnRyeVIIY29udGFjdHMSGgoIcGljdHVyZXMYCCADKAlSCHBpY3R1cmVzGjsKDUNvbnRhY3RzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');
@$core.Deprecated('Use addItemReqDescriptor instead')
const AddItemReq$json = const {
  '1': 'AddItemReq',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.xmux.lost_found.v4.LostAndFoundType', '10': 'type'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'name'},
    const {'1': 'time', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': const {}, '10': 'time'},
    const {'1': 'location', '3': 4, '4': 1, '5': 9, '8': const {}, '10': 'location'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '8': const {}, '10': 'description'},
    const {'1': 'contacts', '3': 6, '4': 3, '5': 11, '6': '.xmux.lost_found.v4.AddItemReq.ContactsEntry', '8': const {}, '10': 'contacts'},
  ],
  '3': const [AddItemReq_ContactsEntry$json],
};

@$core.Deprecated('Use addItemReqDescriptor instead')
const AddItemReq_ContactsEntry$json = const {
  '1': 'ContactsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `AddItemReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addItemReqDescriptor = $convert.base64Decode('CgpBZGRJdGVtUmVxEjgKBHR5cGUYASABKA4yJC54bXV4Lmxvc3RfZm91bmQudjQuTG9zdEFuZEZvdW5kVHlwZVIEdHlwZRIbCgRuYW1lGAIgASgJQgf6QgRyAhgyUgRuYW1lEjgKBHRpbWUYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQgj6QgWyAQIIAVIEdGltZRIjCghsb2NhdGlvbhgEIAEoCUIH+kIEcgIYZFIIbG9jYXRpb24SKgoLZGVzY3JpcHRpb24YBSABKAlCCPpCBXIDGPQDUgtkZXNjcmlwdGlvbhJqCghjb250YWN0cxgGIAMoCzIsLnhtdXgubG9zdF9mb3VuZC52NC5BZGRJdGVtUmVxLkNvbnRhY3RzRW50cnlCIPpCCZoBBiIEcgIYMvpCCZoBBioEcgIYZPpCBZoBAhAKUghjb250YWN0cxo7Cg1Db250YWN0c0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');
@$core.Deprecated('Use deleteItemReqDescriptor instead')
const DeleteItemReq$json = const {
  '1': 'DeleteItemReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteItemReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteItemReqDescriptor = $convert.base64Decode('Cg1EZWxldGVJdGVtUmVxEg4KAmlkGAEgASgJUgJpZA==');
