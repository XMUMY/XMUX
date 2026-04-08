// This is a generated file - do not edit.
//
// Generated from forum_common.proto.

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

@$core.Deprecated('Use orderingDescriptor instead')
const Ordering$json = {
  '1': 'Ordering',
  '2': [
    {'1': 'update', '2': 0},
    {'1': 'likes', '2': 1},
    {'1': 'posts', '2': 2},
    {'1': 'latest', '2': 3},
    {'1': 'oldest', '2': 4},
  ],
};

/// Descriptor for `Ordering`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List orderingDescriptor = $convert.base64Decode(
    'CghPcmRlcmluZxIKCgZ1cGRhdGUQABIJCgVsaWtlcxABEgkKBXBvc3RzEAISCgoGbGF0ZXN0EA'
    'MSCgoGb2xkZXN0EAQ=');

@$core.Deprecated('Use imageDescriptor instead')
const Image$json = {
  '1': 'Image',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'url'},
  ],
};

/// Descriptor for `Image`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageDescriptor =
    $convert.base64Decode('CgVJbWFnZRIaCgN1cmwYASABKAlCCPpCBXIDGMgBUgN1cmw=');

@$core.Deprecated('Use plainContentDescriptor instead')
const PlainContent$json = {
  '1': 'PlainContent',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'content'},
    {
      '1': 'images',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.xmux.forum.v4.Image',
      '8': {},
      '10': 'images'
    },
  ],
};

/// Descriptor for `PlainContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List plainContentDescriptor = $convert.base64Decode(
    'CgxQbGFpbkNvbnRlbnQSIgoHY29udGVudBgBIAEoCUII+kIFcgMY3AtSB2NvbnRlbnQSNgoGaW'
    '1hZ2VzGAIgAygLMhQueG11eC5mb3J1bS52NC5JbWFnZUII+kIFkgECEAlSBmltYWdlcw==');

@$core.Deprecated('Use markdownContentDescriptor instead')
const MarkdownContent$json = {
  '1': 'MarkdownContent',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'content'},
  ],
};

/// Descriptor for `MarkdownContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markdownContentDescriptor = $convert.base64Decode(
    'Cg9NYXJrZG93bkNvbnRlbnQSIgoHY29udGVudBgBIAEoCUII+kIFcgMY3AtSB2NvbnRlbnQ=');
