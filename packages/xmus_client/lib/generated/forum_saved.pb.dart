///
//  Generated code. Do not modify.
//  source: forum_saved.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SaveThreadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SaveThreadReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threadId', $pb.PbFieldType.O3, protoName: 'threadId')
    ..hasRequiredFields = false
  ;

  SaveThreadReq._() : super();
  factory SaveThreadReq({
    $core.int? threadId,
  }) {
    final _result = create();
    if (threadId != null) {
      _result.threadId = threadId;
    }
    return _result;
  }
  factory SaveThreadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SaveThreadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SaveThreadReq clone() => SaveThreadReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SaveThreadReq copyWith(void Function(SaveThreadReq) updates) => super.copyWith((message) => updates(message as SaveThreadReq)) as SaveThreadReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SaveThreadReq create() => SaveThreadReq._();
  SaveThreadReq createEmptyInstance() => create();
  static $pb.PbList<SaveThreadReq> createRepeated() => $pb.PbList<SaveThreadReq>();
  @$core.pragma('dart2js:noInline')
  static SaveThreadReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaveThreadReq>(create);
  static SaveThreadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => clearField(1);
}

class UnsaveThreadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UnsaveThreadReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threadId', $pb.PbFieldType.O3, protoName: 'threadId')
    ..hasRequiredFields = false
  ;

  UnsaveThreadReq._() : super();
  factory UnsaveThreadReq({
    $core.int? threadId,
  }) {
    final _result = create();
    if (threadId != null) {
      _result.threadId = threadId;
    }
    return _result;
  }
  factory UnsaveThreadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnsaveThreadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnsaveThreadReq clone() => UnsaveThreadReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnsaveThreadReq copyWith(void Function(UnsaveThreadReq) updates) => super.copyWith((message) => updates(message as UnsaveThreadReq)) as UnsaveThreadReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnsaveThreadReq create() => UnsaveThreadReq._();
  UnsaveThreadReq createEmptyInstance() => create();
  static $pb.PbList<UnsaveThreadReq> createRepeated() => $pb.PbList<UnsaveThreadReq>();
  @$core.pragma('dart2js:noInline')
  static UnsaveThreadReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnsaveThreadReq>(create);
  static UnsaveThreadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => clearField(1);
}

class SavePostReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SavePostReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'postId', $pb.PbFieldType.O3, protoName: 'postId')
    ..hasRequiredFields = false
  ;

  SavePostReq._() : super();
  factory SavePostReq({
    $core.int? postId,
  }) {
    final _result = create();
    if (postId != null) {
      _result.postId = postId;
    }
    return _result;
  }
  factory SavePostReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SavePostReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SavePostReq clone() => SavePostReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SavePostReq copyWith(void Function(SavePostReq) updates) => super.copyWith((message) => updates(message as SavePostReq)) as SavePostReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SavePostReq create() => SavePostReq._();
  SavePostReq createEmptyInstance() => create();
  static $pb.PbList<SavePostReq> createRepeated() => $pb.PbList<SavePostReq>();
  @$core.pragma('dart2js:noInline')
  static SavePostReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SavePostReq>(create);
  static SavePostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get postId => $_getIZ(0);
  @$pb.TagNumber(1)
  set postId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);
}

class UnsavePostReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UnsavePostReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'postId', $pb.PbFieldType.O3, protoName: 'postId')
    ..hasRequiredFields = false
  ;

  UnsavePostReq._() : super();
  factory UnsavePostReq({
    $core.int? postId,
  }) {
    final _result = create();
    if (postId != null) {
      _result.postId = postId;
    }
    return _result;
  }
  factory UnsavePostReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnsavePostReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnsavePostReq clone() => UnsavePostReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnsavePostReq copyWith(void Function(UnsavePostReq) updates) => super.copyWith((message) => updates(message as UnsavePostReq)) as UnsavePostReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnsavePostReq create() => UnsavePostReq._();
  UnsavePostReq createEmptyInstance() => create();
  static $pb.PbList<UnsavePostReq> createRepeated() => $pb.PbList<UnsavePostReq>();
  @$core.pragma('dart2js:noInline')
  static UnsavePostReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnsavePostReq>(create);
  static UnsavePostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get postId => $_getIZ(0);
  @$pb.TagNumber(1)
  set postId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);
}

class GetSavedThreadsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetSavedThreadsReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cursor', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetSavedThreadsReq._() : super();
  factory GetSavedThreadsReq({
    $core.int? cursor,
    $core.int? count,
  }) {
    final _result = create();
    if (cursor != null) {
      _result.cursor = cursor;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory GetSavedThreadsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSavedThreadsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSavedThreadsReq clone() => GetSavedThreadsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSavedThreadsReq copyWith(void Function(GetSavedThreadsReq) updates) => super.copyWith((message) => updates(message as GetSavedThreadsReq)) as GetSavedThreadsReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSavedThreadsReq create() => GetSavedThreadsReq._();
  GetSavedThreadsReq createEmptyInstance() => create();
  static $pb.PbList<GetSavedThreadsReq> createRepeated() => $pb.PbList<GetSavedThreadsReq>();
  @$core.pragma('dart2js:noInline')
  static GetSavedThreadsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSavedThreadsReq>(create);
  static GetSavedThreadsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cursor => $_getIZ(0);
  @$pb.TagNumber(1)
  set cursor($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCursor() => $_has(0);
  @$pb.TagNumber(1)
  void clearCursor() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);
}

class GetSavedPostsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetSavedPostsReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cursor', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetSavedPostsReq._() : super();
  factory GetSavedPostsReq({
    $core.int? cursor,
    $core.int? count,
  }) {
    final _result = create();
    if (cursor != null) {
      _result.cursor = cursor;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory GetSavedPostsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSavedPostsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSavedPostsReq clone() => GetSavedPostsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSavedPostsReq copyWith(void Function(GetSavedPostsReq) updates) => super.copyWith((message) => updates(message as GetSavedPostsReq)) as GetSavedPostsReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSavedPostsReq create() => GetSavedPostsReq._();
  GetSavedPostsReq createEmptyInstance() => create();
  static $pb.PbList<GetSavedPostsReq> createRepeated() => $pb.PbList<GetSavedPostsReq>();
  @$core.pragma('dart2js:noInline')
  static GetSavedPostsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSavedPostsReq>(create);
  static GetSavedPostsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cursor => $_getIZ(0);
  @$pb.TagNumber(1)
  set cursor($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCursor() => $_has(0);
  @$pb.TagNumber(1)
  void clearCursor() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);
}

