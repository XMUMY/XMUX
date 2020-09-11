///
//  Generated code. Do not modify.
//  source: lost_found.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LostAndFoundType extends $pb.ProtobufEnum {
  static const LostAndFoundType Lost = LostAndFoundType._(0, 'Lost');
  static const LostAndFoundType Found = LostAndFoundType._(1, 'Found');

  static const $core.List<LostAndFoundType> values = <LostAndFoundType>[
    Lost,
    Found,
  ];

  static final $core.Map<$core.int, LostAndFoundType> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static LostAndFoundType valueOf($core.int value) => _byValue[value];

  const LostAndFoundType._($core.int v, $core.String n) : super(v, n);
}
