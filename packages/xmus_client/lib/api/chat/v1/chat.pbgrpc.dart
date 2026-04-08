// This is a generated file - do not edit.
//
// Generated from chat/v1/chat.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chat.pb.dart' as $0;

export 'chat.pb.dart';

@$pb.GrpcServiceName('xmux.chat.v1.Chat')
class ChatClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ChatClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseStream<$0.ChatResp> stream(
    $async.Stream<$0.ChatReq> request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(_$stream, request, options: options);
  }

  // method descriptors

  static final _$stream = $grpc.ClientMethod<$0.ChatReq, $0.ChatResp>(
      '/xmux.chat.v1.Chat/Stream',
      ($0.ChatReq value) => value.writeToBuffer(),
      $0.ChatResp.fromBuffer);
}

@$pb.GrpcServiceName('xmux.chat.v1.Chat')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'xmux.chat.v1.Chat';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ChatReq, $0.ChatResp>(
        'Stream',
        stream,
        true,
        true,
        ($core.List<$core.int> value) => $0.ChatReq.fromBuffer(value),
        ($0.ChatResp value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ChatResp> stream(
      $grpc.ServiceCall call, $async.Stream<$0.ChatReq> request);
}
