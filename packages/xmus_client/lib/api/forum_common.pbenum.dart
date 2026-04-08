// This is a generated file - do not edit.
//
// Generated from forum_common.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Ordering extends $pb.ProtobufEnum {
  /// Order by latest activity (including publish/edit/post).
  static const Ordering update = Ordering._(0, _omitEnumNames ? '' : 'update');

  /// Higher number of likes first.
  static const Ordering likes = Ordering._(1, _omitEnumNames ? '' : 'likes');

  /// Higher number of posts first.
  static const Ordering posts = Ordering._(2, _omitEnumNames ? '' : 'posts');

  /// Order by latest publish time.
  static const Ordering latest = Ordering._(3, _omitEnumNames ? '' : 'latest');

  /// Order by oldest publish time.
  static const Ordering oldest = Ordering._(4, _omitEnumNames ? '' : 'oldest');

  static const $core.List<Ordering> values = <Ordering>[
    update,
    likes,
    posts,
    latest,
    oldest,
  ];

  static final $core.List<Ordering?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static Ordering? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Ordering._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
