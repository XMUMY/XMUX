// This is a generated file - do not edit.
//
// Generated from lost_found/v4/lost_found.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $2;

import 'lost_found.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'lost_found.pbenum.dart';

class GetBriefsReq extends $pb.GeneratedMessage {
  factory GetBriefsReq({
    $2.Timestamp? before,
  }) {
    final result = create();
    if (before != null) result.before = before;
    return result;
  }

  GetBriefsReq._();

  factory GetBriefsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBriefsReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBriefsReq',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.lost_found.v4'),
      createEmptyInstance: create)
    ..aOM<$2.Timestamp>(1, _omitFieldNames ? '' : 'before',
        subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBriefsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBriefsReq copyWith(void Function(GetBriefsReq) updates) =>
      super.copyWith((message) => updates(message as GetBriefsReq))
          as GetBriefsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBriefsReq create() => GetBriefsReq._();
  @$core.override
  GetBriefsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBriefsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBriefsReq>(create);
  static GetBriefsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Timestamp get before => $_getN(0);
  @$pb.TagNumber(1)
  set before($2.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBefore() => $_has(0);
  @$pb.TagNumber(1)
  void clearBefore() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.Timestamp ensureBefore() => $_ensure(0);
}

class GetBriefsResp extends $pb.GeneratedMessage {
  factory GetBriefsResp({
    $core.Iterable<LostAndFoundBrief>? briefs,
  }) {
    final result = create();
    if (briefs != null) result.briefs.addAll(briefs);
    return result;
  }

  GetBriefsResp._();

  factory GetBriefsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBriefsResp.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBriefsResp',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.lost_found.v4'),
      createEmptyInstance: create)
    ..pPM<LostAndFoundBrief>(1, _omitFieldNames ? '' : 'briefs',
        subBuilder: LostAndFoundBrief.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBriefsResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBriefsResp copyWith(void Function(GetBriefsResp) updates) =>
      super.copyWith((message) => updates(message as GetBriefsResp))
          as GetBriefsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBriefsResp create() => GetBriefsResp._();
  @$core.override
  GetBriefsResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBriefsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBriefsResp>(create);
  static GetBriefsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<LostAndFoundBrief> get briefs => $_getList(0);
}

