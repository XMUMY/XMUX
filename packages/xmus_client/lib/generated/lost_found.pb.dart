///
//  Generated code. Do not modify.
//  source: lost_found.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $2;

import 'lost_found.pbenum.dart';

export 'lost_found.pbenum.dart';

class GetBriefsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBriefsReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.lost_found.v4'), createEmptyInstance: create)
    ..aOM<$2.Timestamp>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'before', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  GetBriefsReq._() : super();
  factory GetBriefsReq({
    $2.Timestamp? before,
  }) {
    final _result = create();
    if (before != null) {
      _result.before = before;
    }
    return _result;
  }
  factory GetBriefsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBriefsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBriefsReq clone() => GetBriefsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBriefsReq copyWith(void Function(GetBriefsReq) updates) => super.copyWith((message) => updates(message as GetBriefsReq)) as GetBriefsReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBriefsReq create() => GetBriefsReq._();
  GetBriefsReq createEmptyInstance() => create();
  static $pb.PbList<GetBriefsReq> createRepeated() => $pb.PbList<GetBriefsReq>();
  @$core.pragma('dart2js:noInline')
  static GetBriefsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBriefsReq>(create);
  static GetBriefsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Timestamp get before => $_getN(0);
  @$pb.TagNumber(1)
  set before($2.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBefore() => $_has(0);
  @$pb.TagNumber(1)
  void clearBefore() => clearField(1);
  @$pb.TagNumber(1)
  $2.Timestamp ensureBefore() => $_ensure(0);
}

class GetBriefsResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBriefsResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.lost_found.v4'), createEmptyInstance: create)
    ..pc<LostAndFoundBrief>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'briefs', $pb.PbFieldType.PM, subBuilder: LostAndFoundBrief.create)
    ..hasRequiredFields = false
  ;

  GetBriefsResp._() : super();
  factory GetBriefsResp({
    $core.Iterable<LostAndFoundBrief>? briefs,
  }) {
    final _result = create();
    if (briefs != null) {
      _result.briefs.addAll(briefs);
    }
    return _result;
  }
  factory GetBriefsResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBriefsResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBriefsResp clone() => GetBriefsResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBriefsResp copyWith(void Function(GetBriefsResp) updates) => super.copyWith((message) => updates(message as GetBriefsResp)) as GetBriefsResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBriefsResp create() => GetBriefsResp._();
  GetBriefsResp createEmptyInstance() => create();
  static $pb.PbList<GetBriefsResp> createRepeated() => $pb.PbList<GetBriefsResp>();
  @$core.pragma('dart2js:noInline')
  static GetBriefsResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBriefsResp>(create);
  static GetBriefsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<LostAndFoundBrief> get briefs => $_getList(0);
}

