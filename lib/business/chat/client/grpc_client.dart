import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:xmus_client/api/chat.pb.dart';

import '../../../foundation/logging/logging.dart';
import '../../../global.dart';
import 'client.dart';

class GrpcClient extends ChatClient {
  late ResponseStream<ChatResp> responseStream;
  late Timer heartbeatTimer;

  @override
  void setupStream() {
    log.t('GrpcClient.setupStream()');
    responseStream = rpc.chatClient.stream(sending.stream)
      ..listen(
        receiving.add,
        onDone: () async {
          disposeStream();
          await Future.delayed(const Duration(seconds: 10));
          setupStream();
        },
      );
    heartbeatTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      sending.add(ChatReq(heartbeat: Heartbeat()));
    });
  }

  @override
  void disposeStream() {
    log.t('GrpcClient.disposeStream()');
    responseStream.cancel();
    heartbeatTimer.cancel();
  }
}
