///
//  Generated code. Do not modify.
//  source: forum_post.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'forum_common.pb.dart' as $5;
import 'google/protobuf/timestamp.pb.dart' as $6;

import 'forum_common.pbenum.dart' as $5;

enum CreatePostReq_Content {
  plainContent, 
  markdownContent, 
  notSet
}

class CreatePostReq extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreatePostReq_Content> _CreatePostReq_ContentByTag = {
    30 : CreatePostReq_Content.plainContent,
    31 : CreatePostReq_Content.markdownContent,
    0 : CreatePostReq_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreatePostReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..oo(0, [30, 31])
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threadId', $pb.PbFieldType.O3, protoName: 'threadId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentId', $pb.PbFieldType.O3, protoName: 'parentId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refPostId', $pb.PbFieldType.O3, protoName: 'refPostId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refPostUid', protoName: 'refPostUid')
    ..aOM<$5.PlainContent>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'plainContent', protoName: 'plainContent', subBuilder: $5.PlainContent.create)
    ..aOM<$5.MarkdownContent>(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'markdownContent', protoName: 'markdownContent', subBuilder: $5.MarkdownContent.create)
    ..hasRequiredFields = false
  ;

  CreatePostReq._() : super();
  factory CreatePostReq({
    $core.int? threadId,
    $core.int? parentId,
    $core.int? refPostId,
    $core.String? refPostUid,
    $5.PlainContent? plainContent,
    $5.MarkdownContent? markdownContent,
  }) {
    final _result = create();
    if (threadId != null) {
      _result.threadId = threadId;
    }
    if (parentId != null) {
      _result.parentId = parentId;
    }
    if (refPostId != null) {
      _result.refPostId = refPostId;
    }
    if (refPostUid != null) {
      _result.refPostUid = refPostUid;
    }
    if (plainContent != null) {
      _result.plainContent = plainContent;
    }
    if (markdownContent != null) {
      _result.markdownContent = markdownContent;
    }
    return _result;
  }
  factory CreatePostReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePostReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePostReq clone() => CreatePostReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePostReq copyWith(void Function(CreatePostReq) updates) => super.copyWith((message) => updates(message as CreatePostReq)) as CreatePostReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreatePostReq create() => CreatePostReq._();
  CreatePostReq createEmptyInstance() => create();
  static $pb.PbList<CreatePostReq> createRepeated() => $pb.PbList<CreatePostReq>();
  @$core.pragma('dart2js:noInline')
  static CreatePostReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePostReq>(create);
  static CreatePostReq? _defaultInstance;

  CreatePostReq_Content whichContent() => _CreatePostReq_ContentByTag[$_whichOneof(0)]!;
  void clearContent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get parentId => $_getIZ(1);
  @$pb.TagNumber(2)
  set parentId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get refPostId => $_getIZ(2);
  @$pb.TagNumber(3)
  set refPostId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefPostId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefPostId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get refPostUid => $_getSZ(3);
  @$pb.TagNumber(4)
  set refPostUid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRefPostUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefPostUid() => clearField(4);

  @$pb.TagNumber(30)
  $5.PlainContent get plainContent => $_getN(4);
  @$pb.TagNumber(30)
  set plainContent($5.PlainContent v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasPlainContent() => $_has(4);
  @$pb.TagNumber(30)
  void clearPlainContent() => clearField(30);
  @$pb.TagNumber(30)
  $5.PlainContent ensurePlainContent() => $_ensure(4);

  @$pb.TagNumber(31)
  $5.MarkdownContent get markdownContent => $_getN(5);
  @$pb.TagNumber(31)
  set markdownContent($5.MarkdownContent v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasMarkdownContent() => $_has(5);
  @$pb.TagNumber(31)
  void clearMarkdownContent() => clearField(31);
  @$pb.TagNumber(31)
  $5.MarkdownContent ensureMarkdownContent() => $_ensure(5);
}

class CreatePostResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreatePostResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'postId', $pb.PbFieldType.O3, protoName: 'postId')
    ..hasRequiredFields = false
  ;

  CreatePostResp._() : super();
  factory CreatePostResp({
    $core.int? postId,
  }) {
    final _result = create();
    if (postId != null) {
      _result.postId = postId;
    }
    return _result;
  }
  factory CreatePostResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePostResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePostResp clone() => CreatePostResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePostResp copyWith(void Function(CreatePostResp) updates) => super.copyWith((message) => updates(message as CreatePostResp)) as CreatePostResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreatePostResp create() => CreatePostResp._();
  CreatePostResp createEmptyInstance() => create();
  static $pb.PbList<CreatePostResp> createRepeated() => $pb.PbList<CreatePostResp>();
  @$core.pragma('dart2js:noInline')
  static CreatePostResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePostResp>(create);
  static CreatePostResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get postId => $_getIZ(0);
  @$pb.TagNumber(1)
  set postId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);
}

class RemovePostReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemovePostReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'postId', $pb.PbFieldType.O3, protoName: 'postId')
    ..hasRequiredFields = false
  ;

  RemovePostReq._() : super();
  factory RemovePostReq({
    $core.int? postId,
  }) {
    final _result = create();
    if (postId != null) {
      _result.postId = postId;
    }
    return _result;
  }
  factory RemovePostReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemovePostReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemovePostReq clone() => RemovePostReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemovePostReq copyWith(void Function(RemovePostReq) updates) => super.copyWith((message) => updates(message as RemovePostReq)) as RemovePostReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemovePostReq create() => RemovePostReq._();
  RemovePostReq createEmptyInstance() => create();
  static $pb.PbList<RemovePostReq> createRepeated() => $pb.PbList<RemovePostReq>();
  @$core.pragma('dart2js:noInline')
  static RemovePostReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemovePostReq>(create);
  static RemovePostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get postId => $_getIZ(0);
  @$pb.TagNumber(1)
  set postId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);
}

class GetPostsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPostsReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threadId', $pb.PbFieldType.O3, protoName: 'threadId')
    ..e<$5.Ordering>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ordering', $pb.PbFieldType.OE, defaultOrMaker: $5.Ordering.update, valueOf: $5.Ordering.valueOf, enumValues: $5.Ordering.values)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetPostsReq._() : super();
  factory GetPostsReq({
    $core.int? threadId,
    $5.Ordering? ordering,
    $core.int? offset,
    $core.int? count,
  }) {
    final _result = create();
    if (threadId != null) {
      _result.threadId = threadId;
    }
    if (ordering != null) {
      _result.ordering = ordering;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory GetPostsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostsReq clone() => GetPostsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostsReq copyWith(void Function(GetPostsReq) updates) => super.copyWith((message) => updates(message as GetPostsReq)) as GetPostsReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPostsReq create() => GetPostsReq._();
  GetPostsReq createEmptyInstance() => create();
  static $pb.PbList<GetPostsReq> createRepeated() => $pb.PbList<GetPostsReq>();
  @$core.pragma('dart2js:noInline')
  static GetPostsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostsReq>(create);
  static GetPostsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => clearField(1);

  @$pb.TagNumber(2)
  $5.Ordering get ordering => $_getN(1);
  @$pb.TagNumber(2)
  set ordering($5.Ordering v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrdering() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrdering() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => clearField(4);
}

class GetPostsByUidReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPostsByUidReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..e<$5.Ordering>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ordering', $pb.PbFieldType.OE, defaultOrMaker: $5.Ordering.update, valueOf: $5.Ordering.valueOf, enumValues: $5.Ordering.values)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetPostsByUidReq._() : super();
  factory GetPostsByUidReq({
    $core.String? uid,
    $5.Ordering? ordering,
    $core.int? offset,
    $core.int? count,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (ordering != null) {
      _result.ordering = ordering;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory GetPostsByUidReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostsByUidReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostsByUidReq clone() => GetPostsByUidReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostsByUidReq copyWith(void Function(GetPostsByUidReq) updates) => super.copyWith((message) => updates(message as GetPostsByUidReq)) as GetPostsByUidReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPostsByUidReq create() => GetPostsByUidReq._();
  GetPostsByUidReq createEmptyInstance() => create();
  static $pb.PbList<GetPostsByUidReq> createRepeated() => $pb.PbList<GetPostsByUidReq>();
  @$core.pragma('dart2js:noInline')
  static GetPostsByUidReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostsByUidReq>(create);
  static GetPostsByUidReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $5.Ordering get ordering => $_getN(1);
  @$pb.TagNumber(2)
  set ordering($5.Ordering v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrdering() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrdering() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => clearField(4);
}

class GetPostsByParentReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPostsByParentReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentId', $pb.PbFieldType.O3, protoName: 'parentId')
    ..e<$5.Ordering>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ordering', $pb.PbFieldType.OE, defaultOrMaker: $5.Ordering.update, valueOf: $5.Ordering.valueOf, enumValues: $5.Ordering.values)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetPostsByParentReq._() : super();
  factory GetPostsByParentReq({
    $core.int? parentId,
    $5.Ordering? ordering,
    $core.int? offset,
    $core.int? count,
  }) {
    final _result = create();
    if (parentId != null) {
      _result.parentId = parentId;
    }
    if (ordering != null) {
      _result.ordering = ordering;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory GetPostsByParentReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostsByParentReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostsByParentReq clone() => GetPostsByParentReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostsByParentReq copyWith(void Function(GetPostsByParentReq) updates) => super.copyWith((message) => updates(message as GetPostsByParentReq)) as GetPostsByParentReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPostsByParentReq create() => GetPostsByParentReq._();
  GetPostsByParentReq createEmptyInstance() => create();
  static $pb.PbList<GetPostsByParentReq> createRepeated() => $pb.PbList<GetPostsByParentReq>();
  @$core.pragma('dart2js:noInline')
  static GetPostsByParentReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostsByParentReq>(create);
  static GetPostsByParentReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get parentId => $_getIZ(0);
  @$pb.TagNumber(1)
  set parentId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasParentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearParentId() => clearField(1);

  @$pb.TagNumber(2)
  $5.Ordering get ordering => $_getN(1);
  @$pb.TagNumber(2)
  set ordering($5.Ordering v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrdering() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrdering() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => clearField(4);
}

class GetPostsResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPostsResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..pc<Post>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'posts', $pb.PbFieldType.PM, subBuilder: Post.create)
    ..hasRequiredFields = false
  ;

  GetPostsResp._() : super();
  factory GetPostsResp({
    $core.Iterable<Post>? posts,
  }) {
    final _result = create();
    if (posts != null) {
      _result.posts.addAll(posts);
    }
    return _result;
  }
  factory GetPostsResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostsResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostsResp clone() => GetPostsResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostsResp copyWith(void Function(GetPostsResp) updates) => super.copyWith((message) => updates(message as GetPostsResp)) as GetPostsResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPostsResp create() => GetPostsResp._();
  GetPostsResp createEmptyInstance() => create();
  static $pb.PbList<GetPostsResp> createRepeated() => $pb.PbList<GetPostsResp>();
  @$core.pragma('dart2js:noInline')
  static GetPostsResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostsResp>(create);
  static GetPostsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Post> get posts => $_getList(0);
}

enum Post_Content {
  plainContent, 
  markdownContent, 
  notSet
}

class Post extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Post_Content> _Post_ContentByTag = {
    30 : Post_Content.plainContent,
    31 : Post_Content.markdownContent,
    0 : Post_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Post', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..oo(0, [30, 31])
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threadId', $pb.PbFieldType.O3, protoName: 'threadId')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentId', $pb.PbFieldType.O3, protoName: 'parentId')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refPostId', $pb.PbFieldType.O3, protoName: 'refPostId')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refPostUid', protoName: 'refPostUid')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'likes', $pb.PbFieldType.O3)
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pinned')
    ..aOM<$6.Timestamp>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createAt', protoName: 'createAt', subBuilder: $6.Timestamp.create)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'liked', $pb.PbFieldType.O3)
    ..aOB(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'saved')
    ..aOM<$5.PlainContent>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'plainContent', protoName: 'plainContent', subBuilder: $5.PlainContent.create)
    ..aOM<$5.MarkdownContent>(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'markdownContent', protoName: 'markdownContent', subBuilder: $5.MarkdownContent.create)
    ..hasRequiredFields = false
  ;

  Post._() : super();
  factory Post({
    $core.int? id,
    $core.String? uid,
    $core.int? threadId,
    $core.int? parentId,
    $core.int? refPostId,
    $core.String? refPostUid,
    $core.int? likes,
    $core.bool? pinned,
    $6.Timestamp? createAt,
    $core.int? liked,
    $core.bool? saved,
    $5.PlainContent? plainContent,
    $5.MarkdownContent? markdownContent,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (threadId != null) {
      _result.threadId = threadId;
    }
    if (parentId != null) {
      _result.parentId = parentId;
    }
    if (refPostId != null) {
      _result.refPostId = refPostId;
    }
    if (refPostUid != null) {
      _result.refPostUid = refPostUid;
    }
    if (likes != null) {
      _result.likes = likes;
    }
    if (pinned != null) {
      _result.pinned = pinned;
    }
    if (createAt != null) {
      _result.createAt = createAt;
    }
    if (liked != null) {
      _result.liked = liked;
    }
    if (saved != null) {
      _result.saved = saved;
    }
    if (plainContent != null) {
      _result.plainContent = plainContent;
    }
    if (markdownContent != null) {
      _result.markdownContent = markdownContent;
    }
    return _result;
  }
  factory Post.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Post.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Post clone() => Post()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Post copyWith(void Function(Post) updates) => super.copyWith((message) => updates(message as Post)) as Post; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Post create() => Post._();
  Post createEmptyInstance() => create();
  static $pb.PbList<Post> createRepeated() => $pb.PbList<Post>();
  @$core.pragma('dart2js:noInline')
  static Post getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Post>(create);
  static Post? _defaultInstance;

  Post_Content whichContent() => _Post_ContentByTag[$_whichOneof(0)]!;
  void clearContent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
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
  $core.int get threadId => $_getIZ(2);
  @$pb.TagNumber(3)
  set threadId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasThreadId() => $_has(2);
  @$pb.TagNumber(3)
  void clearThreadId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get parentId => $_getIZ(3);
  @$pb.TagNumber(4)
  set parentId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasParentId() => $_has(3);
  @$pb.TagNumber(4)
  void clearParentId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get refPostId => $_getIZ(4);
  @$pb.TagNumber(5)
  set refPostId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRefPostId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRefPostId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get refPostUid => $_getSZ(5);
  @$pb.TagNumber(6)
  set refPostUid($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRefPostUid() => $_has(5);
  @$pb.TagNumber(6)
  void clearRefPostUid() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get likes => $_getIZ(6);
  @$pb.TagNumber(7)
  set likes($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLikes() => $_has(6);
  @$pb.TagNumber(7)
  void clearLikes() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get pinned => $_getBF(7);
  @$pb.TagNumber(8)
  set pinned($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPinned() => $_has(7);
  @$pb.TagNumber(8)
  void clearPinned() => clearField(8);

  @$pb.TagNumber(9)
  $6.Timestamp get createAt => $_getN(8);
  @$pb.TagNumber(9)
  set createAt($6.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreateAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreateAt() => clearField(9);
  @$pb.TagNumber(9)
  $6.Timestamp ensureCreateAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.int get liked => $_getIZ(9);
  @$pb.TagNumber(10)
  set liked($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLiked() => $_has(9);
  @$pb.TagNumber(10)
  void clearLiked() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get saved => $_getBF(10);
  @$pb.TagNumber(11)
  set saved($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSaved() => $_has(10);
  @$pb.TagNumber(11)
  void clearSaved() => clearField(11);

  @$pb.TagNumber(30)
  $5.PlainContent get plainContent => $_getN(11);
  @$pb.TagNumber(30)
  set plainContent($5.PlainContent v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasPlainContent() => $_has(11);
  @$pb.TagNumber(30)
  void clearPlainContent() => clearField(30);
  @$pb.TagNumber(30)
  $5.PlainContent ensurePlainContent() => $_ensure(11);

  @$pb.TagNumber(31)
  $5.MarkdownContent get markdownContent => $_getN(12);
  @$pb.TagNumber(31)
  set markdownContent($5.MarkdownContent v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasMarkdownContent() => $_has(12);
  @$pb.TagNumber(31)
  void clearMarkdownContent() => clearField(31);
  @$pb.TagNumber(31)
  $5.MarkdownContent ensureMarkdownContent() => $_ensure(12);
}

class LikePostReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LikePostReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'postId', $pb.PbFieldType.O3, protoName: 'postId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'like', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  LikePostReq._() : super();
  factory LikePostReq({
    $core.int? postId,
    $core.int? like,
  }) {
    final _result = create();
    if (postId != null) {
      _result.postId = postId;
    }
    if (like != null) {
      _result.like = like;
    }
    return _result;
  }
  factory LikePostReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LikePostReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LikePostReq clone() => LikePostReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LikePostReq copyWith(void Function(LikePostReq) updates) => super.copyWith((message) => updates(message as LikePostReq)) as LikePostReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LikePostReq create() => LikePostReq._();
  LikePostReq createEmptyInstance() => create();
  static $pb.PbList<LikePostReq> createRepeated() => $pb.PbList<LikePostReq>();
  @$core.pragma('dart2js:noInline')
  static LikePostReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LikePostReq>(create);
  static LikePostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get postId => $_getIZ(0);
  @$pb.TagNumber(1)
  set postId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get like => $_getIZ(1);
  @$pb.TagNumber(2)
  set like($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLike() => $_has(1);
  @$pb.TagNumber(2)
  void clearLike() => clearField(2);
}

class PinPostReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PinPostReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'postId', $pb.PbFieldType.O3, protoName: 'postId')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pinned')
    ..hasRequiredFields = false
  ;

  PinPostReq._() : super();
  factory PinPostReq({
    $core.int? postId,
    $core.bool? pinned,
  }) {
    final _result = create();
    if (postId != null) {
      _result.postId = postId;
    }
    if (pinned != null) {
      _result.pinned = pinned;
    }
    return _result;
  }
  factory PinPostReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PinPostReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PinPostReq clone() => PinPostReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PinPostReq copyWith(void Function(PinPostReq) updates) => super.copyWith((message) => updates(message as PinPostReq)) as PinPostReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PinPostReq create() => PinPostReq._();
  PinPostReq createEmptyInstance() => create();
  static $pb.PbList<PinPostReq> createRepeated() => $pb.PbList<PinPostReq>();
  @$core.pragma('dart2js:noInline')
  static PinPostReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PinPostReq>(create);
  static PinPostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get postId => $_getIZ(0);
  @$pb.TagNumber(1)
  set postId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get pinned => $_getBF(1);
  @$pb.TagNumber(2)
  set pinned($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPinned() => $_has(1);
  @$pb.TagNumber(2)
  void clearPinned() => clearField(2);
}

