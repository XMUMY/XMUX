// This is a generated file - do not edit.
//
// Generated from user/v4/user.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RefreshDeviceReq_PushChannelType extends $pb.ProtobufEnum {
  static const RefreshDeviceReq_PushChannelType fcm =
      RefreshDeviceReq_PushChannelType._(0, _omitEnumNames ? '' : 'fcm');

  static const $core.List<RefreshDeviceReq_PushChannelType> values =
      <RefreshDeviceReq_PushChannelType>[
    fcm,
  ];

  static final $core.List<RefreshDeviceReq_PushChannelType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 0);
  static RefreshDeviceReq_PushChannelType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RefreshDeviceReq_PushChannelType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
