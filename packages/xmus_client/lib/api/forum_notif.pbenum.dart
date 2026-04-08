// This is a generated file - do not edit.
//
// Generated from forum_notif.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NotifType extends $pb.ProtobufEnum {
  static const NotifType POST_REPLY =
      NotifType._(0, _omitEnumNames ? '' : 'POST_REPLY');
  static const NotifType REPLY_REPLY =
      NotifType._(1, _omitEnumNames ? '' : 'REPLY_REPLY');

  static const $core.List<NotifType> values = <NotifType>[
    POST_REPLY,
    REPLY_REPLY,
  ];

  static final $core.List<NotifType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static NotifType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const NotifType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
