// This is a generated file - do not edit.
//
// Generated from lost_found/v4/lost_found.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LostAndFoundType extends $pb.ProtobufEnum {
  static const LostAndFoundType Lost =
      LostAndFoundType._(0, _omitEnumNames ? '' : 'Lost');
  static const LostAndFoundType Found =
      LostAndFoundType._(1, _omitEnumNames ? '' : 'Found');

  static const $core.List<LostAndFoundType> values = <LostAndFoundType>[
    Lost,
    Found,
  ];

  static final $core.List<LostAndFoundType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static LostAndFoundType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const LostAndFoundType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
