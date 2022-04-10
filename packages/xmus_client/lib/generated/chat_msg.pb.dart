///
//  Generated code. Do not modify.
//  source: chat/v1/chat_msg.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $1;

enum ChatMsg_Msg {
  textMsg, 
  notSet
}

class ChatMsg extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ChatMsg_Msg> _ChatMsg_MsgByTag = {
    31 : ChatMsg_Msg.textMsg,
    0 : ChatMsg_Msg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChatMsg', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.chat.v1'), createEmptyInstance: create)
    ..oo(0, [31])
    ..aOM<$1.Timestamp>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createAt', protoName: 'createAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'processAt', protoName: 'processAt', subBuilder: $1.Timestamp.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'from')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'to')
    ..aOS(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'textMsg', protoName: 'textMsg')
    ..hasRequiredFields = false
  ;

  ChatMsg._() : super();
  factory ChatMsg({
    $1.Timestamp? createAt,
    $1.Timestamp? processAt,
    $core.String? from,
    $core.String? to,
    $core.String? textMsg,
  }) {
    final _result = create();
    if (createAt != null) {
      _result.createAt = createAt;
    }
    if (processAt != null) {
      _result.processAt = processAt;
    }
    if (from != null) {
      _result.from = from;
    }
    if (to != null) {
      _result.to = to;
    }
    if (textMsg != null) {
      _result.textMsg = textMsg;
    }
    return _result;
  }
  factory ChatMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatMsg clone() => ChatMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatMsg copyWith(void Function(ChatMsg) updates) => super.copyWith((message) => updates(message as ChatMsg)) as ChatMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatMsg create() => ChatMsg._();
  ChatMsg createEmptyInstance() => create();
  static $pb.PbList<ChatMsg> createRepeated() => $pb.PbList<ChatMsg>();
  @$core.pragma('dart2js:noInline')
  static ChatMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatMsg>(create);
  static ChatMsg? _defaultInstance;

  ChatMsg_Msg whichMsg() => _ChatMsg_MsgByTag[$_whichOneof(0)]!;
  void clearMsg() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Timestamp get createAt => $_getN(0);
  @$pb.TagNumber(1)
  set createAt($1.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreateAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreateAt() => clearField(1);
  @$pb.TagNumber(1)
  $1.Timestamp ensureCreateAt() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Timestamp get processAt => $_getN(1);
  @$pb.TagNumber(2)
  set processAt($1.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProcessAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearProcessAt() => clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureProcessAt() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get from => $_getSZ(2);
  @$pb.TagNumber(3)
  set from($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrom() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get to => $_getSZ(3);
  @$pb.TagNumber(4)
  set to($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTo() => $_has(3);
  @$pb.TagNumber(4)
  void clearTo() => clearField(4);

  @$pb.TagNumber(31)
  $core.String get textMsg => $_getSZ(4);
  @$pb.TagNumber(31)
  set textMsg($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(31)
  $core.bool hasTextMsg() => $_has(4);
  @$pb.TagNumber(31)
  void clearTextMsg() => clearField(31);
}

