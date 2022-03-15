///
//  Generated code. Do not modify.
//  source: forum_thread.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $5;

import 'forum_common.pbenum.dart' as $6;

class CreateThreadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateThreadReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'forumId', $pb.PbFieldType.O3, protoName: 'forumId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body')
    ..hasRequiredFields = false
  ;

  CreateThreadReq._() : super();
  factory CreateThreadReq({
    $core.int? forumId,
    $core.String? title,
    $core.String? body,
  }) {
    final _result = create();
    if (forumId != null) {
      _result.forumId = forumId;
    }
    if (title != null) {
      _result.title = title;
    }
    if (body != null) {
      _result.body = body;
    }
    return _result;
  }
  factory CreateThreadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateThreadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateThreadReq clone() => CreateThreadReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateThreadReq copyWith(void Function(CreateThreadReq) updates) => super.copyWith((message) => updates(message as CreateThreadReq)) as CreateThreadReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateThreadReq create() => CreateThreadReq._();
  CreateThreadReq createEmptyInstance() => create();
  static $pb.PbList<CreateThreadReq> createRepeated() => $pb.PbList<CreateThreadReq>();
  @$core.pragma('dart2js:noInline')
  static CreateThreadReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateThreadReq>(create);
  static CreateThreadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get forumId => $_getIZ(0);
  @$pb.TagNumber(1)
  set forumId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasForumId() => $_has(0);
  @$pb.TagNumber(1)
  void clearForumId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get body => $_getSZ(2);
  @$pb.TagNumber(3)
  set body($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBody() => $_has(2);
  @$pb.TagNumber(3)
  void clearBody() => clearField(3);
}

class CreateThreadResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateThreadResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threadId', $pb.PbFieldType.O3, protoName: 'threadId')
    ..hasRequiredFields = false
  ;

  CreateThreadResp._() : super();
  factory CreateThreadResp({
    $core.int? threadId,
  }) {
    final _result = create();
    if (threadId != null) {
      _result.threadId = threadId;
    }
    return _result;
  }
  factory CreateThreadResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateThreadResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateThreadResp clone() => CreateThreadResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateThreadResp copyWith(void Function(CreateThreadResp) updates) => super.copyWith((message) => updates(message as CreateThreadResp)) as CreateThreadResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateThreadResp create() => CreateThreadResp._();
  CreateThreadResp createEmptyInstance() => create();
  static $pb.PbList<CreateThreadResp> createRepeated() => $pb.PbList<CreateThreadResp>();
  @$core.pragma('dart2js:noInline')
  static CreateThreadResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateThreadResp>(create);
  static CreateThreadResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => clearField(1);
}

class RemoveThreadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoveThreadReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threadId', $pb.PbFieldType.O3, protoName: 'threadId')
    ..hasRequiredFields = false
  ;

  RemoveThreadReq._() : super();
  factory RemoveThreadReq({
    $core.int? threadId,
  }) {
    final _result = create();
    if (threadId != null) {
      _result.threadId = threadId;
    }
    return _result;
  }
  factory RemoveThreadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveThreadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveThreadReq clone() => RemoveThreadReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveThreadReq copyWith(void Function(RemoveThreadReq) updates) => super.copyWith((message) => updates(message as RemoveThreadReq)) as RemoveThreadReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoveThreadReq create() => RemoveThreadReq._();
  RemoveThreadReq createEmptyInstance() => create();
  static $pb.PbList<RemoveThreadReq> createRepeated() => $pb.PbList<RemoveThreadReq>();
  @$core.pragma('dart2js:noInline')
  static RemoveThreadReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveThreadReq>(create);
  static RemoveThreadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => clearField(1);
}

class UpdateThreadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateThreadReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body')
    ..hasRequiredFields = false
  ;

  UpdateThreadReq._() : super();
  factory UpdateThreadReq({
    $core.int? id,
    $core.String? title,
    $core.String? body,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (body != null) {
      _result.body = body;
    }
    return _result;
  }
  factory UpdateThreadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateThreadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateThreadReq clone() => UpdateThreadReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateThreadReq copyWith(void Function(UpdateThreadReq) updates) => super.copyWith((message) => updates(message as UpdateThreadReq)) as UpdateThreadReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateThreadReq create() => UpdateThreadReq._();
  UpdateThreadReq createEmptyInstance() => create();
  static $pb.PbList<UpdateThreadReq> createRepeated() => $pb.PbList<UpdateThreadReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateThreadReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateThreadReq>(create);
  static UpdateThreadReq? _defaultInstance;

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
  $core.String get body => $_getSZ(2);
  @$pb.TagNumber(3)
  set body($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBody() => $_has(2);
  @$pb.TagNumber(3)
  void clearBody() => clearField(3);
}

class GetThreadsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetThreadsReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'forumId', $pb.PbFieldType.O3, protoName: 'forumId')
    ..e<$6.Ordering>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ordering', $pb.PbFieldType.OE, defaultOrMaker: $6.Ordering.update, valueOf: $6.Ordering.valueOf, enumValues: $6.Ordering.values)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetThreadsReq._() : super();
  factory GetThreadsReq({
    $core.int? forumId,
    $6.Ordering? ordering,
    $core.int? offset,
    $core.int? count,
  }) {
    final _result = create();
    if (forumId != null) {
      _result.forumId = forumId;
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
  factory GetThreadsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetThreadsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetThreadsReq clone() => GetThreadsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetThreadsReq copyWith(void Function(GetThreadsReq) updates) => super.copyWith((message) => updates(message as GetThreadsReq)) as GetThreadsReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetThreadsReq create() => GetThreadsReq._();
  GetThreadsReq createEmptyInstance() => create();
  static $pb.PbList<GetThreadsReq> createRepeated() => $pb.PbList<GetThreadsReq>();
  @$core.pragma('dart2js:noInline')
  static GetThreadsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetThreadsReq>(create);
  static GetThreadsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get forumId => $_getIZ(0);
  @$pb.TagNumber(1)
  set forumId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasForumId() => $_has(0);
  @$pb.TagNumber(1)
  void clearForumId() => clearField(1);

  @$pb.TagNumber(2)
  $6.Ordering get ordering => $_getN(1);
  @$pb.TagNumber(2)
  set ordering($6.Ordering v) { setField(2, v); }
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

class GetThreadsResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetThreadsResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..pc<Thread>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threads', $pb.PbFieldType.PM, subBuilder: Thread.create)
    ..hasRequiredFields = false
  ;

  GetThreadsResp._() : super();
  factory GetThreadsResp({
    $core.Iterable<Thread>? threads,
  }) {
    final _result = create();
    if (threads != null) {
      _result.threads.addAll(threads);
    }
    return _result;
  }
  factory GetThreadsResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetThreadsResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetThreadsResp clone() => GetThreadsResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetThreadsResp copyWith(void Function(GetThreadsResp) updates) => super.copyWith((message) => updates(message as GetThreadsResp)) as GetThreadsResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetThreadsResp create() => GetThreadsResp._();
  GetThreadsResp createEmptyInstance() => create();
  static $pb.PbList<GetThreadsResp> createRepeated() => $pb.PbList<GetThreadsResp>();
  @$core.pragma('dart2js:noInline')
  static GetThreadsResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetThreadsResp>(create);
  static GetThreadsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Thread> get threads => $_getList(0);
}

class Thread extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Thread', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'likes', $pb.PbFieldType.O3)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pinned')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'digest')
    ..aOM<$5.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createAt', protoName: 'createAt', subBuilder: $5.Timestamp.create)
    ..aOM<$5.Timestamp>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateAt', protoName: 'updateAt', subBuilder: $5.Timestamp.create)
    ..aOM<$5.Timestamp>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastUpdate', protoName: 'lastUpdate', subBuilder: $5.Timestamp.create)
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'liked', $pb.PbFieldType.O3)
    ..aOB(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'saved')
    ..hasRequiredFields = false
  ;

  Thread._() : super();
  factory Thread({
    $core.int? id,
    $core.String? uid,
    $core.String? title,
    $core.String? body,
    $core.int? likes,
    $core.bool? pinned,
    $core.bool? digest,
    $5.Timestamp? createAt,
    $5.Timestamp? updateAt,
    $5.Timestamp? lastUpdate,
    $core.int? liked,
    $core.bool? saved,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (title != null) {
      _result.title = title;
    }
    if (body != null) {
      _result.body = body;
    }
    if (likes != null) {
      _result.likes = likes;
    }
    if (pinned != null) {
      _result.pinned = pinned;
    }
    if (digest != null) {
      _result.digest = digest;
    }
    if (createAt != null) {
      _result.createAt = createAt;
    }
    if (updateAt != null) {
      _result.updateAt = updateAt;
    }
    if (lastUpdate != null) {
      _result.lastUpdate = lastUpdate;
    }
    if (liked != null) {
      _result.liked = liked;
    }
    if (saved != null) {
      _result.saved = saved;
    }
    return _result;
  }
  factory Thread.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Thread.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Thread clone() => Thread()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Thread copyWith(void Function(Thread) updates) => super.copyWith((message) => updates(message as Thread)) as Thread; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Thread create() => Thread._();
  Thread createEmptyInstance() => create();
  static $pb.PbList<Thread> createRepeated() => $pb.PbList<Thread>();
  @$core.pragma('dart2js:noInline')
  static Thread getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Thread>(create);
  static Thread? _defaultInstance;

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
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get body => $_getSZ(3);
  @$pb.TagNumber(4)
  set body($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBody() => $_has(3);
  @$pb.TagNumber(4)
  void clearBody() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get likes => $_getIZ(4);
  @$pb.TagNumber(5)
  set likes($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLikes() => $_has(4);
  @$pb.TagNumber(5)
  void clearLikes() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get pinned => $_getBF(5);
  @$pb.TagNumber(6)
  set pinned($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPinned() => $_has(5);
  @$pb.TagNumber(6)
  void clearPinned() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get digest => $_getBF(6);
  @$pb.TagNumber(7)
  set digest($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDigest() => $_has(6);
  @$pb.TagNumber(7)
  void clearDigest() => clearField(7);

  @$pb.TagNumber(8)
  $5.Timestamp get createAt => $_getN(7);
  @$pb.TagNumber(8)
  set createAt($5.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreateAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreateAt() => clearField(8);
  @$pb.TagNumber(8)
  $5.Timestamp ensureCreateAt() => $_ensure(7);

  @$pb.TagNumber(9)
  $5.Timestamp get updateAt => $_getN(8);
  @$pb.TagNumber(9)
  set updateAt($5.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasUpdateAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpdateAt() => clearField(9);
  @$pb.TagNumber(9)
  $5.Timestamp ensureUpdateAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $5.Timestamp get lastUpdate => $_getN(9);
  @$pb.TagNumber(10)
  set lastUpdate($5.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasLastUpdate() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastUpdate() => clearField(10);
  @$pb.TagNumber(10)
  $5.Timestamp ensureLastUpdate() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.int get liked => $_getIZ(10);
  @$pb.TagNumber(11)
  set liked($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLiked() => $_has(10);
  @$pb.TagNumber(11)
  void clearLiked() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get saved => $_getBF(11);
  @$pb.TagNumber(12)
  set saved($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasSaved() => $_has(11);
  @$pb.TagNumber(12)
  void clearSaved() => clearField(12);
}

class LikeThreadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LikeThreadReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threadId', $pb.PbFieldType.O3, protoName: 'threadId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'like', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  LikeThreadReq._() : super();
  factory LikeThreadReq({
    $core.int? threadId,
    $core.int? like,
  }) {
    final _result = create();
    if (threadId != null) {
      _result.threadId = threadId;
    }
    if (like != null) {
      _result.like = like;
    }
    return _result;
  }
  factory LikeThreadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LikeThreadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LikeThreadReq clone() => LikeThreadReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LikeThreadReq copyWith(void Function(LikeThreadReq) updates) => super.copyWith((message) => updates(message as LikeThreadReq)) as LikeThreadReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LikeThreadReq create() => LikeThreadReq._();
  LikeThreadReq createEmptyInstance() => create();
  static $pb.PbList<LikeThreadReq> createRepeated() => $pb.PbList<LikeThreadReq>();
  @$core.pragma('dart2js:noInline')
  static LikeThreadReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LikeThreadReq>(create);
  static LikeThreadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get like => $_getIZ(1);
  @$pb.TagNumber(2)
  set like($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLike() => $_has(1);
  @$pb.TagNumber(2)
  void clearLike() => clearField(2);
}

class PinThreadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PinThreadReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threadId', $pb.PbFieldType.O3, protoName: 'threadId')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pinned')
    ..hasRequiredFields = false
  ;

  PinThreadReq._() : super();
  factory PinThreadReq({
    $core.int? threadId,
    $core.bool? pinned,
  }) {
    final _result = create();
    if (threadId != null) {
      _result.threadId = threadId;
    }
    if (pinned != null) {
      _result.pinned = pinned;
    }
    return _result;
  }
  factory PinThreadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PinThreadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PinThreadReq clone() => PinThreadReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PinThreadReq copyWith(void Function(PinThreadReq) updates) => super.copyWith((message) => updates(message as PinThreadReq)) as PinThreadReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PinThreadReq create() => PinThreadReq._();
  PinThreadReq createEmptyInstance() => create();
  static $pb.PbList<PinThreadReq> createRepeated() => $pb.PbList<PinThreadReq>();
  @$core.pragma('dart2js:noInline')
  static PinThreadReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PinThreadReq>(create);
  static PinThreadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get pinned => $_getBF(1);
  @$pb.TagNumber(2)
  set pinned($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPinned() => $_has(1);
  @$pb.TagNumber(2)
  void clearPinned() => clearField(2);
}

class DigestThreadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DigestThreadReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'threadId', $pb.PbFieldType.O3, protoName: 'threadId')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'digest')
    ..hasRequiredFields = false
  ;

  DigestThreadReq._() : super();
  factory DigestThreadReq({
    $core.int? threadId,
    $core.bool? digest,
  }) {
    final _result = create();
    if (threadId != null) {
      _result.threadId = threadId;
    }
    if (digest != null) {
      _result.digest = digest;
    }
    return _result;
  }
  factory DigestThreadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DigestThreadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DigestThreadReq clone() => DigestThreadReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DigestThreadReq copyWith(void Function(DigestThreadReq) updates) => super.copyWith((message) => updates(message as DigestThreadReq)) as DigestThreadReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DigestThreadReq create() => DigestThreadReq._();
  DigestThreadReq createEmptyInstance() => create();
  static $pb.PbList<DigestThreadReq> createRepeated() => $pb.PbList<DigestThreadReq>();
  @$core.pragma('dart2js:noInline')
  static DigestThreadReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DigestThreadReq>(create);
  static DigestThreadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadId => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get digest => $_getBF(1);
  @$pb.TagNumber(2)
  set digest($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDigest() => $_has(1);
  @$pb.TagNumber(2)
  void clearDigest() => clearField(2);
}

