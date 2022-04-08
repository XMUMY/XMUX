///
//  Generated code. Do not modify.
//  source: chat/v1/chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TextMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TextMsg', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.chat.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'from')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'to')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  TextMsg._() : super();
  factory TextMsg({
    $core.String? from,
    $core.String? to,
    $core.String? msg,
  }) {
    final _result = create();
    if (from != null) {
      _result.from = from;
    }
    if (to != null) {
      _result.to = to;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory TextMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TextMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TextMsg clone() => TextMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TextMsg copyWith(void Function(TextMsg) updates) => super.copyWith((message) => updates(message as TextMsg)) as TextMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TextMsg create() => TextMsg._();
  TextMsg createEmptyInstance() => create();
  static $pb.PbList<TextMsg> createRepeated() => $pb.PbList<TextMsg>();
  @$core.pragma('dart2js:noInline')
  static TextMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TextMsg>(create);
  static TextMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get from => $_getSZ(0);
  @$pb.TagNumber(1)
  set from($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get to => $_getSZ(1);
  @$pb.TagNumber(2)
  set to($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);
}

enum ChatReq_Req {
  heartbeat, 
  getOnlineUserReq, 
  textMsg, 
  notSet
}

class ChatReq extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ChatReq_Req> _ChatReq_ReqByTag = {
    1 : ChatReq_Req.heartbeat,
    2 : ChatReq_Req.getOnlineUserReq,
    3 : ChatReq_Req.textMsg,
    0 : ChatReq_Req.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChatReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.chat.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<Heartbeat>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'heartbeat', subBuilder: Heartbeat.create)
    ..aOM<GetOnlineUsersReq>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'getOnlineUserReq', protoName: 'getOnlineUserReq', subBuilder: GetOnlineUsersReq.create)
    ..aOM<TextMsg>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'textMsg', protoName: 'textMsg', subBuilder: TextMsg.create)
    ..hasRequiredFields = false
  ;

  ChatReq._() : super();
  factory ChatReq({
    Heartbeat? heartbeat,
    GetOnlineUsersReq? getOnlineUserReq,
    TextMsg? textMsg,
  }) {
    final _result = create();
    if (heartbeat != null) {
      _result.heartbeat = heartbeat;
    }
    if (getOnlineUserReq != null) {
      _result.getOnlineUserReq = getOnlineUserReq;
    }
    if (textMsg != null) {
      _result.textMsg = textMsg;
    }
    return _result;
  }
  factory ChatReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatReq clone() => ChatReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatReq copyWith(void Function(ChatReq) updates) => super.copyWith((message) => updates(message as ChatReq)) as ChatReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatReq create() => ChatReq._();
  ChatReq createEmptyInstance() => create();
  static $pb.PbList<ChatReq> createRepeated() => $pb.PbList<ChatReq>();
  @$core.pragma('dart2js:noInline')
  static ChatReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatReq>(create);
  static ChatReq? _defaultInstance;

  ChatReq_Req whichReq() => _ChatReq_ReqByTag[$_whichOneof(0)]!;
  void clearReq() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Heartbeat get heartbeat => $_getN(0);
  @$pb.TagNumber(1)
  set heartbeat(Heartbeat v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeartbeat() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeartbeat() => clearField(1);
  @$pb.TagNumber(1)
  Heartbeat ensureHeartbeat() => $_ensure(0);

  @$pb.TagNumber(2)
  GetOnlineUsersReq get getOnlineUserReq => $_getN(1);
  @$pb.TagNumber(2)
  set getOnlineUserReq(GetOnlineUsersReq v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGetOnlineUserReq() => $_has(1);
  @$pb.TagNumber(2)
  void clearGetOnlineUserReq() => clearField(2);
  @$pb.TagNumber(2)
  GetOnlineUsersReq ensureGetOnlineUserReq() => $_ensure(1);

  @$pb.TagNumber(3)
  TextMsg get textMsg => $_getN(2);
  @$pb.TagNumber(3)
  set textMsg(TextMsg v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTextMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearTextMsg() => clearField(3);
  @$pb.TagNumber(3)
  TextMsg ensureTextMsg() => $_ensure(2);
}

class Heartbeat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Heartbeat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Heartbeat._() : super();
  factory Heartbeat() => create();
  factory Heartbeat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Heartbeat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Heartbeat clone() => Heartbeat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Heartbeat copyWith(void Function(Heartbeat) updates) => super.copyWith((message) => updates(message as Heartbeat)) as Heartbeat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Heartbeat create() => Heartbeat._();
  Heartbeat createEmptyInstance() => create();
  static $pb.PbList<Heartbeat> createRepeated() => $pb.PbList<Heartbeat>();
  @$core.pragma('dart2js:noInline')
  static Heartbeat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Heartbeat>(create);
  static Heartbeat? _defaultInstance;
}

class GetOnlineUsersReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetOnlineUsersReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetOnlineUsersReq._() : super();
  factory GetOnlineUsersReq() => create();
  factory GetOnlineUsersReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOnlineUsersReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetOnlineUsersReq clone() => GetOnlineUsersReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetOnlineUsersReq copyWith(void Function(GetOnlineUsersReq) updates) => super.copyWith((message) => updates(message as GetOnlineUsersReq)) as GetOnlineUsersReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetOnlineUsersReq create() => GetOnlineUsersReq._();
  GetOnlineUsersReq createEmptyInstance() => create();
  static $pb.PbList<GetOnlineUsersReq> createRepeated() => $pb.PbList<GetOnlineUsersReq>();
  @$core.pragma('dart2js:noInline')
  static GetOnlineUsersReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetOnlineUsersReq>(create);
  static GetOnlineUsersReq? _defaultInstance;
}