class LostAndFoundBrief extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LostAndFoundBrief', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.lost_found.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..e<LostAndFoundType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: LostAndFoundType.Lost, valueOf: LostAndFoundType.valueOf, enumValues: LostAndFoundType.values)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<$2.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time', subBuilder: $2.Timestamp.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'location')
    ..hasRequiredFields = false
  ;

  LostAndFoundBrief._() : super();
  factory LostAndFoundBrief({
    $core.String? id,
    $core.String? uid,
    LostAndFoundType? type,
    $core.String? name,
    $2.Timestamp? time,
    $core.String? location,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (type != null) {
      _result.type = type;
    }
    if (name != null) {
      _result.name = name;
    }
    if (time != null) {
      _result.time = time;
    }
    if (location != null) {
      _result.location = location;
    }
    return _result;
  }
  factory LostAndFoundBrief.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LostAndFoundBrief.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LostAndFoundBrief clone() => LostAndFoundBrief()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LostAndFoundBrief copyWith(void Function(LostAndFoundBrief) updates) => super.copyWith((message) => updates(message as LostAndFoundBrief)) as LostAndFoundBrief; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LostAndFoundBrief create() => LostAndFoundBrief._();
  LostAndFoundBrief createEmptyInstance() => create();
  static $pb.PbList<LostAndFoundBrief> createRepeated() => $pb.PbList<LostAndFoundBrief>();
  @$core.pragma('dart2js:noInline')
  static LostAndFoundBrief getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LostAndFoundBrief>(create);
  static LostAndFoundBrief? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

  @$pb.TagNumber(3)
  LostAndFoundType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(LostAndFoundType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get time => $_getN(4);
  @$pb.TagNumber(5)
  set time($2.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get location => $_getSZ(5);
  @$pb.TagNumber(6)
  set location($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLocation() => $_has(5);
  @$pb.TagNumber(6)
  void clearLocation() => clearField(6);
}

class GetDetailReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetDetailReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.lost_found.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  GetDetailReq._() : super();
  factory GetDetailReq({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory GetDetailReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDetailReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDetailReq clone() => GetDetailReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDetailReq copyWith(void Function(GetDetailReq) updates) => super.copyWith((message) => updates(message as GetDetailReq)) as GetDetailReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDetailReq create() => GetDetailReq._();
  GetDetailReq createEmptyInstance() => create();
  static $pb.PbList<GetDetailReq> createRepeated() => $pb.PbList<GetDetailReq>();
  @$core.pragma('dart2js:noInline')
  static GetDetailReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDetailReq>(create);
  static GetDetailReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class LostAndFoundDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LostAndFoundDetail', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.lost_found.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..e<LostAndFoundType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: LostAndFoundType.Lost, valueOf: LostAndFoundType.valueOf, enumValues: LostAndFoundType.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<$2.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time', subBuilder: $2.Timestamp.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'location')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..m<$core.String, $core.String>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contacts', entryClassName: 'LostAndFoundDetail.ContactsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('xmux.lost_found.v4'))
    ..pPS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pictures')
    ..hasRequiredFields = false
  ;

  LostAndFoundDetail._() : super();
  factory LostAndFoundDetail({
    $core.String? uid,
    LostAndFoundType? type,
    $core.String? name,
    $2.Timestamp? time,
    $core.String? location,
    $core.String? description,
    $core.Map<$core.String, $core.String>? contacts,
    $core.Iterable<$core.String>? pictures,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (type != null) {
      _result.type = type;
    }
    if (name != null) {
      _result.name = name;
    }
    if (time != null) {
      _result.time = time;
    }
    if (location != null) {
      _result.location = location;
    }
    if (description != null) {
      _result.description = description;
    }
    if (contacts != null) {
      _result.contacts.addAll(contacts);
    }
    if (pictures != null) {
      _result.pictures.addAll(pictures);
    }
    return _result;
  }
  factory LostAndFoundDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LostAndFoundDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LostAndFoundDetail clone() => LostAndFoundDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LostAndFoundDetail copyWith(void Function(LostAndFoundDetail) updates) => super.copyWith((message) => updates(message as LostAndFoundDetail)) as LostAndFoundDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LostAndFoundDetail create() => LostAndFoundDetail._();
  LostAndFoundDetail createEmptyInstance() => create();
  static $pb.PbList<LostAndFoundDetail> createRepeated() => $pb.PbList<LostAndFoundDetail>();
  @$core.pragma('dart2js:noInline')
  static LostAndFoundDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LostAndFoundDetail>(create);
  static LostAndFoundDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  LostAndFoundType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(LostAndFoundType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get time => $_getN(3);
  @$pb.TagNumber(4)
  set time($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearTime() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureTime() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get location => $_getSZ(4);
  @$pb.TagNumber(5)
  set location($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLocation() => $_has(4);
  @$pb.TagNumber(5)
  void clearLocation() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);

  @$pb.TagNumber(7)
  $core.Map<$core.String, $core.String> get contacts => $_getMap(6);

  @$pb.TagNumber(8)
  $core.List<$core.String> get pictures => $_getList(7);
}

class AddItemReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddItemReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.lost_found.v4'), createEmptyInstance: create)
    ..e<LostAndFoundType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: LostAndFoundType.Lost, valueOf: LostAndFoundType.valueOf, enumValues: LostAndFoundType.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<$2.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time', subBuilder: $2.Timestamp.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'location')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..m<$core.String, $core.String>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contacts', entryClassName: 'AddItemReq.ContactsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('xmux.lost_found.v4'))
    ..hasRequiredFields = false
  ;

  AddItemReq._() : super();
  factory AddItemReq({
    LostAndFoundType? type,
    $core.String? name,
    $2.Timestamp? time,
    $core.String? location,
    $core.String? description,
    $core.Map<$core.String, $core.String>? contacts,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (name != null) {
      _result.name = name;
    }
    if (time != null) {
      _result.time = time;
    }
    if (location != null) {
      _result.location = location;
    }
    if (description != null) {
      _result.description = description;
    }
    if (contacts != null) {
      _result.contacts.addAll(contacts);
    }
    return _result;
  }
  factory AddItemReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddItemReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddItemReq clone() => AddItemReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddItemReq copyWith(void Function(AddItemReq) updates) => super.copyWith((message) => updates(message as AddItemReq)) as AddItemReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddItemReq create() => AddItemReq._();
  AddItemReq createEmptyInstance() => create();
  static $pb.PbList<AddItemReq> createRepeated() => $pb.PbList<AddItemReq>();
  @$core.pragma('dart2js:noInline')
  static AddItemReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddItemReq>(create);
  static AddItemReq? _defaultInstance;

  @$pb.TagNumber(1)
  LostAndFoundType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(LostAndFoundType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get time => $_getN(2);
  @$pb.TagNumber(3)
  set time($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureTime() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get location => $_getSZ(3);
  @$pb.TagNumber(4)
  set location($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearLocation() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);

  @$pb.TagNumber(6)
  $core.Map<$core.String, $core.String> get contacts => $_getMap(5);
}

class DeleteItemReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteItemReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.lost_found.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  DeleteItemReq._() : super();
  factory DeleteItemReq({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory DeleteItemReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteItemReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteItemReq clone() => DeleteItemReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteItemReq copyWith(void Function(DeleteItemReq) updates) => super.copyWith((message) => updates(message as DeleteItemReq)) as DeleteItemReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteItemReq create() => DeleteItemReq._();
  DeleteItemReq createEmptyInstance() => create();
  static $pb.PbList<DeleteItemReq> createRepeated() => $pb.PbList<DeleteItemReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteItemReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteItemReq>(create);
  static DeleteItemReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

