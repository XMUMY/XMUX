// This is a generated file - do not edit.
//
// Generated from chat/v1/chat_msg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

enum ChatMsg_Msg { textMsg, notSet }

class ChatMsg extends $pb.GeneratedMessage {
  factory ChatMsg({
    $0.Timestamp? createAt,
    $0.Timestamp? processAt,
    $core.String? from,
    $core.String? to,
    $core.String? textMsg,
  }) {
    final result = create();
    if (createAt != null) result.createAt = createAt;
    if (processAt != null) result.processAt = processAt;
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (textMsg != null) result.textMsg = textMsg;
    return result;
  }

  ChatMsg._();

  factory ChatMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatMsg.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static const $core.Map<$core.int, ChatMsg_Msg> _ChatMsg_MsgByTag = {
    31: ChatMsg_Msg.textMsg,
    0: ChatMsg_Msg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.chat.v1'),
      createEmptyInstance: create)
    ..oo(0, [31])
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'createAt',
        protoName: 'createAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'processAt',
        protoName: 'processAt', subBuilder: $0.Timestamp.create)
    ..aOS(3, _omitFieldNames ? '' : 'from')
    ..aOS(4, _omitFieldNames ? '' : 'to')
    ..aOS(31, _omitFieldNames ? '' : 'textMsg', protoName: 'textMsg')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatMsg copyWith(void Function(ChatMsg) updates) =>
      super.copyWith((message) => updates(message as ChatMsg)) as ChatMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatMsg create() => ChatMsg._();
  @$core.override
  ChatMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatMsg getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatMsg>(create);
  static ChatMsg? _defaultInstance;

  @$pb.TagNumber(31)
  ChatMsg_Msg whichMsg() => _ChatMsg_MsgByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(31)
  void clearMsg() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $0.Timestamp get createAt => $_getN(0);
  @$pb.TagNumber(1)
  set createAt($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCreateAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreateAt() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureCreateAt() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Timestamp get processAt => $_getN(1);
  @$pb.TagNumber(2)
  set processAt($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProcessAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearProcessAt() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureProcessAt() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get from => $_getSZ(2);
  @$pb.TagNumber(3)
  set from($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrom() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get to => $_getSZ(3);
  @$pb.TagNumber(4)
  set to($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTo() => $_has(3);
  @$pb.TagNumber(4)
  void clearTo() => $_clearField(4);

  @$pb.TagNumber(31)
  $core.String get textMsg => $_getSZ(4);
  @$pb.TagNumber(31)
  set textMsg($core.String value) => $_setString(4, value);
  @$pb.TagNumber(31)
  $core.bool hasTextMsg() => $_has(4);
  @$pb.TagNumber(31)
  void clearTextMsg() => $_clearField(31);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
