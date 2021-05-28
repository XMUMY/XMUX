///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class RefreshDeviceReq_PushChannelType extends $pb.ProtobufEnum {
  static const RefreshDeviceReq_PushChannelType fcm = RefreshDeviceReq_PushChannelType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'fcm');

  static const $core.List<RefreshDeviceReq_PushChannelType> values = <RefreshDeviceReq_PushChannelType> [
    fcm,
  ];

  static final $core.Map<$core.int, RefreshDeviceReq_PushChannelType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RefreshDeviceReq_PushChannelType? valueOf($core.int value) => _byValue[value];

  const RefreshDeviceReq_PushChannelType._($core.int v, $core.String n) : super(v, n);
}

