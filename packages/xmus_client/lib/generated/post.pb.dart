///
//  Generated code. Do not modify.
//  source: post.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $3;

class CreatePostReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreatePostReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xdea.xmux.forum'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupId', $pb.PbFieldType.O3, protoName: 'groupId')
    ..hasRequiredFields = false
  ;

  CreatePostReq._() : super();
  factory CreatePostReq({
    $core.String? title,
    $core.String? body,
    $core.int? groupId,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (body != null) {
      _result.body = body;
    }
    if (groupId != null) {
      _result.groupId = groupId;
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

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get body => $_getSZ(1);
  @$pb.TagNumber(2)
  set body($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get groupId => $_getIZ(2);
  @$pb.TagNumber(3)
  set groupId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroupId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupId() => clearField(3);
}

class CreatePostResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreatePostResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xdea.xmux.forum'), createEmptyInstance: create)
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

class GetPostReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPostReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xdea.xmux.forum'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageNo', $pb.PbFieldType.O3, protoName: 'pageNo')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageSize', $pb.PbFieldType.O3, protoName: 'pageSize')
    ..p<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupIds', $pb.PbFieldType.P3, protoName: 'groupIds')
    ..hasRequiredFields = false
  ;

  GetPostReq._() : super();
  factory GetPostReq({
    $core.int? pageNo,
    $core.int? pageSize,
    $core.Iterable<$core.int>? groupIds,
  }) {
    final _result = create();
    if (pageNo != null) {
      _result.pageNo = pageNo;
    }
    if (pageSize != null) {
      _result.pageSize = pageSize;
    }
    if (groupIds != null) {
      _result.groupIds.addAll(groupIds);
    }
    return _result;
  }
  factory GetPostReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostReq clone() => GetPostReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostReq copyWith(void Function(GetPostReq) updates) => super.copyWith((message) => updates(message as GetPostReq)) as GetPostReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPostReq create() => GetPostReq._();
  GetPostReq createEmptyInstance() => create();
  static $pb.PbList<GetPostReq> createRepeated() => $pb.PbList<GetPostReq>();
  @$core.pragma('dart2js:noInline')
  static GetPostReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostReq>(create);
  static GetPostReq? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.List<$core.int> get groupIds => $_getList(2);
}

class GetPostResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPostResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xdea.xmux.forum'), createEmptyInstance: create)
    ..pc<PostDetails>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pd', $pb.PbFieldType.PM, subBuilder: PostDetails.create)
    ..hasRequiredFields = false
  ;

  GetPostResp._() : super();
  factory GetPostResp({
    $core.Iterable<PostDetails>? pd,
  }) {
    final _result = create();
    if (pd != null) {
      _result.pd.addAll(pd);
    }
    return _result;
  }
  factory GetPostResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostResp clone() => GetPostResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostResp copyWith(void Function(GetPostResp) updates) => super.copyWith((message) => updates(message as GetPostResp)) as GetPostResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPostResp create() => GetPostResp._();
  GetPostResp createEmptyInstance() => create();
  static $pb.PbList<GetPostResp> createRepeated() => $pb.PbList<GetPostResp>();
  @$core.pragma('dart2js:noInline')
  static GetPostResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostResp>(create);
  static GetPostResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PostDetails> get pd => $_getList(0);
}

class UpdatePostReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePostReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xdea.xmux.forum'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'postId', $pb.PbFieldType.O3, protoName: 'postId')
    ..hasRequiredFields = false
  ;

  UpdatePostReq._() : super();
  factory UpdatePostReq({
    $core.int? postId,
  }) {
    final _result = create();
    if (postId != null) {
      _result.postId = postId;
    }
    return _result;
  }
  factory UpdatePostReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePostReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePostReq clone() => UpdatePostReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePostReq copyWith(void Function(UpdatePostReq) updates) => super.copyWith((message) => updates(message as UpdatePostReq)) as UpdatePostReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePostReq create() => UpdatePostReq._();
  UpdatePostReq createEmptyInstance() => create();
  static $pb.PbList<UpdatePostReq> createRepeated() => $pb.PbList<UpdatePostReq>();
  @$core.pragma('dart2js:noInline')
  static UpdatePostReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePostReq>(create);
  static UpdatePostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get postId => $_getIZ(0);
  @$pb.TagNumber(1)
  set postId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);
}

class PostDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostDetails', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xdea.xmux.forum'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vote', $pb.PbFieldType.O3)
    ..aOM<$3.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime', protoName: 'createTime', subBuilder: $3.Timestamp.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupId', $pb.PbFieldType.O3, protoName: 'groupId')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topped')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best')
    ..aOM<$3.Timestamp>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime', protoName: 'updateTime', subBuilder: $3.Timestamp.create)
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupName', protoName: 'groupName')
    ..hasRequiredFields = false
  ;

  PostDetails._() : super();
  factory PostDetails({
    $core.int? id,
    $core.String? title,
    $core.String? body,
    $core.int? vote,
    $3.Timestamp? createTime,
    $core.String? uid,
    $core.int? groupId,
    $core.bool? topped,
    $core.bool? best,
    $3.Timestamp? updateTime,
    $core.String? groupName,
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
    if (vote != null) {
      _result.vote = vote;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (topped != null) {
      _result.topped = topped;
    }
    if (best != null) {
      _result.best = best;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    if (groupName != null) {
      _result.groupName = groupName;
    }
    return _result;
  }
  factory PostDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostDetails clone() => PostDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostDetails copyWith(void Function(PostDetails) updates) => super.copyWith((message) => updates(message as PostDetails)) as PostDetails; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostDetails create() => PostDetails._();
  PostDetails createEmptyInstance() => create();
  static $pb.PbList<PostDetails> createRepeated() => $pb.PbList<PostDetails>();
  @$core.pragma('dart2js:noInline')
  static PostDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostDetails>(create);
  static PostDetails? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.int get vote => $_getIZ(3);
  @$pb.TagNumber(4)
  set vote($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasVote() => $_has(3);
  @$pb.TagNumber(4)
  void clearVote() => clearField(4);

  @$pb.TagNumber(5)
  $3.Timestamp get createTime => $_getN(4);
  @$pb.TagNumber(5)
  set createTime($3.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreateTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateTime() => clearField(5);
  @$pb.TagNumber(5)
  $3.Timestamp ensureCreateTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get uid => $_getSZ(5);
  @$pb.TagNumber(6)
  set uid($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUid() => $_has(5);
  @$pb.TagNumber(6)
  void clearUid() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get groupId => $_getIZ(6);
  @$pb.TagNumber(7)
  set groupId($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasGroupId() => $_has(6);
  @$pb.TagNumber(7)
  void clearGroupId() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get topped => $_getBF(7);
  @$pb.TagNumber(8)
  set topped($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTopped() => $_has(7);
  @$pb.TagNumber(8)
  void clearTopped() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get best => $_getBF(8);
  @$pb.TagNumber(9)
  set best($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBest() => $_has(8);
  @$pb.TagNumber(9)
  void clearBest() => clearField(9);

  @$pb.TagNumber(10)
  $3.Timestamp get updateTime => $_getN(9);
  @$pb.TagNumber(10)
  set updateTime($3.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasUpdateTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdateTime() => clearField(10);
  @$pb.TagNumber(10)
  $3.Timestamp ensureUpdateTime() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get groupName => $_getSZ(10);
  @$pb.TagNumber(11)
  set groupName($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasGroupName() => $_has(10);
  @$pb.TagNumber(11)
  void clearGroupName() => clearField(11);
}

