///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $2;

import 'user.pbenum.dart';

export 'user.pbenum.dart';

class RegisterReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.user.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'displayName', protoName: 'displayName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  RegisterReq._() : super();
  factory RegisterReq({
    $core.String? displayName,
    $core.String? email,
  }) {
    final _result = create();
    if (displayName != null) {
      _result.displayName = displayName;
    }
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory RegisterReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterReq.fromJson($core.Map<$core.String,$core.dynamic> i) => create()..mergeFromProto3Json(i);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterReq clone() => RegisterReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterReq copyWith(void Function(RegisterReq) updates) => super.copyWith((message) => updates(message as RegisterReq)) as RegisterReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterReq create() => RegisterReq._();
  RegisterReq createEmptyInstance() => create();
  static $pb.PbList<RegisterReq> createRepeated() => $pb.PbList<RegisterReq>();
  @$core.pragma('dart2js:noInline')
  static RegisterReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterReq>(create);
  static RegisterReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get displayName => $_getSZ(0);
  @$pb.TagNumber(1)
  set displayName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDisplayName() => $_has(0);
  @$pb.TagNumber(1)
  void clearDisplayName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);
}

class LoginResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.user.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customToken', protoName: 'customToken')
    ..hasRequiredFields = false
  ;

  LoginResp._() : super();
  factory LoginResp({
    $core.String? customToken,
  }) {
    final _result = create();
    if (customToken != null) {
      _result.customToken = customToken;
    }
    return _result;
  }
  factory LoginResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginResp.fromJson($core.Map<$core.String,$core.dynamic> i) => create()..mergeFromProto3Json(i);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginResp clone() => LoginResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginResp copyWith(void Function(LoginResp) updates) => super.copyWith((message) => updates(message as LoginResp)) as LoginResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginResp create() => LoginResp._();
  LoginResp createEmptyInstance() => create();
  static $pb.PbList<LoginResp> createRepeated() => $pb.PbList<LoginResp>();
  @$core.pragma('dart2js:noInline')
  static LoginResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginResp>(create);
  static LoginResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get customToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set customToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCustomToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustomToken() => clearField(1);
}

class GetProfileReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetProfileReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.user.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  GetProfileReq._() : super();
  factory GetProfileReq({
    $core.String? uid,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory GetProfileReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProfileReq.fromJson($core.Map<$core.String,$core.dynamic> i) => create()..mergeFromProto3Json(i);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProfileReq clone() => GetProfileReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProfileReq copyWith(void Function(GetProfileReq) updates) => super.copyWith((message) => updates(message as GetProfileReq)) as GetProfileReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetProfileReq create() => GetProfileReq._();
  GetProfileReq createEmptyInstance() => create();
  static $pb.PbList<GetProfileReq> createRepeated() => $pb.PbList<GetProfileReq>();
  @$core.pragma('dart2js:noInline')
  static GetProfileReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProfileReq>(create);
  static GetProfileReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);
}

