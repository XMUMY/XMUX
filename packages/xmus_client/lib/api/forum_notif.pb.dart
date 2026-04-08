// This is a generated file - do not edit.
//
// Generated from forum_notif.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $0;

import 'forum_notif.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'forum_notif.pbenum.dart';

class NotifMarkAsReadReq extends $pb.GeneratedMessage {
  factory NotifMarkAsReadReq({
    $core.Iterable<$core.int>? ids,
  }) {
    final result = create();
    if (ids != null) result.ids.addAll(ids);
    return result;
  }

  NotifMarkAsReadReq._();

  factory NotifMarkAsReadReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifMarkAsReadReq.fromJson(
          $core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifMarkAsReadReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.K3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifMarkAsReadReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifMarkAsReadReq copyWith(void Function(NotifMarkAsReadReq) updates) =>
      super.copyWith((message) => updates(message as NotifMarkAsReadReq))
          as NotifMarkAsReadReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifMarkAsReadReq create() => NotifMarkAsReadReq._();
  @$core.override
  NotifMarkAsReadReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotifMarkAsReadReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NotifMarkAsReadReq>(create);
  static NotifMarkAsReadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.int> get ids => $_getList(0);
}

class GetNotifNumResp extends $pb.GeneratedMessage {
  factory GetNotifNumResp({
    $core.int? num,
  }) {
    final result = create();
    if (num != null) result.num = num;
    return result;
  }

  GetNotifNumResp._();

  factory GetNotifNumResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetNotifNumResp.fromJson(
          $core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetNotifNumResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'num')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNotifNumResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNotifNumResp copyWith(void Function(GetNotifNumResp) updates) =>
      super.copyWith((message) => updates(message as GetNotifNumResp))
          as GetNotifNumResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotifNumResp create() => GetNotifNumResp._();
  @$core.override
  GetNotifNumResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetNotifNumResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetNotifNumResp>(create);
  static GetNotifNumResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get num => $_getIZ(0);
  @$pb.TagNumber(1)
  set num($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearNum() => $_clearField(1);
}

class GetNotifReq extends $pb.GeneratedMessage {
  factory GetNotifReq({
    $core.int? pageNo,
    $core.int? pageSize,
  }) {
    final result = create();
    if (pageNo != null) result.pageNo = pageNo;
    if (pageSize != null) result.pageSize = pageSize;
    return result;
  }

  GetNotifReq._();

  factory GetNotifReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetNotifReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetNotifReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'pageNo', protoName: 'pageNo')
    ..aI(2, _omitFieldNames ? '' : 'pageSize', protoName: 'pageSize')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNotifReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNotifReq copyWith(void Function(GetNotifReq) updates) =>
      super.copyWith((message) => updates(message as GetNotifReq))
          as GetNotifReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotifReq create() => GetNotifReq._();
  @$core.override
  GetNotifReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetNotifReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetNotifReq>(create);
  static GetNotifReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageNo => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageNo($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPageNo() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageNo() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => $_clearField(2);
}

class GetNotifResp extends $pb.GeneratedMessage {
  factory GetNotifResp({
    $core.Iterable<Notif>? notifs,
  }) {
    final result = create();
    if (notifs != null) result.notifs.addAll(notifs);
    return result;
  }

  GetNotifResp._();

  factory GetNotifResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetNotifResp.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetNotifResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..pPM<Notif>(1, _omitFieldNames ? '' : 'notifs', subBuilder: Notif.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNotifResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNotifResp copyWith(void Function(GetNotifResp) updates) =>
      super.copyWith((message) => updates(message as GetNotifResp))
          as GetNotifResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotifResp create() => GetNotifResp._();
  @$core.override
  GetNotifResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetNotifResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetNotifResp>(create);
  static GetNotifResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Notif> get notifs => $_getList(0);
}

class Notif extends $pb.GeneratedMessage {
  factory Notif({
    $core.int? id,
    NotifType? type,
    $core.int? refId,
    $core.int? objId,
    $core.String? refContent,
    $core.String? objContent,
    $core.bool? hasRead,
    $0.Timestamp? createTime,
    $core.String? senderUid,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (refId != null) result.refId = refId;
    if (objId != null) result.objId = objId;
    if (refContent != null) result.refContent = refContent;
    if (objContent != null) result.objContent = objContent;
    if (hasRead != null) result.hasRead = hasRead;
    if (createTime != null) result.createTime = createTime;
    if (senderUid != null) result.senderUid = senderUid;
    return result;
  }

  Notif._();

  factory Notif.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Notif.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Notif',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aE<NotifType>(2, _omitFieldNames ? '' : 'type',
        enumValues: NotifType.values)
    ..aI(3, _omitFieldNames ? '' : 'refId', protoName: 'refId')
    ..aI(4, _omitFieldNames ? '' : 'objId', protoName: 'objId')
    ..aOS(5, _omitFieldNames ? '' : 'refContent', protoName: 'refContent')
    ..aOS(6, _omitFieldNames ? '' : 'objContent', protoName: 'objContent')
    ..aOB(7, _omitFieldNames ? '' : 'hasRead', protoName: 'hasRead')
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'createTime',
        protoName: 'createTime', subBuilder: $0.Timestamp.create)
    ..aOS(9, _omitFieldNames ? '' : 'senderUid', protoName: 'senderUid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Notif clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Notif copyWith(void Function(Notif) updates) =>
      super.copyWith((message) => updates(message as Notif)) as Notif;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Notif create() => Notif._();
  @$core.override
  Notif createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Notif getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notif>(create);
  static Notif? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  NotifType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(NotifType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get refId => $_getIZ(2);
  @$pb.TagNumber(3)
  set refId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRefId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get objId => $_getIZ(3);
  @$pb.TagNumber(4)
  set objId($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasObjId() => $_has(3);
  @$pb.TagNumber(4)
  void clearObjId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get refContent => $_getSZ(4);
  @$pb.TagNumber(5)
  set refContent($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRefContent() => $_has(4);
  @$pb.TagNumber(5)
  void clearRefContent() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get objContent => $_getSZ(5);
  @$pb.TagNumber(6)
  set objContent($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasObjContent() => $_has(5);
  @$pb.TagNumber(6)
  void clearObjContent() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get hasRead => $_getBF(6);
  @$pb.TagNumber(7)
  set hasRead($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasHasRead() => $_has(6);
  @$pb.TagNumber(7)
  void clearHasRead() => $_clearField(7);

  @$pb.TagNumber(8)
  $0.Timestamp get createTime => $_getN(7);
  @$pb.TagNumber(8)
  set createTime($0.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasCreateTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreateTime() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureCreateTime() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get senderUid => $_getSZ(8);
  @$pb.TagNumber(9)
  set senderUid($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasSenderUid() => $_has(8);
  @$pb.TagNumber(9)
  void clearSenderUid() => $_clearField(9);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
