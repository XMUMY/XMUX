///
//  Generated code. Do not modify.
//  source: forum_common.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Ordering extends $pb.ProtobufEnum {
  static const Ordering update = Ordering._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'update');
  static const Ordering likes = Ordering._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'likes');
  static const Ordering posts = Ordering._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'posts');
  static const Ordering latest = Ordering._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'latest');
  static const Ordering oldest = Ordering._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'oldest');

  static const $core.List<Ordering> values = <Ordering> [
    update,
    likes,
    posts,
    latest,
    oldest,
  ];

  static final $core.Map<$core.int, Ordering> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Ordering? valueOf($core.int value) => _byValue[value];

  const Ordering._($core.int v, $core.String n) : super(v, n);
}