class LostAndFoundBrief extends $pb.GeneratedMessage {
  factory LostAndFoundBrief({
    $core.String? id,
    $core.String? uid,
    LostAndFoundType? type,
    $core.String? name,
    $2.Timestamp? time,
    $core.String? location,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (uid != null) result.uid = uid;
    if (type != null) result.type = type;
    if (name != null) result.name = name;
    if (time != null) result.time = time;
    if (location != null) result.location = location;
    return result;
  }

  LostAndFoundBrief._();

  factory LostAndFoundBrief.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LostAndFoundBrief.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LostAndFoundBrief',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.lost_found.v4'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'uid')
    ..aE<LostAndFoundType>(3, _omitFieldNames ? '' : 'type',
        enumValues: LostAndFoundType.values)
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'time',
        subBuilder: $2.Timestamp.create)
    ..aOS(6, _omitFieldNames ? '' : 'location')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LostAndFoundBrief clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LostAndFoundBrief copyWith(void Function(LostAndFoundBrief) updates) =>
      super.copyWith((message) => updates(message as LostAndFoundBrief))
          as LostAndFoundBrief;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LostAndFoundBrief create() => LostAndFoundBrief._();
  @$core.override
  LostAndFoundBrief createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LostAndFoundBrief getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LostAndFoundBrief>(create);
  static LostAndFoundBrief? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get uid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  @$pb.TagNumber(3)
  LostAndFoundType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(LostAndFoundType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get time => $_getN(4);
  @$pb.TagNumber(5)
  set time($2.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get location => $_getSZ(5);
  @$pb.TagNumber(6)
  set location($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLocation() => $_has(5);
  @$pb.TagNumber(6)
  void clearLocation() => $_clearField(6);
}

class GetDetailReq extends $pb.GeneratedMessage {
  factory GetDetailReq({
    $core.String? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  GetDetailReq._();

  factory GetDetailReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDetailReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDetailReq',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.lost_found.v4'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDetailReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDetailReq copyWith(void Function(GetDetailReq) updates) =>
      super.copyWith((message) => updates(message as GetDetailReq))
          as GetDetailReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDetailReq create() => GetDetailReq._();
  @$core.override
  GetDetailReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDetailReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDetailReq>(create);
  static GetDetailReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class LostAndFoundDetail extends $pb.GeneratedMessage {
  factory LostAndFoundDetail({
    $core.String? uid,
    LostAndFoundType? type,
    $core.String? name,
    $2.Timestamp? time,
    $core.String? location,
    $core.String? description,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? contacts,
    $core.Iterable<$core.String>? pictures,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (type != null) result.type = type;
    if (name != null) result.name = name;
    if (time != null) result.time = time;
    if (location != null) result.location = location;
    if (description != null) result.description = description;
    if (contacts != null) result.contacts.addEntries(contacts);
    if (pictures != null) result.pictures.addAll(pictures);
    return result;
  }

  LostAndFoundDetail._();

  factory LostAndFoundDetail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LostAndFoundDetail.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LostAndFoundDetail',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.lost_found.v4'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..aE<LostAndFoundType>(2, _omitFieldNames ? '' : 'type',
        enumValues: LostAndFoundType.values)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'time',
        subBuilder: $2.Timestamp.create)
    ..aOS(5, _omitFieldNames ? '' : 'location')
    ..aOS(6, _omitFieldNames ? '' : 'description')
    ..m<$core.String, $core.String>(7, _omitFieldNames ? '' : 'contacts',
        entryClassName: 'LostAndFoundDetail.ContactsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('xmux.lost_found.v4'))
    ..pPS(8, _omitFieldNames ? '' : 'pictures')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LostAndFoundDetail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LostAndFoundDetail copyWith(void Function(LostAndFoundDetail) updates) =>
      super.copyWith((message) => updates(message as LostAndFoundDetail))
          as LostAndFoundDetail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LostAndFoundDetail create() => LostAndFoundDetail._();
  @$core.override
  LostAndFoundDetail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LostAndFoundDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LostAndFoundDetail>(create);
  static LostAndFoundDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  LostAndFoundType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(LostAndFoundType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get time => $_getN(3);
  @$pb.TagNumber(4)
  set time($2.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearTime() => $_clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureTime() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get location => $_getSZ(4);
  @$pb.TagNumber(5)
  set location($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLocation() => $_has(4);
  @$pb.TagNumber(5)
  void clearLocation() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbMap<$core.String, $core.String> get contacts => $_getMap(6);

  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get pictures => $_getList(7);
}

class AddItemReq extends $pb.GeneratedMessage {
  factory AddItemReq({
    LostAndFoundType? type,
    $core.String? name,
    $2.Timestamp? time,
    $core.String? location,
    $core.String? description,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? contacts,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (name != null) result.name = name;
    if (time != null) result.time = time;
    if (location != null) result.location = location;
    if (description != null) result.description = description;
    if (contacts != null) result.contacts.addEntries(contacts);
    return result;
  }

  AddItemReq._();

  factory AddItemReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddItemReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddItemReq',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.lost_found.v4'),
      createEmptyInstance: create)
    ..aE<LostAndFoundType>(1, _omitFieldNames ? '' : 'type',
        enumValues: LostAndFoundType.values)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'time',
        subBuilder: $2.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'location')
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..m<$core.String, $core.String>(6, _omitFieldNames ? '' : 'contacts',
        entryClassName: 'AddItemReq.ContactsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('xmux.lost_found.v4'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddItemReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddItemReq copyWith(void Function(AddItemReq) updates) =>
      super.copyWith((message) => updates(message as AddItemReq)) as AddItemReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddItemReq create() => AddItemReq._();
  @$core.override
  AddItemReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddItemReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddItemReq>(create);
  static AddItemReq? _defaultInstance;

  @$pb.TagNumber(1)
  LostAndFoundType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(LostAndFoundType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get time => $_getN(2);
  @$pb.TagNumber(3)
  set time($2.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureTime() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get location => $_getSZ(3);
  @$pb.TagNumber(4)
  set location($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearLocation() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbMap<$core.String, $core.String> get contacts => $_getMap(5);
}

class DeleteItemReq extends $pb.GeneratedMessage {
  factory DeleteItemReq({
    $core.String? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  DeleteItemReq._();

  factory DeleteItemReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteItemReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteItemReq',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.lost_found.v4'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteItemReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteItemReq copyWith(void Function(DeleteItemReq) updates) =>
      super.copyWith((message) => updates(message as DeleteItemReq))
          as DeleteItemReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteItemReq create() => DeleteItemReq._();
  @$core.override
  DeleteItemReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteItemReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteItemReq>(create);
  static DeleteItemReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
