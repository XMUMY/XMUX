///
//  Generated code. Do not modify.
//  source: notif.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class NotifType extends $pb.ProtobufEnum {
  static const NotifType POST_REPLY = NotifType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POST_REPLY');
  static const NotifType REPLY_REPLY = NotifType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REPLY_REPLY');

  static const $core.List<NotifType> values = <NotifType> [
    POST_REPLY,
    REPLY_REPLY,
  ];

  static final $core.Map<$core.int, NotifType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NotifType? valueOf($core.int value) => _byValue[value];

  const NotifType._($core.int v, $core.String n) : super(v, n);
}

