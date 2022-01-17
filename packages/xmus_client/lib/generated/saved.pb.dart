///
//  Generated code. Do not modify.
//  source: saved.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SaveReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SaveReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refId', $pb.PbFieldType.O3, protoName: 'refId')
    ..hasRequiredFields = false
  ;

  SaveReq._() : super();
  factory SaveReq({
    $core.int? refId,
  }) {
    final _result = create();
    if (refId != null) {
      _result.refId = refId;
    }
    return _result;
  }
  factory SaveReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SaveReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SaveReq clone() => SaveReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SaveReq copyWith(void Function(SaveReq) updates) => super.copyWith((message) => updates(message as SaveReq)) as SaveReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SaveReq create() => SaveReq._();
  SaveReq createEmptyInstance() => create();
  static $pb.PbList<SaveReq> createRepeated() => $pb.PbList<SaveReq>();
  @$core.pragma('dart2js:noInline')
  static SaveReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaveReq>(create);
  static SaveReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get refId => $_getIZ(0);
  @$pb.TagNumber(1)
  set refId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);
}

class SaveResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SaveResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alreadySaved', protoName: 'alreadySaved')
    ..hasRequiredFields = false
  ;

  SaveResp._() : super();
  factory SaveResp({
    $core.bool? alreadySaved,
  }) {
    final _result = create();
    if (alreadySaved != null) {
      _result.alreadySaved = alreadySaved;
    }
    return _result;
  }
  factory SaveResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SaveResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SaveResp clone() => SaveResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SaveResp copyWith(void Function(SaveResp) updates) => super.copyWith((message) => updates(message as SaveResp)) as SaveResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SaveResp create() => SaveResp._();
  SaveResp createEmptyInstance() => create();
  static $pb.PbList<SaveResp> createRepeated() => $pb.PbList<SaveResp>();
  @$core.pragma('dart2js:noInline')
  static SaveResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaveResp>(create);
  static SaveResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get alreadySaved => $_getBF(0);
  @$pb.TagNumber(1)
  set alreadySaved($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAlreadySaved() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlreadySaved() => clearField(1);
}

class GetSavedReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetSavedReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageNo', $pb.PbFieldType.O3, protoName: 'pageNo')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageSize', $pb.PbFieldType.O3, protoName: 'pageSize')
    ..hasRequiredFields = false
  ;

  GetSavedReq._() : super();
  factory GetSavedReq({
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
  factory GetSavedReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSavedReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSavedReq clone() => GetSavedReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSavedReq copyWith(void Function(GetSavedReq) updates) => super.copyWith((message) => updates(message as GetSavedReq)) as GetSavedReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSavedReq create() => GetSavedReq._();
  GetSavedReq createEmptyInstance() => create();
  static $pb.PbList<GetSavedReq> createRepeated() => $pb.PbList<GetSavedReq>();
  @$core.pragma('dart2js:noInline')
  static GetSavedReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSavedReq>(create);
  static GetSavedReq? _defaultInstance;

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

