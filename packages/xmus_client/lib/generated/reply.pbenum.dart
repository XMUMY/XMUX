///
//  Generated code. Do not modify.
//  source: reply.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class RefType extends $pb.ProtobufEnum {
  static const RefType POST = RefType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POST');
  static const RefType REPLY = RefType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REPLY');

  static const $core.List<RefType> values = <RefType> [
    POST,
    REPLY,
  ];

  static final $core.Map<$core.int, RefType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RefType? valueOf($core.int value) => _byValue[value];

  const RefType._($core.int v, $core.String n) : super(v, n);
}

class SortingMethod extends $pb.ProtobufEnum {
  static const SortingMethod NEWEST = SortingMethod._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NEWEST');
  static const SortingMethod VOTE = SortingMethod._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VOTE');

  static const $core.List<SortingMethod> values = <SortingMethod> [
    NEWEST,
    VOTE,
  ];

  static final $core.Map<$core.int, SortingMethod> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SortingMethod? valueOf($core.int value) => _byValue[value];

  const SortingMethod._($core.int v, $core.String n) : super(v, n);
}

