// This is a generated file - do not edit.
//
// Generated from forum.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GetForumsReq extends $pb.GeneratedMessage {
  factory GetForumsReq({
    $core.int? from,
    $core.int? count,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (count != null) result.count = count;
    return result;
  }

  GetForumsReq._();

  factory GetForumsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetForumsReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetForumsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'from')
    ..aI(2, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetForumsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetForumsReq copyWith(void Function(GetForumsReq) updates) =>
      super.copyWith((message) => updates(message as GetForumsReq))
          as GetForumsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetForumsReq create() => GetForumsReq._();
  @$core.override
  GetForumsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetForumsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetForumsReq>(create);
  static GetForumsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get from => $_getIZ(0);
  @$pb.TagNumber(1)
  set from($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);
}

class GetForumsResp extends $pb.GeneratedMessage {
  factory GetForumsResp({
    $core.Iterable<ForumDetail>? forums,
  }) {
    final result = create();
    if (forums != null) result.forums.addAll(forums);
    return result;
  }

  GetForumsResp._();

  factory GetForumsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetForumsResp.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetForumsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..pPM<ForumDetail>(1, _omitFieldNames ? '' : 'forums',
        subBuilder: ForumDetail.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetForumsResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetForumsResp copyWith(void Function(GetForumsResp) updates) =>
      super.copyWith((message) => updates(message as GetForumsResp))
          as GetForumsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetForumsResp create() => GetForumsResp._();
  @$core.override
  GetForumsResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetForumsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetForumsResp>(create);
  static GetForumsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ForumDetail> get forums => $_getList(0);
}

class ForumDetail extends $pb.GeneratedMessage {
  factory ForumDetail({
    $core.int? id,
    $core.String? title,
    $core.String? description,
    $core.String? creatorUid,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    if (description != null) result.description = description;
    if (creatorUid != null) result.creatorUid = creatorUid;
    return result;
  }

  ForumDetail._();

  factory ForumDetail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ForumDetail.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ForumDetail',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'creatorUid', protoName: 'creatorUid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForumDetail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForumDetail copyWith(void Function(ForumDetail) updates) =>
      super.copyWith((message) => updates(message as ForumDetail))
          as ForumDetail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForumDetail create() => ForumDetail._();
  @$core.override
  ForumDetail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ForumDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ForumDetail>(create);
  static ForumDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get creatorUid => $_getSZ(3);
  @$pb.TagNumber(4)
  set creatorUid($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreatorUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatorUid() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
