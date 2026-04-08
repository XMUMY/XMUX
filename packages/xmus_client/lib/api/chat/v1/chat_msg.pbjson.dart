// This is a generated file - do not edit.
//
// Generated from chat/v1/chat_msg.proto.

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

@$core.Deprecated('Use chatMsgDescriptor instead')
const ChatMsg$json = {
  '1': 'ChatMsg',
  '2': [
    {
      '1': 'createAt',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createAt'
    },
    {
      '1': 'processAt',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'processAt'
    },
    {'1': 'from', '3': 3, '4': 1, '5': 9, '10': 'from'},
    {'1': 'to', '3': 4, '4': 1, '5': 9, '10': 'to'},
    {'1': 'textMsg', '3': 31, '4': 1, '5': 9, '9': 0, '10': 'textMsg'},
  ],
  '8': [
    {'1': 'msg'},
  ],
};

/// Descriptor for `ChatMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMsgDescriptor = $convert.base64Decode(
    'CgdDaGF0TXNnEjYKCGNyZWF0ZUF0GAEgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcF'
    'IIY3JlYXRlQXQSOAoJcHJvY2Vzc0F0GAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFt'
    'cFIJcHJvY2Vzc0F0EhIKBGZyb20YAyABKAlSBGZyb20SDgoCdG8YBCABKAlSAnRvEhoKB3RleH'
    'RNc2cYHyABKAlIAFIHdGV4dE1zZ0IFCgNtc2c=');
