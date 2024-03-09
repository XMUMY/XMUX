import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:xmus_client/api/chat.pb.dart';

import '../../../global.dart';
import 'grpc_client.dart';

/// Client is used to setup and keep a stable connection between server.
abstract class ChatClient {
  final sending = StreamController<ChatReq>.broadcast();
  final receiving = StreamController<ChatResp>.broadcast();

  ChatClient() {
    // Debug message tracing.
    assert(() {
      sending.stream.listen((e) => log.v('ChatClient Sending $e'));
      receiving.stream.listen((e) => log.v('ChatClient Receiving $e'));
      return true;
    }());
  }

  factory ChatClient.adaptive() {
    return GrpcClient();
  }

  @mustCallSuper
  void dispose() {
    sending.close();
    receiving.close();
  }

  /// Setup the stream connection to server.
  void setupStream();

  /// Dispose the stream connection.
  void disposeStream();
}
