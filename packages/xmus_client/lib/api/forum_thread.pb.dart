// This is a generated file - do not edit.
//
// Generated from forum_thread.proto.

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

enum CreateThreadReq_Body { plainContent, markdownContent, notSet }

class CreateThreadReq extends $pb.GeneratedMessage {
  factory CreateThreadReq({
    $core.int? forumId,
    $core.String? title,
    $0.PlainContent? plainContent,
    $0.MarkdownContent? markdownContent,
  }) {
    final result = create();
    if (forumId != null) result.forumId = forumId;
    if (title != null) result.title = title;
    if (plainContent != null) result.plainContent = plainContent;
    if (markdownContent != null) result.markdownContent = markdownContent;
    return result;
  }

  CreateThreadReq._();

  factory CreateThreadReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateThreadReq.fromJson(
          $core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static const $core.Map<$core.int, CreateThreadReq_Body>
      _CreateThreadReq_BodyByTag = {
    30: CreateThreadReq_Body.plainContent,
    31: CreateThreadReq_Body.markdownContent,
    0: CreateThreadReq_Body.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateThreadReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..oo(0, [30, 31])
    ..aI(1, _omitFieldNames ? '' : 'forumId', protoName: 'forumId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOM<$0.PlainContent>(30, _omitFieldNames ? '' : 'plainContent',
        protoName: 'plainContent', subBuilder: $0.PlainContent.create)
    ..aOM<$0.MarkdownContent>(31, _omitFieldNames ? '' : 'markdownContent',
        protoName: 'markdownContent', subBuilder: $0.MarkdownContent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateThreadReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateThreadReq copyWith(void Function(CreateThreadReq) updates) =>
      super.copyWith((message) => updates(message as CreateThreadReq))
          as CreateThreadReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateThreadReq create() => CreateThreadReq._();
  @$core.override
  CreateThreadReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateThreadReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateThreadReq>(create);
  static CreateThreadReq? _defaultInstance;

  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  CreateThreadReq_Body whichBody() =>
      _CreateThreadReq_BodyByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  void clearBody() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get forumId => $_getIZ(0);
  @$pb.TagNumber(1)
  set forumId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasForumId() => $_has(0);
  @$pb.TagNumber(1)
  void clearForumId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(30)
  $0.PlainContent get plainContent => $_getN(2);
  @$pb.TagNumber(30)
  set plainContent($0.PlainContent value) => $_setField(30, value);
  @$pb.TagNumber(30)
  $core.bool hasPlainContent() => $_has(2);
  @$pb.TagNumber(30)
  void clearPlainContent() => $_clearField(30);
  @$pb.TagNumber(30)
  $0.PlainContent ensurePlainContent() => $_ensure(2);

  @$pb.TagNumber(31)
  $0.MarkdownContent get markdownContent => $_getN(3);
  @$pb.TagNumber(31)
  set markdownContent($0.MarkdownContent value) => $_setField(31, value);
  @$pb.TagNumber(31)
  $core.bool hasMarkdownContent() => $_has(3);
  @$pb.TagNumber(31)
  void clearMarkdownContent() => $_clearField(31);
  @$pb.TagNumber(31)
  $0.MarkdownContent ensureMarkdownContent() => $_ensure(3);
}

class CreateThreadResp extends $pb.GeneratedMessage {
  factory CreateThreadResp({
    $core.int? threadId,
  }) {
    final result = create();
    if (threadId != null) result.threadId = threadId;
    return result;
  }

  CreateThreadResp._();

  factory CreateThreadResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateThreadResp.fromJson(
          $core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateThreadResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'threadId', protoName: 'threadId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateThreadResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateThreadResp copyWith(void Function(CreateThreadResp) updates) =>
      super.copyWith((message) => updates(message as CreateThreadResp))
          as CreateThreadResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateThreadResp create() => CreateThreadResp._();
  @$core.override
  CreateThreadResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateThreadResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateThreadResp>(create);
  static CreateThreadResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => $_clearField(1);
}

class RemoveThreadReq extends $pb.GeneratedMessage {
  factory RemoveThreadReq({
    $core.int? threadId,
  }) {
    final result = create();
    if (threadId != null) result.threadId = threadId;
    return result;
  }

  RemoveThreadReq._();

  factory RemoveThreadReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveThreadReq.fromJson(
          $core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveThreadReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'threadId', protoName: 'threadId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveThreadReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveThreadReq copyWith(void Function(RemoveThreadReq) updates) =>
      super.copyWith((message) => updates(message as RemoveThreadReq))
          as RemoveThreadReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveThreadReq create() => RemoveThreadReq._();
  @$core.override
  RemoveThreadReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemoveThreadReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveThreadReq>(create);
  static RemoveThreadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => $_clearField(1);
}

class UpdateThreadReq extends $pb.GeneratedMessage {
  factory UpdateThreadReq({
    $core.int? id,
    $core.String? title,
    $core.String? body,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    if (body != null) result.body = body;
    return result;
  }

  UpdateThreadReq._();

  factory UpdateThreadReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateThreadReq.fromJson(
          $core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateThreadReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'body')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateThreadReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateThreadReq copyWith(void Function(UpdateThreadReq) updates) =>
      super.copyWith((message) => updates(message as UpdateThreadReq))
          as UpdateThreadReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateThreadReq create() => UpdateThreadReq._();
  @$core.override
  UpdateThreadReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateThreadReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateThreadReq>(create);
  static UpdateThreadReq? _defaultInstance;

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
  $core.String get body => $_getSZ(2);
  @$pb.TagNumber(3)
  set body($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBody() => $_has(2);
  @$pb.TagNumber(3)
  void clearBody() => $_clearField(3);
}

class GetThreadsReq extends $pb.GeneratedMessage {
  factory GetThreadsReq({
    $core.int? forumId,
    $0.Ordering? ordering,
    $core.int? offset,
    $core.int? count,
  }) {
    final result = create();
    if (forumId != null) result.forumId = forumId;
    if (ordering != null) result.ordering = ordering;
    if (offset != null) result.offset = offset;
    if (count != null) result.count = count;
    return result;
  }

  GetThreadsReq._();

  factory GetThreadsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetThreadsReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetThreadsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'forumId', protoName: 'forumId')
    ..aE<$0.Ordering>(2, _omitFieldNames ? '' : 'ordering',
        enumValues: $0.Ordering.values)
    ..aI(3, _omitFieldNames ? '' : 'offset')
    ..aI(4, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetThreadsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetThreadsReq copyWith(void Function(GetThreadsReq) updates) =>
      super.copyWith((message) => updates(message as GetThreadsReq))
          as GetThreadsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetThreadsReq create() => GetThreadsReq._();
  @$core.override
  GetThreadsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetThreadsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetThreadsReq>(create);
  static GetThreadsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get forumId => $_getIZ(0);
  @$pb.TagNumber(1)
  set forumId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasForumId() => $_has(0);
  @$pb.TagNumber(1)
  void clearForumId() => $_clearField(1);

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

class GetThreadsResp extends $pb.GeneratedMessage {
  factory GetThreadsResp({
    $core.Iterable<Thread>? threads,
  }) {
    final result = create();
    if (threads != null) result.threads.addAll(threads);
    return result;
  }

  GetThreadsResp._();

  factory GetThreadsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetThreadsResp.fromJson(
          $core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetThreadsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..pPM<Thread>(1, _omitFieldNames ? '' : 'threads',
        subBuilder: Thread.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetThreadsResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetThreadsResp copyWith(void Function(GetThreadsResp) updates) =>
      super.copyWith((message) => updates(message as GetThreadsResp))
          as GetThreadsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetThreadsResp create() => GetThreadsResp._();
  @$core.override
  GetThreadsResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetThreadsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetThreadsResp>(create);
  static GetThreadsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Thread> get threads => $_getList(0);
}

enum Thread_Body { plainContent, markdownContent, notSet }

class Thread extends $pb.GeneratedMessage {
  factory Thread({
    $core.int? id,
    $core.String? uid,
    $core.String? title,
    $core.int? likes,
    $core.int? posts,
    $core.bool? pinned,
    $core.bool? digest,
    $1.Timestamp? createAt,
    $1.Timestamp? updateAt,
    $1.Timestamp? lastUpdate,
    $core.int? liked,
    $core.bool? saved,
    $0.PlainContent? plainContent,
    $0.MarkdownContent? markdownContent,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (uid != null) result.uid = uid;
    if (title != null) result.title = title;
    if (likes != null) result.likes = likes;
    if (posts != null) result.posts = posts;
    if (pinned != null) result.pinned = pinned;
    if (digest != null) result.digest = digest;
    if (createAt != null) result.createAt = createAt;
    if (updateAt != null) result.updateAt = updateAt;
    if (lastUpdate != null) result.lastUpdate = lastUpdate;
    if (liked != null) result.liked = liked;
    if (saved != null) result.saved = saved;
    if (plainContent != null) result.plainContent = plainContent;
    if (markdownContent != null) result.markdownContent = markdownContent;
    return result;
  }

  Thread._();

  factory Thread.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Thread.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static const $core.Map<$core.int, Thread_Body> _Thread_BodyByTag = {
    30: Thread_Body.plainContent,
    31: Thread_Body.markdownContent,
    0: Thread_Body.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Thread',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..oo(0, [30, 31])
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'uid')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aI(4, _omitFieldNames ? '' : 'likes')
    ..aI(5, _omitFieldNames ? '' : 'posts')
    ..aOB(6, _omitFieldNames ? '' : 'pinned')
    ..aOB(7, _omitFieldNames ? '' : 'digest')
    ..aOM<$1.Timestamp>(8, _omitFieldNames ? '' : 'createAt',
        protoName: 'createAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'updateAt',
        protoName: 'updateAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(10, _omitFieldNames ? '' : 'lastUpdate',
        protoName: 'lastUpdate', subBuilder: $1.Timestamp.create)
    ..aI(11, _omitFieldNames ? '' : 'liked')
    ..aOB(12, _omitFieldNames ? '' : 'saved')
    ..aOM<$0.PlainContent>(30, _omitFieldNames ? '' : 'plainContent',
        protoName: 'plainContent', subBuilder: $0.PlainContent.create)
    ..aOM<$0.MarkdownContent>(31, _omitFieldNames ? '' : 'markdownContent',
        protoName: 'markdownContent', subBuilder: $0.MarkdownContent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Thread clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Thread copyWith(void Function(Thread) updates) =>
      super.copyWith((message) => updates(message as Thread)) as Thread;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Thread create() => Thread._();
  @$core.override
  Thread createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Thread getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Thread>(create);
  static Thread? _defaultInstance;

  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  Thread_Body whichBody() => _Thread_BodyByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  void clearBody() => $_clearField($_whichOneof(0));

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
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get likes => $_getIZ(3);
  @$pb.TagNumber(4)
  set likes($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLikes() => $_has(3);
  @$pb.TagNumber(4)
  void clearLikes() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get posts => $_getIZ(4);
  @$pb.TagNumber(5)
  set posts($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPosts() => $_has(4);
  @$pb.TagNumber(5)
  void clearPosts() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get pinned => $_getBF(5);
  @$pb.TagNumber(6)
  set pinned($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPinned() => $_has(5);
  @$pb.TagNumber(6)
  void clearPinned() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get digest => $_getBF(6);
  @$pb.TagNumber(7)
  set digest($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDigest() => $_has(6);
  @$pb.TagNumber(7)
  void clearDigest() => $_clearField(7);

  @$pb.TagNumber(8)
  $1.Timestamp get createAt => $_getN(7);
  @$pb.TagNumber(8)
  set createAt($1.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasCreateAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreateAt() => $_clearField(8);
  @$pb.TagNumber(8)
  $1.Timestamp ensureCreateAt() => $_ensure(7);

  /// Last modification.
  @$pb.TagNumber(9)
  $1.Timestamp get updateAt => $_getN(8);
  @$pb.TagNumber(9)
  set updateAt($1.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasUpdateAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpdateAt() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureUpdateAt() => $_ensure(8);

  /// Last activity.
  @$pb.TagNumber(10)
  $1.Timestamp get lastUpdate => $_getN(9);
  @$pb.TagNumber(10)
  set lastUpdate($1.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasLastUpdate() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastUpdate() => $_clearField(10);
  @$pb.TagNumber(10)
  $1.Timestamp ensureLastUpdate() => $_ensure(9);

  /// + For like. - for dislike. 0 for cancel.
  @$pb.TagNumber(11)
  $core.int get liked => $_getIZ(10);
  @$pb.TagNumber(11)
  set liked($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasLiked() => $_has(10);
  @$pb.TagNumber(11)
  void clearLiked() => $_clearField(11);

  /// Whether current thread is saved by user.
  @$pb.TagNumber(12)
  $core.bool get saved => $_getBF(11);
  @$pb.TagNumber(12)
  set saved($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasSaved() => $_has(11);
  @$pb.TagNumber(12)
  void clearSaved() => $_clearField(12);

  @$pb.TagNumber(30)
  $0.PlainContent get plainContent => $_getN(12);
  @$pb.TagNumber(30)
  set plainContent($0.PlainContent value) => $_setField(30, value);
  @$pb.TagNumber(30)
  $core.bool hasPlainContent() => $_has(12);
  @$pb.TagNumber(30)
  void clearPlainContent() => $_clearField(30);
  @$pb.TagNumber(30)
  $0.PlainContent ensurePlainContent() => $_ensure(12);

  @$pb.TagNumber(31)
  $0.MarkdownContent get markdownContent => $_getN(13);
  @$pb.TagNumber(31)
  set markdownContent($0.MarkdownContent value) => $_setField(31, value);
  @$pb.TagNumber(31)
  $core.bool hasMarkdownContent() => $_has(13);
  @$pb.TagNumber(31)
  void clearMarkdownContent() => $_clearField(31);
  @$pb.TagNumber(31)
  $0.MarkdownContent ensureMarkdownContent() => $_ensure(13);
}

class LikeThreadReq extends $pb.GeneratedMessage {
  factory LikeThreadReq({
    $core.int? threadId,
    $core.int? like,
  }) {
    final result = create();
    if (threadId != null) result.threadId = threadId;
    if (like != null) result.like = like;
    return result;
  }

  LikeThreadReq._();

  factory LikeThreadReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LikeThreadReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LikeThreadReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'threadId', protoName: 'threadId')
    ..aI(2, _omitFieldNames ? '' : 'like')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LikeThreadReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LikeThreadReq copyWith(void Function(LikeThreadReq) updates) =>
      super.copyWith((message) => updates(message as LikeThreadReq))
          as LikeThreadReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LikeThreadReq create() => LikeThreadReq._();
  @$core.override
  LikeThreadReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LikeThreadReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LikeThreadReq>(create);
  static LikeThreadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => $_clearField(1);

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

class PinThreadReq extends $pb.GeneratedMessage {
  factory PinThreadReq({
    $core.int? threadId,
    $core.bool? pinned,
  }) {
    final result = create();
    if (threadId != null) result.threadId = threadId;
    if (pinned != null) result.pinned = pinned;
    return result;
  }

  PinThreadReq._();

  factory PinThreadReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PinThreadReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PinThreadReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'threadId', protoName: 'threadId')
    ..aOB(2, _omitFieldNames ? '' : 'pinned')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PinThreadReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PinThreadReq copyWith(void Function(PinThreadReq) updates) =>
      super.copyWith((message) => updates(message as PinThreadReq))
          as PinThreadReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PinThreadReq create() => PinThreadReq._();
  @$core.override
  PinThreadReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PinThreadReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PinThreadReq>(create);
  static PinThreadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get pinned => $_getBF(1);
  @$pb.TagNumber(2)
  set pinned($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPinned() => $_has(1);
  @$pb.TagNumber(2)
  void clearPinned() => $_clearField(2);
}

class DigestThreadReq extends $pb.GeneratedMessage {
  factory DigestThreadReq({
    $core.int? threadId,
    $core.bool? digest,
  }) {
    final result = create();
    if (threadId != null) result.threadId = threadId;
    if (digest != null) result.digest = digest;
    return result;
  }

  DigestThreadReq._();

  factory DigestThreadReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DigestThreadReq.fromJson(
          $core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DigestThreadReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'threadId', protoName: 'threadId')
    ..aOB(2, _omitFieldNames ? '' : 'digest')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DigestThreadReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DigestThreadReq copyWith(void Function(DigestThreadReq) updates) =>
      super.copyWith((message) => updates(message as DigestThreadReq))
          as DigestThreadReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DigestThreadReq create() => DigestThreadReq._();
  @$core.override
  DigestThreadReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DigestThreadReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DigestThreadReq>(create);
  static DigestThreadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get digest => $_getBF(1);
  @$pb.TagNumber(2)
  set digest($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDigest() => $_has(1);
  @$pb.TagNumber(2)
  void clearDigest() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
