///
//  Generated code. Do not modify.
//  source: lost_found.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class LostAndFoundType extends $pb.ProtobufEnum {
  static const LostAndFoundType Lost = LostAndFoundType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Lost');
  static const LostAndFoundType Found = LostAndFoundType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Found');

  static const $core.List<LostAndFoundType> values = <LostAndFoundType> [
    Lost,
    Found,
  ];

  static final $core.Map<$core.int, LostAndFoundType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LostAndFoundType? valueOf($core.int value) => _byValue[value];

  const LostAndFoundType._($core.int v, $core.String n) : super(v, n);
}

