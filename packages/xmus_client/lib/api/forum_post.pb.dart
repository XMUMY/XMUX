// This is a generated file - do not edit.
//
// Generated from forum_post.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $1;

import 'forum_common.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

enum CreatePostReq_Content { plainContent, markdownContent, notSet }

/// lvl1 Post: parent = -1, refPostId = -1 / ref post id
/// lvl2 Post: parent = lvl1 post id, refPostId = direct ref post id
class CreatePostReq extends $pb.GeneratedMessage {
  factory CreatePostReq({
    $core.int? threadId,
    $core.int? parentId,
    $core.int? refPostId,
    $core.String? refPostUid,
    $0.PlainContent? plainContent,
    $0.MarkdownContent? markdownContent,
  }) {
    final result = create();
    if (threadId != null) result.threadId = threadId;
    if (parentId != null) result.parentId = parentId;
    if (refPostId != null) result.refPostId = refPostId;
    if (refPostUid != null) result.refPostUid = refPostUid;
    if (plainContent != null) result.plainContent = plainContent;
    if (markdownContent != null) result.markdownContent = markdownContent;
    return result;
  }

  CreatePostReq._();

  factory CreatePostReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePostReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static const $core.Map<$core.int, CreatePostReq_Content>
      _CreatePostReq_ContentByTag = {
    30: CreatePostReq_Content.plainContent,
    31: CreatePostReq_Content.markdownContent,
    0: CreatePostReq_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePostReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..oo(0, [30, 31])
    ..aI(1, _omitFieldNames ? '' : 'threadId', protoName: 'threadId')
    ..aI(2, _omitFieldNames ? '' : 'parentId', protoName: 'parentId')
    ..aI(3, _omitFieldNames ? '' : 'refPostId', protoName: 'refPostId')
    ..aOS(4, _omitFieldNames ? '' : 'refPostUid', protoName: 'refPostUid')
    ..aOM<$0.PlainContent>(30, _omitFieldNames ? '' : 'plainContent',
        protoName: 'plainContent', subBuilder: $0.PlainContent.create)
    ..aOM<$0.MarkdownContent>(31, _omitFieldNames ? '' : 'markdownContent',
        protoName: 'markdownContent', subBuilder: $0.MarkdownContent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePostReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePostReq copyWith(void Function(CreatePostReq) updates) =>
      super.copyWith((message) => updates(message as CreatePostReq))
          as CreatePostReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePostReq create() => CreatePostReq._();
  @$core.override
  CreatePostReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreatePostReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePostReq>(create);
  static CreatePostReq? _defaultInstance;

  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  CreatePostReq_Content whichContent() =>
      _CreatePostReq_ContentByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  void clearContent() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get parentId => $_getIZ(1);
  @$pb.TagNumber(2)
  set parentId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasParentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get refPostId => $_getIZ(2);
  @$pb.TagNumber(3)
  set refPostId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRefPostId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefPostId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get refPostUid => $_getSZ(3);
  @$pb.TagNumber(4)
  set refPostUid($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRefPostUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefPostUid() => $_clearField(4);

  @$pb.TagNumber(30)
  $0.PlainContent get plainContent => $_getN(4);
  @$pb.TagNumber(30)
  set plainContent($0.PlainContent value) => $_setField(30, value);
  @$pb.TagNumber(30)
  $core.bool hasPlainContent() => $_has(4);
  @$pb.TagNumber(30)
  void clearPlainContent() => $_clearField(30);
  @$pb.TagNumber(30)
  $0.PlainContent ensurePlainContent() => $_ensure(4);

  @$pb.TagNumber(31)
  $0.MarkdownContent get markdownContent => $_getN(5);
  @$pb.TagNumber(31)
  set markdownContent($0.MarkdownContent value) => $_setField(31, value);
  @$pb.TagNumber(31)
  $core.bool hasMarkdownContent() => $_has(5);
  @$pb.TagNumber(31)
  void clearMarkdownContent() => $_clearField(31);
  @$pb.TagNumber(31)
  $0.MarkdownContent ensureMarkdownContent() => $_ensure(5);
}

class CreatePostResp extends $pb.GeneratedMessage {
  factory CreatePostResp({
    $core.int? postId,
  }) {
    final result = create();
    if (postId != null) result.postId = postId;
    return result;
  }

  CreatePostResp._();

  factory CreatePostResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePostResp.fromJson(
          $core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePostResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'postId', protoName: 'postId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePostResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePostResp copyWith(void Function(CreatePostResp) updates) =>
      super.copyWith((message) => updates(message as CreatePostResp))
          as CreatePostResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePostResp create() => CreatePostResp._();
  @$core.override
  CreatePostResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreatePostResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePostResp>(create);
  static CreatePostResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get postId => $_getIZ(0);
  @$pb.TagNumber(1)
  set postId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);
}

class RemovePostReq extends $pb.GeneratedMessage {
  factory RemovePostReq({
    $core.int? postId,
  }) {
    final result = create();
    if (postId != null) result.postId = postId;
    return result;
  }

  RemovePostReq._();

  factory RemovePostReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemovePostReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemovePostReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'postId', protoName: 'postId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemovePostReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemovePostReq copyWith(void Function(RemovePostReq) updates) =>
      super.copyWith((message) => updates(message as RemovePostReq))
          as RemovePostReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemovePostReq create() => RemovePostReq._();
  @$core.override
  RemovePostReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemovePostReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemovePostReq>(create);
  static RemovePostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get postId => $_getIZ(0);
  @$pb.TagNumber(1)
  set postId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);
}

class GetPostsReq extends $pb.GeneratedMessage {
  factory GetPostsReq({
    $core.int? threadId,
    $0.Ordering? ordering,
    $core.int? offset,
    $core.int? count,
  }) {
    final result = create();
    if (threadId != null) result.threadId = threadId;
    if (ordering != null) result.ordering = ordering;
    if (offset != null) result.offset = offset;
    if (count != null) result.count = count;
    return result;
  }

  GetPostsReq._();

  factory GetPostsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPostsReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPostsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'threadId', protoName: 'threadId')
    ..aE<$0.Ordering>(2, _omitFieldNames ? '' : 'ordering',
        enumValues: $0.Ordering.values)
    ..aI(3, _omitFieldNames ? '' : 'offset')
    ..aI(4, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPostsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPostsReq copyWith(void Function(GetPostsReq) updates) =>
      super.copyWith((message) => updates(message as GetPostsReq))
          as GetPostsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostsReq create() => GetPostsReq._();
  @$core.override
  GetPostsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPostsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPostsReq>(create);
  static GetPostsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Ordering get ordering => $_getN(1);
  @$pb.TagNumber(2)
  set ordering($0.Ordering value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOrdering() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrdering() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => $_clearField(4);
}

class GetPostsByUidReq extends $pb.GeneratedMessage {
  factory GetPostsByUidReq({
    $core.String? uid,
    $0.Ordering? ordering,
    $core.int? offset,
    $core.int? count,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (ordering != null) result.ordering = ordering;
    if (offset != null) result.offset = offset;
    if (count != null) result.count = count;
    return result;
  }

  GetPostsByUidReq._();

  factory GetPostsByUidReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPostsByUidReq.fromJson(
          $core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPostsByUidReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..aE<$0.Ordering>(2, _omitFieldNames ? '' : 'ordering',
        enumValues: $0.Ordering.values)
    ..aI(3, _omitFieldNames ? '' : 'offset')
    ..aI(4, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPostsByUidReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPostsByUidReq copyWith(void Function(GetPostsByUidReq) updates) =>
      super.copyWith((message) => updates(message as GetPostsByUidReq))
          as GetPostsByUidReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostsByUidReq create() => GetPostsByUidReq._();
  @$core.override
  GetPostsByUidReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPostsByUidReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPostsByUidReq>(create);
  static GetPostsByUidReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Ordering get ordering => $_getN(1);
  @$pb.TagNumber(2)
  set ordering($0.Ordering value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOrdering() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrdering() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => $_clearField(4);
}

class GetPostsByParentReq extends $pb.GeneratedMessage {
  factory GetPostsByParentReq({
    $core.int? parentId,
    $0.Ordering? ordering,
    $core.int? offset,
    $core.int? count,
  }) {
    final result = create();
    if (parentId != null) result.parentId = parentId;
    if (ordering != null) result.ordering = ordering;
    if (offset != null) result.offset = offset;
    if (count != null) result.count = count;
    return result;
  }

  GetPostsByParentReq._();

  factory GetPostsByParentReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPostsByParentReq.fromJson(
          $core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPostsByParentReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'parentId', protoName: 'parentId')
    ..aE<$0.Ordering>(2, _omitFieldNames ? '' : 'ordering',
        enumValues: $0.Ordering.values)
    ..aI(3, _omitFieldNames ? '' : 'offset')
    ..aI(4, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPostsByParentReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPostsByParentReq copyWith(void Function(GetPostsByParentReq) updates) =>
      super.copyWith((message) => updates(message as GetPostsByParentReq))
          as GetPostsByParentReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostsByParentReq create() => GetPostsByParentReq._();
  @$core.override
  GetPostsByParentReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPostsByParentReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPostsByParentReq>(create);
  static GetPostsByParentReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get parentId => $_getIZ(0);
  @$pb.TagNumber(1)
  set parentId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasParentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearParentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Ordering get ordering => $_getN(1);
  @$pb.TagNumber(2)
  set ordering($0.Ordering value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOrdering() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrdering() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => $_clearField(4);
}

class GetPostsResp extends $pb.GeneratedMessage {
  factory GetPostsResp({
    $core.Iterable<Post>? posts,
  }) {
    final result = create();
    if (posts != null) result.posts.addAll(posts);
    return result;
  }

  GetPostsResp._();

  factory GetPostsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPostsResp.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPostsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..pPM<Post>(1, _omitFieldNames ? '' : 'posts', subBuilder: Post.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPostsResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPostsResp copyWith(void Function(GetPostsResp) updates) =>
      super.copyWith((message) => updates(message as GetPostsResp))
          as GetPostsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostsResp create() => GetPostsResp._();
  @$core.override
  GetPostsResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPostsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPostsResp>(create);
  static GetPostsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Post> get posts => $_getList(0);
}

enum Post_Content { plainContent, markdownContent, notSet }

class Post extends $pb.GeneratedMessage {
  factory Post({
    $core.int? id,
    $core.String? uid,
    $core.int? threadId,
    $core.int? parentId,
    $core.int? refPostId,
    $core.String? refPostUid,
    $core.int? likes,
    $core.bool? pinned,
    $1.Timestamp? createAt,
    $core.int? liked,
    $core.bool? saved,
    $0.PlainContent? plainContent,
    $0.MarkdownContent? markdownContent,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (uid != null) result.uid = uid;
    if (threadId != null) result.threadId = threadId;
    if (parentId != null) result.parentId = parentId;
    if (refPostId != null) result.refPostId = refPostId;
    if (refPostUid != null) result.refPostUid = refPostUid;
    if (likes != null) result.likes = likes;
    if (pinned != null) result.pinned = pinned;
    if (createAt != null) result.createAt = createAt;
    if (liked != null) result.liked = liked;
    if (saved != null) result.saved = saved;
    if (plainContent != null) result.plainContent = plainContent;
    if (markdownContent != null) result.markdownContent = markdownContent;
    return result;
  }

  Post._();

  factory Post.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Post.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static const $core.Map<$core.int, Post_Content> _Post_ContentByTag = {
    30: Post_Content.plainContent,
    31: Post_Content.markdownContent,
    0: Post_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Post',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..oo(0, [30, 31])
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'uid')
    ..aI(3, _omitFieldNames ? '' : 'threadId', protoName: 'threadId')
    ..aI(4, _omitFieldNames ? '' : 'parentId', protoName: 'parentId')
    ..aI(5, _omitFieldNames ? '' : 'refPostId', protoName: 'refPostId')
    ..aOS(6, _omitFieldNames ? '' : 'refPostUid', protoName: 'refPostUid')
    ..aI(7, _omitFieldNames ? '' : 'likes')
    ..aOB(8, _omitFieldNames ? '' : 'pinned')
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'createAt',
        protoName: 'createAt', subBuilder: $1.Timestamp.create)
    ..aI(10, _omitFieldNames ? '' : 'liked')
    ..aOB(11, _omitFieldNames ? '' : 'saved')
    ..aOM<$0.PlainContent>(30, _omitFieldNames ? '' : 'plainContent',
        protoName: 'plainContent', subBuilder: $0.PlainContent.create)
    ..aOM<$0.MarkdownContent>(31, _omitFieldNames ? '' : 'markdownContent',
        protoName: 'markdownContent', subBuilder: $0.MarkdownContent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Post clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Post copyWith(void Function(Post) updates) =>
      super.copyWith((message) => updates(message as Post)) as Post;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Post create() => Post._();
  @$core.override
  Post createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Post getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Post>(create);
  static Post? _defaultInstance;

  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  Post_Content whichContent() => _Post_ContentByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  void clearContent() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
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
  $core.int get threadId => $_getIZ(2);
  @$pb.TagNumber(3)
  set threadId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasThreadId() => $_has(2);
  @$pb.TagNumber(3)
  void clearThreadId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get parentId => $_getIZ(3);
  @$pb.TagNumber(4)
  set parentId($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasParentId() => $_has(3);
  @$pb.TagNumber(4)
  void clearParentId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get refPostId => $_getIZ(4);
  @$pb.TagNumber(5)
  set refPostId($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRefPostId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRefPostId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get refPostUid => $_getSZ(5);
  @$pb.TagNumber(6)
  set refPostUid($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRefPostUid() => $_has(5);
  @$pb.TagNumber(6)
  void clearRefPostUid() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get likes => $_getIZ(6);
  @$pb.TagNumber(7)
  set likes($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLikes() => $_has(6);
  @$pb.TagNumber(7)
  void clearLikes() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get pinned => $_getBF(7);
  @$pb.TagNumber(8)
  set pinned($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPinned() => $_has(7);
  @$pb.TagNumber(8)
  void clearPinned() => $_clearField(8);

  @$pb.TagNumber(9)
  $1.Timestamp get createAt => $_getN(8);
  @$pb.TagNumber(9)
  set createAt($1.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasCreateAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreateAt() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureCreateAt() => $_ensure(8);

  /// + For like. - for dislike. 0 for cancel.
  @$pb.TagNumber(10)
  $core.int get liked => $_getIZ(9);
  @$pb.TagNumber(10)
  set liked($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasLiked() => $_has(9);
  @$pb.TagNumber(10)
  void clearLiked() => $_clearField(10);

  /// Whether current thread is saved by user.
  @$pb.TagNumber(11)
  $core.bool get saved => $_getBF(10);
  @$pb.TagNumber(11)
  set saved($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasSaved() => $_has(10);
  @$pb.TagNumber(11)
  void clearSaved() => $_clearField(11);

  @$pb.TagNumber(30)
  $0.PlainContent get plainContent => $_getN(11);
  @$pb.TagNumber(30)
  set plainContent($0.PlainContent value) => $_setField(30, value);
  @$pb.TagNumber(30)
  $core.bool hasPlainContent() => $_has(11);
  @$pb.TagNumber(30)
  void clearPlainContent() => $_clearField(30);
  @$pb.TagNumber(30)
  $0.PlainContent ensurePlainContent() => $_ensure(11);

  @$pb.TagNumber(31)
  $0.MarkdownContent get markdownContent => $_getN(12);
  @$pb.TagNumber(31)
  set markdownContent($0.MarkdownContent value) => $_setField(31, value);
  @$pb.TagNumber(31)
  $core.bool hasMarkdownContent() => $_has(12);
  @$pb.TagNumber(31)
  void clearMarkdownContent() => $_clearField(31);
  @$pb.TagNumber(31)
  $0.MarkdownContent ensureMarkdownContent() => $_ensure(12);
}

class LikePostReq extends $pb.GeneratedMessage {
  factory LikePostReq({
    $core.int? postId,
    $core.int? like,
  }) {
    final result = create();
    if (postId != null) result.postId = postId;
    if (like != null) result.like = like;
    return result;
  }

  LikePostReq._();

  factory LikePostReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LikePostReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LikePostReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'postId', protoName: 'postId')
    ..aI(2, _omitFieldNames ? '' : 'like')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LikePostReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LikePostReq copyWith(void Function(LikePostReq) updates) =>
      super.copyWith((message) => updates(message as LikePostReq))
          as LikePostReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LikePostReq create() => LikePostReq._();
  @$core.override
  LikePostReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LikePostReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LikePostReq>(create);
  static LikePostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get postId => $_getIZ(0);
  @$pb.TagNumber(1)
  set postId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);

  /// + For like. - for dislike. 0 for cancel.
  @$pb.TagNumber(2)
  $core.int get like => $_getIZ(1);
  @$pb.TagNumber(2)
  set like($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLike() => $_has(1);
  @$pb.TagNumber(2)
  void clearLike() => $_clearField(2);
}

class PinPostReq extends $pb.GeneratedMessage {
  factory PinPostReq({
    $core.int? postId,
    $core.bool? pinned,
  }) {
    final result = create();
    if (postId != null) result.postId = postId;
    if (pinned != null) result.pinned = pinned;
    return result;
  }

  PinPostReq._();

  factory PinPostReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PinPostReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PinPostReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'postId', protoName: 'postId')
    ..aOB(2, _omitFieldNames ? '' : 'pinned')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PinPostReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PinPostReq copyWith(void Function(PinPostReq) updates) =>
      super.copyWith((message) => updates(message as PinPostReq)) as PinPostReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PinPostReq create() => PinPostReq._();
  @$core.override
  PinPostReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PinPostReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PinPostReq>(create);
  static PinPostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get postId => $_getIZ(0);
  @$pb.TagNumber(1)
  set postId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get pinned => $_getBF(1);
  @$pb.TagNumber(2)
  set pinned($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPinned() => $_has(1);
  @$pb.TagNumber(2)
  void clearPinned() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
