///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RefreshDeviceReq_PushChannelType extends $pb.ProtobufEnum {
  static const RefreshDeviceReq_PushChannelType fcm =
      RefreshDeviceReq_PushChannelType._(0, 'fcm');

  static const $core.List<RefreshDeviceReq_PushChannelType> values =
      <RefreshDeviceReq_PushChannelType>[
    fcm,
  ];

  static final $core.Map<$core.int, RefreshDeviceReq_PushChannelType> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static RefreshDeviceReq_PushChannelType valueOf($core.int value) =>
      _byValue[value];

  const RefreshDeviceReq_PushChannelType._($core.int v, $core.String n)
      : super(v, n);
}
