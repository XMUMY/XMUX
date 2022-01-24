///
//  Generated code. Do not modify.
//  source: notif.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $6;

import 'notif.pbenum.dart';

export 'notif.pbenum.dart';

class NotifMarkAsReadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NotifMarkAsReadReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..p<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ids', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  NotifMarkAsReadReq._() : super();
  factory NotifMarkAsReadReq({
    $core.Iterable<$core.int>? ids,
  }) {
    final _result = create();
    if (ids != null) {
      _result.ids.addAll(ids);
    }
    return _result;
  }
  factory NotifMarkAsReadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotifMarkAsReadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotifMarkAsReadReq clone() => NotifMarkAsReadReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotifMarkAsReadReq copyWith(void Function(NotifMarkAsReadReq) updates) => super.copyWith((message) => updates(message as NotifMarkAsReadReq)) as NotifMarkAsReadReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NotifMarkAsReadReq create() => NotifMarkAsReadReq._();
  NotifMarkAsReadReq createEmptyInstance() => create();
  static $pb.PbList<NotifMarkAsReadReq> createRepeated() => $pb.PbList<NotifMarkAsReadReq>();
  @$core.pragma('dart2js:noInline')
  static NotifMarkAsReadReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotifMarkAsReadReq>(create);
  static NotifMarkAsReadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ids => $_getList(0);
}

class GetNotifNumResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetNotifNumResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'num', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetNotifNumResp._() : super();
  factory GetNotifNumResp({
    $core.int? num,
  }) {
    final _result = create();
    if (num != null) {
      _result.num = num;
    }
    return _result;
  }
  factory GetNotifNumResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotifNumResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotifNumResp clone() => GetNotifNumResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotifNumResp copyWith(void Function(GetNotifNumResp) updates) => super.copyWith((message) => updates(message as GetNotifNumResp)) as GetNotifNumResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetNotifNumResp create() => GetNotifNumResp._();
  GetNotifNumResp createEmptyInstance() => create();
  static $pb.PbList<GetNotifNumResp> createRepeated() => $pb.PbList<GetNotifNumResp>();
  @$core.pragma('dart2js:noInline')
  static GetNotifNumResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotifNumResp>(create);
  static GetNotifNumResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get num => $_getIZ(0);
  @$pb.TagNumber(1)
  set num($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearNum() => clearField(1);
}

class GetNotifReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetNotifReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageNo', $pb.PbFieldType.O3, protoName: 'pageNo')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageSize', $pb.PbFieldType.O3, protoName: 'pageSize')
    ..hasRequiredFields = false
  ;

  GetNotifReq._() : super();
  factory GetNotifReq({
    $core.int? pageNo,
    $core.int? pageSize,
  }) {
    final _result = create();
    if (pageNo != null) {
      _result.pageNo = pageNo;
    }
    if (pageSize != null) {
      _result.pageSize = pageSize;
    }
    return _result;
  }
  factory GetNotifReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotifReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotifReq clone() => GetNotifReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotifReq copyWith(void Function(GetNotifReq) updates) => super.copyWith((message) => updates(message as GetNotifReq)) as GetNotifReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetNotifReq create() => GetNotifReq._();
  GetNotifReq createEmptyInstance() => create();
  static $pb.PbList<GetNotifReq> createRepeated() => $pb.PbList<GetNotifReq>();
  @$core.pragma('dart2js:noInline')
  static GetNotifReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotifReq>(create);
  static GetNotifReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageNo => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageNo($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageNo() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageNo() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => clearField(2);
}

class GetNotifResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetNotifResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..pc<Notif>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notifs', $pb.PbFieldType.PM, subBuilder: Notif.create)
    ..hasRequiredFields = false
  ;

  GetNotifResp._() : super();
  factory GetNotifResp({
    $core.Iterable<Notif>? notifs,
  }) {
    final _result = create();
    if (notifs != null) {
      _result.notifs.addAll(notifs);
    }
    return _result;
  }
  factory GetNotifResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotifResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotifResp clone() => GetNotifResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotifResp copyWith(void Function(GetNotifResp) updates) => super.copyWith((message) => updates(message as GetNotifResp)) as GetNotifResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetNotifResp create() => GetNotifResp._();
  GetNotifResp createEmptyInstance() => create();
  static $pb.PbList<GetNotifResp> createRepeated() => $pb.PbList<GetNotifResp>();
  @$core.pragma('dart2js:noInline')
  static GetNotifResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotifResp>(create);
  static GetNotifResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Notif> get notifs => $_getList(0);
}

class Notif extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Notif', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..e<NotifType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: NotifType.POST_REPLY, valueOf: NotifType.valueOf, enumValues: NotifType.values)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refId', $pb.PbFieldType.O3, protoName: 'refId')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'objId', $pb.PbFieldType.O3, protoName: 'objId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refContent', protoName: 'refContent')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'objContent', protoName: 'objContent')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasRead', protoName: 'hasRead')
    ..aOM<$6.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime', protoName: 'createTime', subBuilder: $6.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Notif._() : super();
  factory Notif({
    $core.int? id,
    NotifType? type,
    $core.int? refId,
    $core.int? objId,
    $core.String? refContent,
    $core.String? objContent,
    $core.bool? hasRead,
    $6.Timestamp? createTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    if (refId != null) {
      _result.refId = refId;
    }
    if (objId != null) {
      _result.objId = objId;
    }
    if (refContent != null) {
      _result.refContent = refContent;
    }
    if (objContent != null) {
      _result.objContent = objContent;
    }
    if (hasRead != null) {
      _result.hasRead = hasRead;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    return _result;
  }
  factory Notif.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Notif.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Notif clone() => Notif()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Notif copyWith(void Function(Notif) updates) => super.copyWith((message) => updates(message as Notif)) as Notif; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Notif create() => Notif._();
  Notif createEmptyInstance() => create();
  static $pb.PbList<Notif> createRepeated() => $pb.PbList<Notif>();
  @$core.pragma('dart2js:noInline')
  static Notif getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notif>(create);
  static Notif? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  NotifType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(NotifType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get refId => $_getIZ(2);
  @$pb.TagNumber(3)
  set refId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get objId => $_getIZ(3);
  @$pb.TagNumber(4)
  set objId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasObjId() => $_has(3);
  @$pb.TagNumber(4)
  void clearObjId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get refContent => $_getSZ(4);
  @$pb.TagNumber(5)
  set refContent($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRefContent() => $_has(4);
  @$pb.TagNumber(5)
  void clearRefContent() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get objContent => $_getSZ(5);
  @$pb.TagNumber(6)
  set objContent($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasObjContent() => $_has(5);
  @$pb.TagNumber(6)
  void clearObjContent() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get hasRead => $_getBF(6);
  @$pb.TagNumber(7)
  set hasRead($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasHasRead() => $_has(6);
  @$pb.TagNumber(7)
  void clearHasRead() => clearField(7);

  @$pb.TagNumber(8)
  $6.Timestamp get createTime => $_getN(7);
  @$pb.TagNumber(8)
  set createTime($6.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreateTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreateTime() => clearField(8);
  @$pb.TagNumber(8)
  $6.Timestamp ensureCreateTime() => $_ensure(7);
}

