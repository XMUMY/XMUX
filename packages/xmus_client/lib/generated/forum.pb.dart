///
//  Generated code. Do not modify.
//  source: forum.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CreateForumReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateForumReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  CreateForumReq._() : super();
  factory CreateForumReq({
    $core.String? title,
    $core.String? description,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory CreateForumReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateForumReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateForumReq clone() => CreateForumReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateForumReq copyWith(void Function(CreateForumReq) updates) => super.copyWith((message) => updates(message as CreateForumReq)) as CreateForumReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateForumReq create() => CreateForumReq._();
  CreateForumReq createEmptyInstance() => create();
  static $pb.PbList<CreateForumReq> createRepeated() => $pb.PbList<CreateForumReq>();
  @$core.pragma('dart2js:noInline')
  static CreateForumReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateForumReq>(create);
  static CreateForumReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);
}

class CreateForumResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateForumResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'forumId', $pb.PbFieldType.O3, protoName: 'forumId')
    ..hasRequiredFields = false
  ;

  CreateForumResp._() : super();
  factory CreateForumResp({
    $core.int? forumId,
  }) {
    final _result = create();
    if (forumId != null) {
      _result.forumId = forumId;
    }
    return _result;
  }
  factory CreateForumResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateForumResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateForumResp clone() => CreateForumResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateForumResp copyWith(void Function(CreateForumResp) updates) => super.copyWith((message) => updates(message as CreateForumResp)) as CreateForumResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateForumResp create() => CreateForumResp._();
  CreateForumResp createEmptyInstance() => create();
  static $pb.PbList<CreateForumResp> createRepeated() => $pb.PbList<CreateForumResp>();
  @$core.pragma('dart2js:noInline')
  static CreateForumResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateForumResp>(create);
  static CreateForumResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get forumId => $_getIZ(0);
  @$pb.TagNumber(1)
  set forumId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasForumId() => $_has(0);
  @$pb.TagNumber(1)
  void clearForumId() => clearField(1);
}

class RemoveForumReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoveForumReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'forumId', $pb.PbFieldType.O3, protoName: 'forumId')
    ..hasRequiredFields = false
  ;

  RemoveForumReq._() : super();
  factory RemoveForumReq({
    $core.int? forumId,
  }) {
    final _result = create();
    if (forumId != null) {
      _result.forumId = forumId;
    }
    return _result;
  }
  factory RemoveForumReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveForumReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveForumReq clone() => RemoveForumReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveForumReq copyWith(void Function(RemoveForumReq) updates) => super.copyWith((message) => updates(message as RemoveForumReq)) as RemoveForumReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoveForumReq create() => RemoveForumReq._();
  RemoveForumReq createEmptyInstance() => create();
  static $pb.PbList<RemoveForumReq> createRepeated() => $pb.PbList<RemoveForumReq>();
  @$core.pragma('dart2js:noInline')
  static RemoveForumReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveForumReq>(create);
  static RemoveForumReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get forumId => $_getIZ(0);
  @$pb.TagNumber(1)
  set forumId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasForumId() => $_has(0);
  @$pb.TagNumber(1)
  void clearForumId() => clearField(1);
}

class GetForumsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetForumsReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'from', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetForumsReq._() : super();
  factory GetForumsReq({
    $core.int? from,
    $core.int? count,
  }) {
    final _result = create();
    if (from != null) {
      _result.from = from;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory GetForumsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetForumsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetForumsReq clone() => GetForumsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetForumsReq copyWith(void Function(GetForumsReq) updates) => super.copyWith((message) => updates(message as GetForumsReq)) as GetForumsReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetForumsReq create() => GetForumsReq._();
  GetForumsReq createEmptyInstance() => create();
  static $pb.PbList<GetForumsReq> createRepeated() => $pb.PbList<GetForumsReq>();
  @$core.pragma('dart2js:noInline')
  static GetForumsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetForumsReq>(create);
  static GetForumsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get from => $_getIZ(0);
  @$pb.TagNumber(1)
  set from($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);
}

class GetForumsResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetForumsResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..pc<ForumDetail>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'forums', $pb.PbFieldType.PM, subBuilder: ForumDetail.create)
    ..hasRequiredFields = false
  ;

  GetForumsResp._() : super();
  factory GetForumsResp({
    $core.Iterable<ForumDetail>? forums,
  }) {
    final _result = create();
    if (forums != null) {
      _result.forums.addAll(forums);
    }
    return _result;
  }
  factory GetForumsResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetForumsResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetForumsResp clone() => GetForumsResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetForumsResp copyWith(void Function(GetForumsResp) updates) => super.copyWith((message) => updates(message as GetForumsResp)) as GetForumsResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetForumsResp create() => GetForumsResp._();
  GetForumsResp createEmptyInstance() => create();
  static $pb.PbList<GetForumsResp> createRepeated() => $pb.PbList<GetForumsResp>();
  @$core.pragma('dart2js:noInline')
  static GetForumsResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetForumsResp>(create);
  static GetForumsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ForumDetail> get forums => $_getList(0);
}

class ForumDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ForumDetail', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creatorUid', protoName: 'creatorUid')
    ..hasRequiredFields = false
  ;

  ForumDetail._() : super();
  factory ForumDetail({
    $core.int? id,
    $core.String? title,
    $core.String? description,
    $core.String? creatorUid,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (creatorUid != null) {
      _result.creatorUid = creatorUid;
    }
    return _result;
  }
  factory ForumDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForumDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForumDetail clone() => ForumDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForumDetail copyWith(void Function(ForumDetail) updates) => super.copyWith((message) => updates(message as ForumDetail)) as ForumDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ForumDetail create() => ForumDetail._();
  ForumDetail createEmptyInstance() => create();
  static $pb.PbList<ForumDetail> createRepeated() => $pb.PbList<ForumDetail>();
  @$core.pragma('dart2js:noInline')
  static ForumDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForumDetail>(create);
  static ForumDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get creatorUid => $_getSZ(3);
  @$pb.TagNumber(4)
  set creatorUid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatorUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatorUid() => clearField(4);
}

