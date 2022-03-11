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