class Profile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Profile', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.user.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'displayName', protoName: 'displayName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatar')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nationality')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  Profile._() : super();
  factory Profile({
    $core.String? uid,
    $core.String? email,
    $core.String? displayName,
    $core.String? avatar,
    $core.String? name,
    $core.String? nationality,
    $core.String? id,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (email != null) {
      _result.email = email;
    }
    if (displayName != null) {
      _result.displayName = displayName;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nationality != null) {
      _result.nationality = nationality;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory Profile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Profile.fromJson($core.Map<$core.String,$core.dynamic> i) => create()..mergeFromProto3Json(i);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Profile clone() => Profile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Profile copyWith(void Function(Profile) updates) => super.copyWith((message) => updates(message as Profile)) as Profile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Profile create() => Profile._();
  Profile createEmptyInstance() => create();
  static $pb.PbList<Profile> createRepeated() => $pb.PbList<Profile>();
  @$core.pragma('dart2js:noInline')
  static Profile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Profile>(create);
  static Profile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get displayName => $_getSZ(2);
  @$pb.TagNumber(3)
  set displayName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDisplayName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatar($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatar() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get nationality => $_getSZ(5);
  @$pb.TagNumber(6)
  set nationality($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNationality() => $_has(5);
  @$pb.TagNumber(6)
  void clearNationality() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get id => $_getSZ(6);
  @$pb.TagNumber(7)
  set id($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasId() => $_has(6);
  @$pb.TagNumber(7)
  void clearId() => clearField(7);
}

class RefreshDeviceReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RefreshDeviceReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.user.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceModel', protoName: 'deviceModel')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceName', protoName: 'deviceName')
    ..e<RefreshDeviceReq_PushChannelType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pushChannel', $pb.PbFieldType.OE, protoName: 'pushChannel', defaultOrMaker: RefreshDeviceReq_PushChannelType.fcm, valueOf: RefreshDeviceReq_PushChannelType.valueOf, enumValues: RefreshDeviceReq_PushChannelType.values)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pushKey', protoName: 'pushKey')
    ..hasRequiredFields = false
  ;

  RefreshDeviceReq._() : super();
  factory RefreshDeviceReq({
    $core.String? deviceId,
    $core.String? deviceModel,
    $core.String? deviceName,
    RefreshDeviceReq_PushChannelType? pushChannel,
    $core.String? pushKey,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (deviceModel != null) {
      _result.deviceModel = deviceModel;
    }
    if (deviceName != null) {
      _result.deviceName = deviceName;
    }
    if (pushChannel != null) {
      _result.pushChannel = pushChannel;
    }
    if (pushKey != null) {
      _result.pushKey = pushKey;
    }
    return _result;
  }
  factory RefreshDeviceReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshDeviceReq.fromJson($core.Map<$core.String,$core.dynamic> i) => create()..mergeFromProto3Json(i);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshDeviceReq clone() => RefreshDeviceReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshDeviceReq copyWith(void Function(RefreshDeviceReq) updates) => super.copyWith((message) => updates(message as RefreshDeviceReq)) as RefreshDeviceReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshDeviceReq create() => RefreshDeviceReq._();
  RefreshDeviceReq createEmptyInstance() => create();
  static $pb.PbList<RefreshDeviceReq> createRepeated() => $pb.PbList<RefreshDeviceReq>();
  @$core.pragma('dart2js:noInline')
  static RefreshDeviceReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshDeviceReq>(create);
  static RefreshDeviceReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceModel => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceModel($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceModel() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceModel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceName => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceName() => clearField(3);

  @$pb.TagNumber(4)
  RefreshDeviceReq_PushChannelType get pushChannel => $_getN(3);
  @$pb.TagNumber(4)
  set pushChannel(RefreshDeviceReq_PushChannelType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPushChannel() => $_has(3);
  @$pb.TagNumber(4)
  void clearPushChannel() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get pushKey => $_getSZ(4);
  @$pb.TagNumber(5)
  set pushKey($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPushKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearPushKey() => clearField(5);
}

class GetDevicesResp_Device extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetDevicesResp.Device', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.user.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceModel', protoName: 'deviceModel')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceName', protoName: 'deviceName')
    ..aOM<$2.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastSeen', protoName: 'lastSeen', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  GetDevicesResp_Device._() : super();
  factory GetDevicesResp_Device({
    $core.String? deviceId,
    $core.String? deviceModel,
    $core.String? deviceName,
    $2.Timestamp? lastSeen,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (deviceModel != null) {
      _result.deviceModel = deviceModel;
    }
    if (deviceName != null) {
      _result.deviceName = deviceName;
    }
    if (lastSeen != null) {
      _result.lastSeen = lastSeen;
    }
    return _result;
  }
  factory GetDevicesResp_Device.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDevicesResp_Device.fromJson($core.Map<$core.String,$core.dynamic> i) => create()..mergeFromProto3Json(i);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDevicesResp_Device clone() => GetDevicesResp_Device()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDevicesResp_Device copyWith(void Function(GetDevicesResp_Device) updates) => super.copyWith((message) => updates(message as GetDevicesResp_Device)) as GetDevicesResp_Device; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDevicesResp_Device create() => GetDevicesResp_Device._();
  GetDevicesResp_Device createEmptyInstance() => create();
  static $pb.PbList<GetDevicesResp_Device> createRepeated() => $pb.PbList<GetDevicesResp_Device>();
  @$core.pragma('dart2js:noInline')
  static GetDevicesResp_Device getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDevicesResp_Device>(create);
  static GetDevicesResp_Device? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceModel => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceModel($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceModel() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceModel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceName => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceName() => clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get lastSeen => $_getN(3);
  @$pb.TagNumber(4)
  set lastSeen($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastSeen() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastSeen() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureLastSeen() => $_ensure(3);
}

class GetDevicesResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetDevicesResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.user.v4'), createEmptyInstance: create)
    ..pc<GetDevicesResp_Device>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'devices', $pb.PbFieldType.PM, subBuilder: GetDevicesResp_Device.create)
    ..hasRequiredFields = false
  ;

  GetDevicesResp._() : super();
  factory GetDevicesResp({
    $core.Iterable<GetDevicesResp_Device>? devices,
  }) {
    final _result = create();
    if (devices != null) {
      _result.devices.addAll(devices);
    }
    return _result;
  }
  factory GetDevicesResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDevicesResp.fromJson($core.Map<$core.String,$core.dynamic> i) => create()..mergeFromProto3Json(i);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDevicesResp clone() => GetDevicesResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDevicesResp copyWith(void Function(GetDevicesResp) updates) => super.copyWith((message) => updates(message as GetDevicesResp)) as GetDevicesResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDevicesResp create() => GetDevicesResp._();
  GetDevicesResp createEmptyInstance() => create();
  static $pb.PbList<GetDevicesResp> createRepeated() => $pb.PbList<GetDevicesResp>();
  @$core.pragma('dart2js:noInline')
  static GetDevicesResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDevicesResp>(create);
  static GetDevicesResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GetDevicesResp_Device> get devices => $_getList(0);
}

