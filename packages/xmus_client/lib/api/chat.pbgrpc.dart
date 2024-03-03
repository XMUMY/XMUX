///
//  Generated code. Do not modify.
//  source: chat/v1/chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chat.pb.dart' as $0;
export 'chat.pb.dart';

class ChatClient extends $grpc.Client {
  static final _$stream = $grpc.ClientMethod<$0.ChatReq, $0.ChatResp>(
      '/xmux.chat.v1.Chat/Stream',
      ($0.ChatReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatResp.fromBuffer(value));

  ChatClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.ChatResp> stream($async.Stream<$0.ChatReq> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$stream, request, options: options);
  }
}

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
