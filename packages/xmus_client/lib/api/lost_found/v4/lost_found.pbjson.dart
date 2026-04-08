// This is a generated file - do not edit.
//
// Generated from lost_found/v4/lost_found.proto.

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

@$core.Deprecated('Use lostAndFoundTypeDescriptor instead')
const LostAndFoundType$json = {
  '1': 'LostAndFoundType',
  '2': [
    {'1': 'Lost', '2': 0},
    {'1': 'Found', '2': 1},
  ],
};

/// Descriptor for `LostAndFoundType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List lostAndFoundTypeDescriptor = $convert
    .base64Decode('ChBMb3N0QW5kRm91bmRUeXBlEggKBExvc3QQABIJCgVGb3VuZBAB');

@$core.Deprecated('Use getBriefsReqDescriptor instead')
const GetBriefsReq$json = {
  '1': 'GetBriefsReq',
  '2': [
    {
      '1': 'before',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'before'
    },
  ],
};

/// Descriptor for `GetBriefsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBriefsReqDescriptor = $convert.base64Decode(
    'CgxHZXRCcmllZnNSZXESMgoGYmVmb3JlGAEgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcFIGYmVmb3Jl');

@$core.Deprecated('Use getBriefsRespDescriptor instead')
const GetBriefsResp$json = {
  '1': 'GetBriefsResp',
  '2': [
    {
      '1': 'briefs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.xmux.lost_found.v4.LostAndFoundBrief',
      '10': 'briefs'
    },
  ],
};

/// Descriptor for `GetBriefsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBriefsRespDescriptor = $convert.base64Decode(
    'Cg1HZXRCcmllZnNSZXNwEj0KBmJyaWVmcxgBIAMoCzIlLnhtdXgubG9zdF9mb3VuZC52NC5Mb3'
    'N0QW5kRm91bmRCcmllZlIGYnJpZWZz');

@$core.Deprecated('Use lostAndFoundBriefDescriptor instead')
const LostAndFoundBrief$json = {
  '1': 'LostAndFoundBrief',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    {
      '1': 'type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.xmux.lost_found.v4.LostAndFoundType',
      '10': 'type'
    },
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'time',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'time'
    },
    {'1': 'location', '3': 6, '4': 1, '5': 9, '10': 'location'},
  ],
};

/// Descriptor for `LostAndFoundBrief`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lostAndFoundBriefDescriptor = $convert.base64Decode(
    'ChFMb3N0QW5kRm91bmRCcmllZhIOCgJpZBgBIAEoCVICaWQSEAoDdWlkGAIgASgJUgN1aWQSOA'
    'oEdHlwZRgDIAEoDjIkLnhtdXgubG9zdF9mb3VuZC52NC5Mb3N0QW5kRm91bmRUeXBlUgR0eXBl'
    'EhIKBG5hbWUYBCABKAlSBG5hbWUSLgoEdGltZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW'
    '1lc3RhbXBSBHRpbWUSGgoIbG9jYXRpb24YBiABKAlSCGxvY2F0aW9u');

@$core.Deprecated('Use getDetailReqDescriptor instead')
const GetDetailReq$json = {
  '1': 'GetDetailReq',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'id'},
  ],
};

/// Descriptor for `GetDetailReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDetailReqDescriptor = $convert
    .base64Decode('CgxHZXREZXRhaWxSZXESGAoCaWQYASABKAlCCPpCBXIDmAEYUgJpZA==');

@$core.Deprecated('Use lostAndFoundDetailDescriptor instead')
const LostAndFoundDetail$json = {
  '1': 'LostAndFoundDetail',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.xmux.lost_found.v4.LostAndFoundType',
      '10': 'type'
    },
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'time',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'time'
    },
    {'1': 'location', '3': 5, '4': 1, '5': 9, '10': 'location'},
    {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
    {
      '1': 'contacts',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.xmux.lost_found.v4.LostAndFoundDetail.ContactsEntry',
      '10': 'contacts'
    },
    {'1': 'pictures', '3': 8, '4': 3, '5': 9, '10': 'pictures'},
  ],
  '3': [LostAndFoundDetail_ContactsEntry$json],
};

