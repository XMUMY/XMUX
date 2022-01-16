///
//  Generated code. Do not modify.
//  source: reply.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $4;

import 'reply.pbenum.dart';

export 'reply.pbenum.dart';

class CreateReplyReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateReplyReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refReplyId', $pb.PbFieldType.O3, protoName: 'refReplyId')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refPostId', $pb.PbFieldType.O3, protoName: 'refPostId')
    ..hasRequiredFields = false
  ;

  CreateReplyReq._() : super();
  factory CreateReplyReq({
    $core.String? content,
    $core.int? refReplyId,
    $core.int? refPostId,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (refReplyId != null) {
      _result.refReplyId = refReplyId;
    }
    if (refPostId != null) {
      _result.refPostId = refPostId;
    }
    return _result;
  }
  factory CreateReplyReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateReplyReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateReplyReq clone() => CreateReplyReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateReplyReq copyWith(void Function(CreateReplyReq) updates) => super.copyWith((message) => updates(message as CreateReplyReq)) as CreateReplyReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReplyReq create() => CreateReplyReq._();
  CreateReplyReq createEmptyInstance() => create();
  static $pb.PbList<CreateReplyReq> createRepeated() => $pb.PbList<CreateReplyReq>();
  @$core.pragma('dart2js:noInline')
  static CreateReplyReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateReplyReq>(create);
  static CreateReplyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);

  @$pb.TagNumber(3)
  $core.int get refReplyId => $_getIZ(1);
  @$pb.TagNumber(3)
  set refReplyId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefReplyId() => $_has(1);
  @$pb.TagNumber(3)
  void clearRefReplyId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get refPostId => $_getIZ(2);
  @$pb.TagNumber(4)
  set refPostId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasRefPostId() => $_has(2);
  @$pb.TagNumber(4)
  void clearRefPostId() => clearField(4);
}

class CreateReplyResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateReplyResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'replyId', $pb.PbFieldType.O3, protoName: 'replyId')
    ..hasRequiredFields = false
  ;

  CreateReplyResp._() : super();
  factory CreateReplyResp({
    $core.int? replyId,
  }) {
    final _result = create();
    if (replyId != null) {
      _result.replyId = replyId;
    }
    return _result;
  }
  factory CreateReplyResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateReplyResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateReplyResp clone() => CreateReplyResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateReplyResp copyWith(void Function(CreateReplyResp) updates) => super.copyWith((message) => updates(message as CreateReplyResp)) as CreateReplyResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReplyResp create() => CreateReplyResp._();
  CreateReplyResp createEmptyInstance() => create();
  static $pb.PbList<CreateReplyResp> createRepeated() => $pb.PbList<CreateReplyResp>();
  @$core.pragma('dart2js:noInline')
  static CreateReplyResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateReplyResp>(create);
  static CreateReplyResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get replyId => $_getIZ(0);
  @$pb.TagNumber(1)
  set replyId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReplyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReplyId() => clearField(1);
}

class GetReplyReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetReplyReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageNo', $pb.PbFieldType.O3, protoName: 'pageNo')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageSize', $pb.PbFieldType.O3, protoName: 'pageSize')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refPostId', $pb.PbFieldType.O3, protoName: 'refPostId')
    ..e<SortingMethod>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sort', $pb.PbFieldType.OE, defaultOrMaker: SortingMethod.NEWEST, valueOf: SortingMethod.valueOf, enumValues: SortingMethod.values)
    ..hasRequiredFields = false
  ;

  GetReplyReq._() : super();
  factory GetReplyReq({
    $core.int? pageNo,
    $core.int? pageSize,
    $core.int? refPostId,
    SortingMethod? sort,
  }) {
    final _result = create();
    if (pageNo != null) {
      _result.pageNo = pageNo;
    }
    if (pageSize != null) {
      _result.pageSize = pageSize;
    }
    if (refPostId != null) {
      _result.refPostId = refPostId;
    }
    if (sort != null) {
      _result.sort = sort;
    }
    return _result;
  }
  factory GetReplyReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetReplyReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetReplyReq clone() => GetReplyReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetReplyReq copyWith(void Function(GetReplyReq) updates) => super.copyWith((message) => updates(message as GetReplyReq)) as GetReplyReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetReplyReq create() => GetReplyReq._();
  GetReplyReq createEmptyInstance() => create();
  static $pb.PbList<GetReplyReq> createRepeated() => $pb.PbList<GetReplyReq>();
  @$core.pragma('dart2js:noInline')
  static GetReplyReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetReplyReq>(create);
  static GetReplyReq? _defaultInstance;

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
  $core.int get refPostId => $_getIZ(2);
  @$pb.TagNumber(3)
  set refPostId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefPostId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefPostId() => clearField(3);

  @$pb.TagNumber(4)
  SortingMethod get sort => $_getN(3);
  @$pb.TagNumber(4)
  set sort(SortingMethod v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSort() => $_has(3);
  @$pb.TagNumber(4)
  void clearSort() => clearField(4);
}

class GetUserReplyReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetUserReplyReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageNo', $pb.PbFieldType.O3, protoName: 'pageNo')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageSize', $pb.PbFieldType.O3, protoName: 'pageSize')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  GetUserReplyReq._() : super();
  factory GetUserReplyReq({
    $core.int? pageNo,
    $core.int? pageSize,
    $core.String? uid,
  }) {
    final _result = create();
    if (pageNo != null) {
      _result.pageNo = pageNo;
    }
    if (pageSize != null) {
      _result.pageSize = pageSize;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory GetUserReplyReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserReplyReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserReplyReq clone() => GetUserReplyReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserReplyReq copyWith(void Function(GetUserReplyReq) updates) => super.copyWith((message) => updates(message as GetUserReplyReq)) as GetUserReplyReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserReplyReq create() => GetUserReplyReq._();
  GetUserReplyReq createEmptyInstance() => create();
  static $pb.PbList<GetUserReplyReq> createRepeated() => $pb.PbList<GetUserReplyReq>();
  @$core.pragma('dart2js:noInline')
  static GetUserReplyReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserReplyReq>(create);
  static GetUserReplyReq? _defaultInstance;

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
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);
}

class GetReplyByIdReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetReplyByIdReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'replyId', $pb.PbFieldType.O3, protoName: 'replyId')
    ..hasRequiredFields = false
  ;

  GetReplyByIdReq._() : super();
  factory GetReplyByIdReq({
    $core.int? replyId,
  }) {
    final _result = create();
    if (replyId != null) {
      _result.replyId = replyId;
    }
    return _result;
  }
  factory GetReplyByIdReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetReplyByIdReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetReplyByIdReq clone() => GetReplyByIdReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetReplyByIdReq copyWith(void Function(GetReplyByIdReq) updates) => super.copyWith((message) => updates(message as GetReplyByIdReq)) as GetReplyByIdReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetReplyByIdReq create() => GetReplyByIdReq._();
  GetReplyByIdReq createEmptyInstance() => create();
  static $pb.PbList<GetReplyByIdReq> createRepeated() => $pb.PbList<GetReplyByIdReq>();
  @$core.pragma('dart2js:noInline')
  static GetReplyByIdReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetReplyByIdReq>(create);
  static GetReplyByIdReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get replyId => $_getIZ(0);
  @$pb.TagNumber(1)
  set replyId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReplyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReplyId() => clearField(1);
}

class GetReplyResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetReplyResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..pc<Reply>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'replies', $pb.PbFieldType.PM, subBuilder: Reply.create)
    ..hasRequiredFields = false
  ;

  GetReplyResp._() : super();
  factory GetReplyResp({
    $core.Iterable<Reply>? replies,
  }) {
    final _result = create();
    if (replies != null) {
      _result.replies.addAll(replies);
    }
    return _result;
  }
  factory GetReplyResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetReplyResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetReplyResp clone() => GetReplyResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetReplyResp copyWith(void Function(GetReplyResp) updates) => super.copyWith((message) => updates(message as GetReplyResp)) as GetReplyResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetReplyResp create() => GetReplyResp._();
  GetReplyResp createEmptyInstance() => create();
  static $pb.PbList<GetReplyResp> createRepeated() => $pb.PbList<GetReplyResp>();
  @$core.pragma('dart2js:noInline')
  static GetReplyResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetReplyResp>(create);
  static GetReplyResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Reply> get replies => $_getList(0);
}

class UpdateReplyReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateReplyReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'replyId', $pb.PbFieldType.O3, protoName: 'replyId')
    ..hasRequiredFields = false
  ;

  UpdateReplyReq._() : super();
  factory UpdateReplyReq({
    $core.int? replyId,
  }) {
    final _result = create();
    if (replyId != null) {
      _result.replyId = replyId;
    }
    return _result;
  }
  factory UpdateReplyReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateReplyReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateReplyReq clone() => UpdateReplyReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateReplyReq copyWith(void Function(UpdateReplyReq) updates) => super.copyWith((message) => updates(message as UpdateReplyReq)) as UpdateReplyReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateReplyReq create() => UpdateReplyReq._();
  UpdateReplyReq createEmptyInstance() => create();
  static $pb.PbList<UpdateReplyReq> createRepeated() => $pb.PbList<UpdateReplyReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateReplyReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateReplyReq>(create);
  static UpdateReplyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get replyId => $_getIZ(0);
  @$pb.TagNumber(1)
  set replyId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReplyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReplyId() => clearField(1);
}

class Reply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Reply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.forum.v4'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vote', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topped')
    ..aOM<$4.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime', protoName: 'createTime', subBuilder: $4.Timestamp.create)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refReplyId', $pb.PbFieldType.O3, protoName: 'refReplyId')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refUid', protoName: 'refUid')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refPostId', $pb.PbFieldType.O3, protoName: 'refPostId')
    ..hasRequiredFields = false
  ;

  Reply._() : super();
  factory Reply({
    $core.int? id,
    $core.String? content,
    $core.int? vote,
    $core.String? uid,
    $core.bool? topped,
    $4.Timestamp? createTime,
    $core.int? refReplyId,
    $core.String? refUid,
    $core.int? refPostId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (content != null) {
      _result.content = content;
    }
    if (vote != null) {
      _result.vote = vote;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (topped != null) {
      _result.topped = topped;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (refReplyId != null) {
      _result.refReplyId = refReplyId;
    }
    if (refUid != null) {
      _result.refUid = refUid;
    }
    if (refPostId != null) {
      _result.refPostId = refPostId;
    }
    return _result;
  }
  factory Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reply clone() => Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reply copyWith(void Function(Reply) updates) => super.copyWith((message) => updates(message as Reply)) as Reply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Reply create() => Reply._();
  Reply createEmptyInstance() => create();
  static $pb.PbList<Reply> createRepeated() => $pb.PbList<Reply>();
  @$core.pragma('dart2js:noInline')
  static Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply>(create);
  static Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get vote => $_getIZ(2);
  @$pb.TagNumber(3)
  set vote($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVote() => $_has(2);
  @$pb.TagNumber(3)
  void clearVote() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get uid => $_getSZ(3);
  @$pb.TagNumber(4)
  set uid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get topped => $_getBF(4);
  @$pb.TagNumber(5)
  set topped($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTopped() => $_has(4);
  @$pb.TagNumber(5)
  void clearTopped() => clearField(5);

  @$pb.TagNumber(6)
  $4.Timestamp get createTime => $_getN(5);
  @$pb.TagNumber(6)
  set createTime($4.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => clearField(6);
  @$pb.TagNumber(6)
  $4.Timestamp ensureCreateTime() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get refReplyId => $_getIZ(6);
  @$pb.TagNumber(7)
  set refReplyId($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRefReplyId() => $_has(6);
  @$pb.TagNumber(7)
  void clearRefReplyId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get refUid => $_getSZ(7);
  @$pb.TagNumber(8)
  set refUid($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRefUid() => $_has(7);
  @$pb.TagNumber(8)
  void clearRefUid() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get refPostId => $_getIZ(8);
  @$pb.TagNumber(9)
  set refPostId($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasRefPostId() => $_has(8);
  @$pb.TagNumber(9)
  void clearRefPostId() => clearField(9);
}