enum ChatResp_Resp {
  heartbeat, 
  getOnlineUserResp, 
  textMsg, 
  notSet
}

class ChatResp extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ChatResp_Resp> _ChatResp_RespByTag = {
    1 : ChatResp_Resp.heartbeat,
    2 : ChatResp_Resp.getOnlineUserResp,
    3 : ChatResp_Resp.textMsg,
    0 : ChatResp_Resp.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChatResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.chat.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<HeartbeatResp>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'heartbeat', subBuilder: HeartbeatResp.create)
    ..aOM<GetOnlineUsersResp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'getOnlineUserResp', protoName: 'getOnlineUserResp', subBuilder: GetOnlineUsersResp.create)
    ..aOM<TextMsg>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'textMsg', protoName: 'textMsg', subBuilder: TextMsg.create)
    ..hasRequiredFields = false
  ;

  ChatResp._() : super();
  factory ChatResp({
    HeartbeatResp? heartbeat,
    GetOnlineUsersResp? getOnlineUserResp,
    TextMsg? textMsg,
  }) {
    final _result = create();
    if (heartbeat != null) {
      _result.heartbeat = heartbeat;
    }
    if (getOnlineUserResp != null) {
      _result.getOnlineUserResp = getOnlineUserResp;
    }
    if (textMsg != null) {
      _result.textMsg = textMsg;
    }
    return _result;
  }
  factory ChatResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatResp clone() => ChatResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatResp copyWith(void Function(ChatResp) updates) => super.copyWith((message) => updates(message as ChatResp)) as ChatResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatResp create() => ChatResp._();
  ChatResp createEmptyInstance() => create();
  static $pb.PbList<ChatResp> createRepeated() => $pb.PbList<ChatResp>();
  @$core.pragma('dart2js:noInline')
  static ChatResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatResp>(create);
  static ChatResp? _defaultInstance;

  ChatResp_Resp whichResp() => _ChatResp_RespByTag[$_whichOneof(0)]!;
  void clearResp() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  HeartbeatResp get heartbeat => $_getN(0);
  @$pb.TagNumber(1)
  set heartbeat(HeartbeatResp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeartbeat() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeartbeat() => clearField(1);
  @$pb.TagNumber(1)
  HeartbeatResp ensureHeartbeat() => $_ensure(0);

  @$pb.TagNumber(2)
  GetOnlineUsersResp get getOnlineUserResp => $_getN(1);
  @$pb.TagNumber(2)
  set getOnlineUserResp(GetOnlineUsersResp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGetOnlineUserResp() => $_has(1);
  @$pb.TagNumber(2)
  void clearGetOnlineUserResp() => clearField(2);
  @$pb.TagNumber(2)
  GetOnlineUsersResp ensureGetOnlineUserResp() => $_ensure(1);

  @$pb.TagNumber(3)
  TextMsg get textMsg => $_getN(2);
  @$pb.TagNumber(3)
  set textMsg(TextMsg v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTextMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearTextMsg() => clearField(3);
  @$pb.TagNumber(3)
  TextMsg ensureTextMsg() => $_ensure(2);
}

class HeartbeatResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HeartbeatResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  HeartbeatResp._() : super();
  factory HeartbeatResp() => create();
  factory HeartbeatResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HeartbeatResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HeartbeatResp clone() => HeartbeatResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HeartbeatResp copyWith(void Function(HeartbeatResp) updates) => super.copyWith((message) => updates(message as HeartbeatResp)) as HeartbeatResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeartbeatResp create() => HeartbeatResp._();
  HeartbeatResp createEmptyInstance() => create();
  static $pb.PbList<HeartbeatResp> createRepeated() => $pb.PbList<HeartbeatResp>();
  @$core.pragma('dart2js:noInline')
  static HeartbeatResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HeartbeatResp>(create);
  static HeartbeatResp? _defaultInstance;
}

class GetOnlineUsersResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetOnlineUsersResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.chat.v1'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'onlineUsers', protoName: 'onlineUsers')
    ..hasRequiredFields = false
  ;

  GetOnlineUsersResp._() : super();
  factory GetOnlineUsersResp({
    $core.Iterable<$core.String>? onlineUsers,
  }) {
    final _result = create();
    if (onlineUsers != null) {
      _result.onlineUsers.addAll(onlineUsers);
    }
    return _result;
  }
  factory GetOnlineUsersResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOnlineUsersResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetOnlineUsersResp clone() => GetOnlineUsersResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetOnlineUsersResp copyWith(void Function(GetOnlineUsersResp) updates) => super.copyWith((message) => updates(message as GetOnlineUsersResp)) as GetOnlineUsersResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetOnlineUsersResp create() => GetOnlineUsersResp._();
  GetOnlineUsersResp createEmptyInstance() => create();
  static $pb.PbList<GetOnlineUsersResp> createRepeated() => $pb.PbList<GetOnlineUsersResp>();
  @$core.pragma('dart2js:noInline')
  static GetOnlineUsersResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetOnlineUsersResp>(create);
  static GetOnlineUsersResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get onlineUsers => $_getList(0);
}