@$core.Deprecated('Use lostAndFoundDetailDescriptor instead')
const LostAndFoundDetail_ContactsEntry$json = {
  '1': 'ContactsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `LostAndFoundDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lostAndFoundDetailDescriptor = $convert.base64Decode(
    'ChJMb3N0QW5kRm91bmREZXRhaWwSEAoDdWlkGAEgASgJUgN1aWQSOAoEdHlwZRgCIAEoDjIkLn'
    'htdXgubG9zdF9mb3VuZC52NC5Mb3N0QW5kRm91bmRUeXBlUgR0eXBlEhIKBG5hbWUYAyABKAlS'
    'BG5hbWUSLgoEdGltZRgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBHRpbWUSGg'
    'oIbG9jYXRpb24YBSABKAlSCGxvY2F0aW9uEiAKC2Rlc2NyaXB0aW9uGAYgASgJUgtkZXNjcmlw'
    'dGlvbhJQCghjb250YWN0cxgHIAMoCzI0LnhtdXgubG9zdF9mb3VuZC52NC5Mb3N0QW5kRm91bm'
    'REZXRhaWwuQ29udGFjdHNFbnRyeVIIY29udGFjdHMSGgoIcGljdHVyZXMYCCADKAlSCHBpY3R1'
    'cmVzGjsKDUNvbnRhY3RzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBX'
    'ZhbHVlOgI4AQ==');

@$core.Deprecated('Use addItemReqDescriptor instead')
const AddItemReq$json = {
  '1': 'AddItemReq',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.xmux.lost_found.v4.LostAndFoundType',
      '10': 'type'
    },
    {'1': 'name', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {
      '1': 'time',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'time'
    },
    {'1': 'location', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'location'},
    {'1': 'description', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'description'},
    {
      '1': 'contacts',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.xmux.lost_found.v4.AddItemReq.ContactsEntry',
      '8': {},
      '10': 'contacts'
    },
  ],
  '3': [AddItemReq_ContactsEntry$json],
};

@$core.Deprecated('Use addItemReqDescriptor instead')
const AddItemReq_ContactsEntry$json = {
  '1': 'ContactsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `AddItemReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addItemReqDescriptor = $convert.base64Decode(
    'CgpBZGRJdGVtUmVxEjgKBHR5cGUYASABKA4yJC54bXV4Lmxvc3RfZm91bmQudjQuTG9zdEFuZE'
    'ZvdW5kVHlwZVIEdHlwZRIbCgRuYW1lGAIgASgJQgf6QgRyAhgyUgRuYW1lEjgKBHRpbWUYAyAB'
    'KAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQgj6QgWyAQIIAVIEdGltZRIjCghsb2NhdG'
    'lvbhgEIAEoCUIH+kIEcgIYZFIIbG9jYXRpb24SKgoLZGVzY3JpcHRpb24YBSABKAlCCPpCBXID'
    'GPQDUgtkZXNjcmlwdGlvbhJeCghjb250YWN0cxgGIAMoCzIsLnhtdXgubG9zdF9mb3VuZC52NC'
    '5BZGRJdGVtUmVxLkNvbnRhY3RzRW50cnlCFPpCEZoBDhAKIgRyAhgyKgRyAhhkUghjb250YWN0'
    'cxo7Cg1Db250YWN0c0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YW'
    'x1ZToCOAE=');

@$core.Deprecated('Use deleteItemReqDescriptor instead')
const DeleteItemReq$json = {
  '1': 'DeleteItemReq',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteItemReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteItemReqDescriptor =
    $convert.base64Decode('Cg1EZWxldGVJdGVtUmVxEg4KAmlkGAEgASgJUgJpZA==');
