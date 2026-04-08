// This is a generated file - do not edit.
//
// Generated from forum_saved.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class SaveThreadReq extends $pb.GeneratedMessage {
  factory SaveThreadReq({
    $core.int? threadId,
  }) {
    final result = create();
    if (threadId != null) result.threadId = threadId;
    return result;
  }

  SaveThreadReq._();

  factory SaveThreadReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SaveThreadReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SaveThreadReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'threadId', protoName: 'threadId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaveThreadReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaveThreadReq copyWith(void Function(SaveThreadReq) updates) =>
      super.copyWith((message) => updates(message as SaveThreadReq))
          as SaveThreadReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaveThreadReq create() => SaveThreadReq._();
  @$core.override
  SaveThreadReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SaveThreadReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SaveThreadReq>(create);
  static SaveThreadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => $_clearField(1);
}

class UnsaveThreadReq extends $pb.GeneratedMessage {
  factory UnsaveThreadReq({
    $core.int? threadId,
  }) {
    final result = create();
    if (threadId != null) result.threadId = threadId;
    return result;
  }

  UnsaveThreadReq._();

  factory UnsaveThreadReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnsaveThreadReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnsaveThreadReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'threadId', protoName: 'threadId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnsaveThreadReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnsaveThreadReq copyWith(void Function(UnsaveThreadReq) updates) =>
      super.copyWith((message) => updates(message as UnsaveThreadReq))
          as UnsaveThreadReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnsaveThreadReq create() => UnsaveThreadReq._();
  @$core.override
  UnsaveThreadReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnsaveThreadReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnsaveThreadReq>(create);
  static UnsaveThreadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => $_clearField(1);
}

class SavePostReq extends $pb.GeneratedMessage {
  factory SavePostReq({
    $core.int? postId,
  }) {
    final result = create();
    if (postId != null) result.postId = postId;
    return result;
  }

  SavePostReq._();

  factory SavePostReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SavePostReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SavePostReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'postId', protoName: 'postId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SavePostReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SavePostReq copyWith(void Function(SavePostReq) updates) =>
      super.copyWith((message) => updates(message as SavePostReq))
          as SavePostReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SavePostReq create() => SavePostReq._();
  @$core.override
  SavePostReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SavePostReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SavePostReq>(create);
  static SavePostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get postId => $_getIZ(0);
  @$pb.TagNumber(1)
  set postId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);
}

class UnsavePostReq extends $pb.GeneratedMessage {
  factory UnsavePostReq({
    $core.int? postId,
  }) {
    final result = create();
    if (postId != null) result.postId = postId;
    return result;
  }

  UnsavePostReq._();

  factory UnsavePostReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnsavePostReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnsavePostReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'postId', protoName: 'postId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnsavePostReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnsavePostReq copyWith(void Function(UnsavePostReq) updates) =>
      super.copyWith((message) => updates(message as UnsavePostReq))
          as UnsavePostReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnsavePostReq create() => UnsavePostReq._();
  @$core.override
  UnsavePostReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnsavePostReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnsavePostReq>(create);
  static UnsavePostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get postId => $_getIZ(0);
  @$pb.TagNumber(1)
  set postId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);
}

class GetSavedThreadsReq extends $pb.GeneratedMessage {
  factory GetSavedThreadsReq({
    $core.int? offset,
    $core.int? count,
  }) {
    final result = create();
    if (offset != null) result.offset = offset;
    if (count != null) result.count = count;
    return result;
  }

  GetSavedThreadsReq._();

  factory GetSavedThreadsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSavedThreadsReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSavedThreadsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'offset')
    ..aI(2, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSavedThreadsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSavedThreadsReq copyWith(void Function(GetSavedThreadsReq) updates) =>
      super.copyWith((message) => updates(message as GetSavedThreadsReq))
          as GetSavedThreadsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSavedThreadsReq create() => GetSavedThreadsReq._();
  @$core.override
  GetSavedThreadsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSavedThreadsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSavedThreadsReq>(create);
  static GetSavedThreadsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get offset => $_getIZ(0);
  @$pb.TagNumber(1)
  set offset($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);
}

class GetSavedPostsReq extends $pb.GeneratedMessage {
  factory GetSavedPostsReq({
    $core.int? offset,
    $core.int? count,
  }) {
    final result = create();
    if (offset != null) result.offset = offset;
    if (count != null) result.count = count;
    return result;
  }

  GetSavedPostsReq._();

  factory GetSavedPostsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSavedPostsReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSavedPostsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'offset')
    ..aI(2, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSavedPostsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSavedPostsReq copyWith(void Function(GetSavedPostsReq) updates) =>
      super.copyWith((message) => updates(message as GetSavedPostsReq))
          as GetSavedPostsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSavedPostsReq create() => GetSavedPostsReq._();
  @$core.override
  GetSavedPostsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSavedPostsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSavedPostsReq>(create);
  static GetSavedPostsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get offset => $_getIZ(0);
  @$pb.TagNumber(1)
  set offset($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
