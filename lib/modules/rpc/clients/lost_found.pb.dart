///
//  Generated code. Do not modify.
//  source: lost_found.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $2;
import 'lost_found.pbenum.dart';

export 'lost_found.pbenum.dart';

class GetBriefsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetBriefsReq',
      package: const $pb.PackageName('xmux.lost_found.v4'),
      createEmptyInstance: create)
    ..aOM<$2.Timestamp>(1, 'before', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  GetBriefsReq._() : super();

  factory GetBriefsReq() => create();

  factory GetBriefsReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory GetBriefsReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  GetBriefsReq clone() => GetBriefsReq()..mergeFromMessage(this);

  GetBriefsReq copyWith(void Function(GetBriefsReq) updates) =>
      super.copyWith((message) => updates(message as GetBriefsReq));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBriefsReq create() => GetBriefsReq._();

  GetBriefsReq createEmptyInstance() => create();

  static $pb.PbList<GetBriefsReq> createRepeated() =>
      $pb.PbList<GetBriefsReq>();

  @$core.pragma('dart2js:noInline')
  static GetBriefsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBriefsReq>(create);
  static GetBriefsReq _defaultInstance;

  @$pb.TagNumber(1)
  $2.Timestamp get before => $_getN(0);

  @$pb.TagNumber(1)
  set before($2.Timestamp v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBefore() => $_has(0);

  @$pb.TagNumber(1)
  void clearBefore() => clearField(1);

  @$pb.TagNumber(1)
  $2.Timestamp ensureBefore() => $_ensure(0);
}

class GetBriefsResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetBriefsResp',
      package: const $pb.PackageName('xmux.lost_found.v4'),
      createEmptyInstance: create)
    ..pc<LostAndFoundBrief>(1, 'briefs', $pb.PbFieldType.PM,
        subBuilder: LostAndFoundBrief.create)
    ..hasRequiredFields = false;

  GetBriefsResp._() : super();

  factory GetBriefsResp() => create();

  factory GetBriefsResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory GetBriefsResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  GetBriefsResp clone() => GetBriefsResp()..mergeFromMessage(this);

  GetBriefsResp copyWith(void Function(GetBriefsResp) updates) =>
      super.copyWith((message) => updates(message as GetBriefsResp));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBriefsResp create() => GetBriefsResp._();

  GetBriefsResp createEmptyInstance() => create();

  static $pb.PbList<GetBriefsResp> createRepeated() =>
      $pb.PbList<GetBriefsResp>();

  @$core.pragma('dart2js:noInline')
  static GetBriefsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBriefsResp>(create);
  static GetBriefsResp _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<LostAndFoundBrief> get briefs => $_getList(0);
}

class LostAndFoundBrief extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LostAndFoundBrief',
      package: const $pb.PackageName('xmux.lost_found.v4'),
      createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'uid')
    ..e<LostAndFoundType>(3, 'type', $pb.PbFieldType.OE,
        defaultOrMaker: LostAndFoundType.Lost,
        valueOf: LostAndFoundType.valueOf,
        enumValues: LostAndFoundType.values)
    ..aOS(4, 'name')
    ..aOM<$2.Timestamp>(5, 'time', subBuilder: $2.Timestamp.create)
    ..aOS(6, 'location')
    ..hasRequiredFields = false;

  LostAndFoundBrief._() : super();

  factory LostAndFoundBrief() => create();

  factory LostAndFoundBrief.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory LostAndFoundBrief.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  LostAndFoundBrief clone() => LostAndFoundBrief()..mergeFromMessage(this);

  LostAndFoundBrief copyWith(void Function(LostAndFoundBrief) updates) =>
      super.copyWith((message) => updates(message as LostAndFoundBrief));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LostAndFoundBrief create() => LostAndFoundBrief._();

  LostAndFoundBrief createEmptyInstance() => create();

  static $pb.PbList<LostAndFoundBrief> createRepeated() =>
      $pb.PbList<LostAndFoundBrief>();

  @$core.pragma('dart2js:noInline')
  static LostAndFoundBrief getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LostAndFoundBrief>(create);
  static LostAndFoundBrief _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);

  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uid => $_getSZ(1);

  @$pb.TagNumber(2)
  set uid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);

  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

  @$pb.TagNumber(3)
  LostAndFoundType get type => $_getN(2);

  @$pb.TagNumber(3)
  set type(LostAndFoundType v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);

  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);

  @$pb.TagNumber(4)
  set name($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);

  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get time => $_getN(4);

  @$pb.TagNumber(5)
  set time($2.Timestamp v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);

  @$pb.TagNumber(5)
  void clearTime() => clearField(5);

  @$pb.TagNumber(5)
  $2.Timestamp ensureTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get location => $_getSZ(5);

  @$pb.TagNumber(6)
  set location($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLocation() => $_has(5);

  @$pb.TagNumber(6)
  void clearLocation() => clearField(6);
}

class GetDetailReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetDetailReq',
      package: const $pb.PackageName('xmux.lost_found.v4'),
      createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false;

  GetDetailReq._() : super();

  factory GetDetailReq() => create();

  factory GetDetailReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory GetDetailReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  GetDetailReq clone() => GetDetailReq()..mergeFromMessage(this);

  GetDetailReq copyWith(void Function(GetDetailReq) updates) =>
      super.copyWith((message) => updates(message as GetDetailReq));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDetailReq create() => GetDetailReq._();

  GetDetailReq createEmptyInstance() => create();

  static $pb.PbList<GetDetailReq> createRepeated() =>
      $pb.PbList<GetDetailReq>();

  @$core.pragma('dart2js:noInline')
  static GetDetailReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDetailReq>(create);
  static GetDetailReq _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);

  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class LostAndFoundDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LostAndFoundDetail',
      package: const $pb.PackageName('xmux.lost_found.v4'),
      createEmptyInstance: create)
    ..aOS(1, 'uid')
    ..e<LostAndFoundType>(2, 'type', $pb.PbFieldType.OE,
        defaultOrMaker: LostAndFoundType.Lost,
        valueOf: LostAndFoundType.valueOf,
        enumValues: LostAndFoundType.values)
    ..aOS(3, 'name')
    ..aOM<$2.Timestamp>(4, 'time', subBuilder: $2.Timestamp.create)
    ..aOS(5, 'location')
    ..aOS(6, 'description')
    ..m<$core.String, $core.String>(7, 'contacts',
        entryClassName: 'LostAndFoundDetail.ContactsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('xmux.lost_found.v4'))
    ..pPS(8, 'pictures')
    ..hasRequiredFields = false;

  LostAndFoundDetail._() : super();

  factory LostAndFoundDetail() => create();

  factory LostAndFoundDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory LostAndFoundDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  LostAndFoundDetail clone() => LostAndFoundDetail()..mergeFromMessage(this);

  LostAndFoundDetail copyWith(void Function(LostAndFoundDetail) updates) =>
      super.copyWith((message) => updates(message as LostAndFoundDetail));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LostAndFoundDetail create() => LostAndFoundDetail._();

  LostAndFoundDetail createEmptyInstance() => create();

  static $pb.PbList<LostAndFoundDetail> createRepeated() =>
      $pb.PbList<LostAndFoundDetail>();

  @$core.pragma('dart2js:noInline')
  static LostAndFoundDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LostAndFoundDetail>(create);
  static LostAndFoundDetail _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);

  @$pb.TagNumber(1)
  set uid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);

  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  LostAndFoundType get type => $_getN(1);

  @$pb.TagNumber(2)
  set type(LostAndFoundType v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);

  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);

  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);

  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get time => $_getN(3);

  @$pb.TagNumber(4)
  set time($2.Timestamp v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTime() => $_has(3);

  @$pb.TagNumber(4)
  void clearTime() => clearField(4);

  @$pb.TagNumber(4)
  $2.Timestamp ensureTime() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get location => $_getSZ(4);

  @$pb.TagNumber(5)
  set location($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLocation() => $_has(4);

  @$pb.TagNumber(5)
  void clearLocation() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);

  @$pb.TagNumber(6)
  set description($core.String v) {
    $_setString(5, v);
  }

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddItemReq',
      package: const $pb.PackageName('xmux.lost_found.v4'),
      createEmptyInstance: create)
    ..e<LostAndFoundType>(1, 'type', $pb.PbFieldType.OE,
        defaultOrMaker: LostAndFoundType.Lost,
        valueOf: LostAndFoundType.valueOf,
        enumValues: LostAndFoundType.values)
    ..aOS(2, 'name')
    ..aOM<$2.Timestamp>(3, 'time', subBuilder: $2.Timestamp.create)
    ..aOS(4, 'location')
    ..aOS(5, 'description')
    ..m<$core.String, $core.String>(6, 'contacts',
        entryClassName: 'AddItemReq.ContactsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('xmux.lost_found.v4'))
    ..hasRequiredFields = false;

  AddItemReq._() : super();

  factory AddItemReq() => create();

  factory AddItemReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory AddItemReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  AddItemReq clone() => AddItemReq()..mergeFromMessage(this);

  AddItemReq copyWith(void Function(AddItemReq) updates) =>
      super.copyWith((message) => updates(message as AddItemReq));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddItemReq create() => AddItemReq._();

  AddItemReq createEmptyInstance() => create();

  static $pb.PbList<AddItemReq> createRepeated() => $pb.PbList<AddItemReq>();

  @$core.pragma('dart2js:noInline')
  static AddItemReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddItemReq>(create);
  static AddItemReq _defaultInstance;

  @$pb.TagNumber(1)
  LostAndFoundType get type => $_getN(0);

  @$pb.TagNumber(1)
  set type(LostAndFoundType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);

  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);

  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);

  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get time => $_getN(2);

  @$pb.TagNumber(3)
  set time($2.Timestamp v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);

  @$pb.TagNumber(3)
  void clearTime() => clearField(3);

  @$pb.TagNumber(3)
  $2.Timestamp ensureTime() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get location => $_getSZ(3);

  @$pb.TagNumber(4)
  set location($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLocation() => $_has(3);

  @$pb.TagNumber(4)
  void clearLocation() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);

  @$pb.TagNumber(5)
  set description($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);

  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);

  @$pb.TagNumber(6)
  $core.Map<$core.String, $core.String> get contacts => $_getMap(5);
}

class DeleteItemReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeleteItemReq',
      package: const $pb.PackageName('xmux.lost_found.v4'),
      createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false;

  DeleteItemReq._() : super();

  factory DeleteItemReq() => create();

  factory DeleteItemReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory DeleteItemReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  DeleteItemReq clone() => DeleteItemReq()..mergeFromMessage(this);

  DeleteItemReq copyWith(void Function(DeleteItemReq) updates) =>
      super.copyWith((message) => updates(message as DeleteItemReq));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteItemReq create() => DeleteItemReq._();

  DeleteItemReq createEmptyInstance() => create();

  static $pb.PbList<DeleteItemReq> createRepeated() =>
      $pb.PbList<DeleteItemReq>();

  @$core.pragma('dart2js:noInline')
  static DeleteItemReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteItemReq>(create);
  static DeleteItemReq _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);

  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}
