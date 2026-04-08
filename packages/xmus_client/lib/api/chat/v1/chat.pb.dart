// This is a generated file - do not edit.
//
// Generated from chat/v1/chat.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'chat_msg.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

enum ChatReq_Req { heartbeat, getOnlineUserReq, chatMsg, notSet }

class ChatReq extends $pb.GeneratedMessage {
  factory ChatReq({
    Heartbeat? heartbeat,
    GetOnlineUsersReq? getOnlineUserReq,
    $1.ChatMsg? chatMsg,
  }) {
    final result = create();
    if (heartbeat != null) result.heartbeat = heartbeat;
    if (getOnlineUserReq != null) result.getOnlineUserReq = getOnlineUserReq;
    if (chatMsg != null) result.chatMsg = chatMsg;
    return result;
  }

  ChatReq._();

  factory ChatReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static const $core.Map<$core.int, ChatReq_Req> _ChatReq_ReqByTag = {
    1: ChatReq_Req.heartbeat,
    2: ChatReq_Req.getOnlineUserReq,
    3: ChatReq_Req.chatMsg,
    0: ChatReq_Req.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.chat.v1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<Heartbeat>(1, _omitFieldNames ? '' : 'heartbeat',
        subBuilder: Heartbeat.create)
    ..aOM<GetOnlineUsersReq>(2, _omitFieldNames ? '' : 'getOnlineUserReq',
        protoName: 'getOnlineUserReq', subBuilder: GetOnlineUsersReq.create)
    ..aOM<$1.ChatMsg>(3, _omitFieldNames ? '' : 'chatMsg',
        protoName: 'chatMsg', subBuilder: $1.ChatMsg.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatReq copyWith(void Function(ChatReq) updates) =>
      super.copyWith((message) => updates(message as ChatReq)) as ChatReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatReq create() => ChatReq._();
  @$core.override
  ChatReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatReq>(create);
  static ChatReq? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  ChatReq_Req whichReq() => _ChatReq_ReqByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearReq() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Heartbeat get heartbeat => $_getN(0);
  @$pb.TagNumber(1)
  set heartbeat(Heartbeat value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasHeartbeat() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeartbeat() => $_clearField(1);
  @$pb.TagNumber(1)
  Heartbeat ensureHeartbeat() => $_ensure(0);

  @$pb.TagNumber(2)
  GetOnlineUsersReq get getOnlineUserReq => $_getN(1);
  @$pb.TagNumber(2)
  set getOnlineUserReq(GetOnlineUsersReq value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasGetOnlineUserReq() => $_has(1);
  @$pb.TagNumber(2)
  void clearGetOnlineUserReq() => $_clearField(2);
  @$pb.TagNumber(2)
  GetOnlineUsersReq ensureGetOnlineUserReq() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.ChatMsg get chatMsg => $_getN(2);
  @$pb.TagNumber(3)
  set chatMsg($1.ChatMsg value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasChatMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatMsg() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.ChatMsg ensureChatMsg() => $_ensure(2);
}

class Heartbeat extends $pb.GeneratedMessage {
  factory Heartbeat() => create();

  Heartbeat._();

  factory Heartbeat.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Heartbeat.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Heartbeat',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.chat.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Heartbeat clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Heartbeat copyWith(void Function(Heartbeat) updates) =>
      super.copyWith((message) => updates(message as Heartbeat)) as Heartbeat;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Heartbeat create() => Heartbeat._();
  @$core.override
  Heartbeat createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Heartbeat getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Heartbeat>(create);
  static Heartbeat? _defaultInstance;
}

class GetOnlineUsersReq extends $pb.GeneratedMessage {
  factory GetOnlineUsersReq({
    $core.Iterable<$core.String>? uids,
  }) {
    final result = create();
    if (uids != null) result.uids.addAll(uids);
    return result;
  }

  GetOnlineUsersReq._();

  factory GetOnlineUsersReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetOnlineUsersReq.fromJson(
          $core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetOnlineUsersReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.chat.v1'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'uids')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOnlineUsersReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOnlineUsersReq copyWith(void Function(GetOnlineUsersReq) updates) =>
      super.copyWith((message) => updates(message as GetOnlineUsersReq))
          as GetOnlineUsersReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOnlineUsersReq create() => GetOnlineUsersReq._();
  @$core.override
  GetOnlineUsersReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetOnlineUsersReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetOnlineUsersReq>(create);
  static GetOnlineUsersReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get uids => $_getList(0);
}

enum ChatResp_Resp { heartbeat, getOnlineUserResp, chatMsg, notSet }

class ChatResp extends $pb.GeneratedMessage {
  factory ChatResp({
    HeartbeatResp? heartbeat,
    GetOnlineUsersResp? getOnlineUserResp,
    $1.ChatMsg? chatMsg,
  }) {
    final result = create();
    if (heartbeat != null) result.heartbeat = heartbeat;
    if (getOnlineUserResp != null) result.getOnlineUserResp = getOnlineUserResp;
    if (chatMsg != null) result.chatMsg = chatMsg;
    return result;
  }

  ChatResp._();

  factory ChatResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatResp.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static const $core.Map<$core.int, ChatResp_Resp> _ChatResp_RespByTag = {
    1: ChatResp_Resp.heartbeat,
    2: ChatResp_Resp.getOnlineUserResp,
    3: ChatResp_Resp.chatMsg,
    0: ChatResp_Resp.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.chat.v1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<HeartbeatResp>(1, _omitFieldNames ? '' : 'heartbeat',
        subBuilder: HeartbeatResp.create)
    ..aOM<GetOnlineUsersResp>(2, _omitFieldNames ? '' : 'getOnlineUserResp',
        protoName: 'getOnlineUserResp', subBuilder: GetOnlineUsersResp.create)
    ..aOM<$1.ChatMsg>(3, _omitFieldNames ? '' : 'chatMsg',
        protoName: 'chatMsg', subBuilder: $1.ChatMsg.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatResp copyWith(void Function(ChatResp) updates) =>
      super.copyWith((message) => updates(message as ChatResp)) as ChatResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatResp create() => ChatResp._();
  @$core.override
  ChatResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatResp>(create);
  static ChatResp? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  ChatResp_Resp whichResp() => _ChatResp_RespByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearResp() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  HeartbeatResp get heartbeat => $_getN(0);
  @$pb.TagNumber(1)
  set heartbeat(HeartbeatResp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasHeartbeat() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeartbeat() => $_clearField(1);
  @$pb.TagNumber(1)
  HeartbeatResp ensureHeartbeat() => $_ensure(0);

  @$pb.TagNumber(2)
  GetOnlineUsersResp get getOnlineUserResp => $_getN(1);
  @$pb.TagNumber(2)
  set getOnlineUserResp(GetOnlineUsersResp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasGetOnlineUserResp() => $_has(1);
  @$pb.TagNumber(2)
  void clearGetOnlineUserResp() => $_clearField(2);
  @$pb.TagNumber(2)
  GetOnlineUsersResp ensureGetOnlineUserResp() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.ChatMsg get chatMsg => $_getN(2);
  @$pb.TagNumber(3)
  set chatMsg($1.ChatMsg value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasChatMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatMsg() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.ChatMsg ensureChatMsg() => $_ensure(2);
}

class HeartbeatResp extends $pb.GeneratedMessage {
  factory HeartbeatResp() => create();

  HeartbeatResp._();

  factory HeartbeatResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartbeatResp.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartbeatResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.chat.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartbeatResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartbeatResp copyWith(void Function(HeartbeatResp) updates) =>
      super.copyWith((message) => updates(message as HeartbeatResp))
          as HeartbeatResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartbeatResp create() => HeartbeatResp._();
  @$core.override
  HeartbeatResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartbeatResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartbeatResp>(create);
  static HeartbeatResp? _defaultInstance;
}

class GetOnlineUsersResp extends $pb.GeneratedMessage {
  factory GetOnlineUsersResp({
    $core.Iterable<$core.String>? onlineUsers,
    $core.Iterable<$core.String>? offlineUsers,
  }) {
    final result = create();
    if (onlineUsers != null) result.onlineUsers.addAll(onlineUsers);
    if (offlineUsers != null) result.offlineUsers.addAll(offlineUsers);
    return result;
  }

  GetOnlineUsersResp._();

  factory GetOnlineUsersResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetOnlineUsersResp.fromJson(
          $core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetOnlineUsersResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.chat.v1'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'onlineUsers', protoName: 'onlineUsers')
    ..pPS(2, _omitFieldNames ? '' : 'offlineUsers', protoName: 'offlineUsers')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOnlineUsersResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOnlineUsersResp copyWith(void Function(GetOnlineUsersResp) updates) =>
      super.copyWith((message) => updates(message as GetOnlineUsersResp))
          as GetOnlineUsersResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOnlineUsersResp create() => GetOnlineUsersResp._();
  @$core.override
  GetOnlineUsersResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetOnlineUsersResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetOnlineUsersResp>(create);
  static GetOnlineUsersResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get onlineUsers => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get offlineUsers => $_getList(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
