//
//  Generated code. Do not modify.
//  source: aaos/v4/error_reason.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ErrorReason extends $pb.ProtobufEnum {
  static const ErrorReason AC_SERVICE_UNAVAILABLE = ErrorReason._(0, _omitEnumNames ? '' : 'AC_SERVICE_UNAVAILABLE');
  static const ErrorReason AC_WRONG_PASSWORD = ErrorReason._(1, _omitEnumNames ? '' : 'AC_WRONG_PASSWORD');
  static const ErrorReason AC_ACCOUNT_BLOCKED = ErrorReason._(2, _omitEnumNames ? '' : 'AC_ACCOUNT_BLOCKED');

  static const $core.List<ErrorReason> values = <ErrorReason> [
    AC_SERVICE_UNAVAILABLE,
    AC_WRONG_PASSWORD,
    AC_ACCOUNT_BLOCKED,
  ];

  static final $core.Map<$core.int, ErrorReason> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ErrorReason? valueOf($core.int value) => _byValue[value];

  const ErrorReason._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
