///
//  Generated code. Do not modify.
//  source: forum_common.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use orderingDescriptor instead')
const Ordering$json = const {
  '1': 'Ordering',
  '2': const [
    const {'1': 'update', '2': 0},
    const {'1': 'likes', '2': 1},
    const {'1': 'posts', '2': 2},
    const {'1': 'latest', '2': 3},
    const {'1': 'oldest', '2': 4},
  ],
};

/// Descriptor for `Ordering`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List orderingDescriptor = $convert.base64Decode('CghPcmRlcmluZxIKCgZ1cGRhdGUQABIJCgVsaWtlcxABEgkKBXBvc3RzEAISCgoGbGF0ZXN0EAMSCgoGb2xkZXN0EAQ=');
@$core.Deprecated('Use imageDescriptor instead')
const Image$json = const {
  '1': 'Image',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `Image`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageDescriptor = $convert.base64Decode('CgVJbWFnZRIQCgN1cmwYASABKAlSA3VybA==');
@$core.Deprecated('Use plainContentDescriptor instead')
const PlainContent$json = const {
  '1': 'PlainContent',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'images', '3': 2, '4': 3, '5': 11, '6': '.xmux.forum.v4.Image', '10': 'images'},
  ],
};

/// Descriptor for `PlainContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List plainContentDescriptor = $convert.base64Decode('CgxQbGFpbkNvbnRlbnQSGAoHY29udGVudBgBIAEoCVIHY29udGVudBIsCgZpbWFnZXMYAiADKAsyFC54bXV4LmZvcnVtLnY0LkltYWdlUgZpbWFnZXM=');
@$core.Deprecated('Use markdownContentDescriptor instead')
const MarkdownContent$json = const {
  '1': 'MarkdownContent',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `MarkdownContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markdownContentDescriptor = $convert.base64Decode('Cg9NYXJrZG93bkNvbnRlbnQSGAoHY29udGVudBgBIAEoCVIHY29udGVudA==');
