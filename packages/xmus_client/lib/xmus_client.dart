import 'package:grpc/service_api.dart';
import 'package:xmus_client/generated/forum_service.pbgrpc.dart';
import 'package:grpc/grpc.dart' as grpc;

import 'authorization.dart';
import 'client_channel.dart' if (dart.library.html) 'client_channel_web.dart';
import 'generated/aaos.pbgrpc.dart';
import 'generated/lost_found.pbgrpc.dart';
import 'generated/user.pbgrpc.dart';

class XmuxRpc {
  final UserClient userClient;
  final AAOSClient aaosClient;
  final LostAndFoundClient lostAndFoundClient;
  final ForumClient forumClient;

  final Authorization authorization;

  factory XmuxRpc(String address) {
    var clientChannel = createClientChannel(address);
    // TODO: remove this after testing
    var forumTestChannel = grpc.ClientChannel('10.0.2.2',
        port: 9999, options: const grpc.ChannelOptions(credentials: grpc.ChannelCredentials.insecure()));
    var authorization = Authorization();

    return XmuxRpc._(
      authorization,
      UserClient(
        clientChannel,
        options: CallOptions(
          timeout: const Duration(seconds: 30),
          providers: [authorization.provider],
        ),
      ),
      AAOSClient(
        clientChannel,
        options: CallOptions(
          timeout: const Duration(seconds: 30),
          providers: [authorization.provider],
        ),
      ),
      LostAndFoundClient(
        clientChannel,
        options: CallOptions(
          timeout: const Duration(seconds: 30),
          providers: [authorization.provider],
        ),
      ),
      ForumClient(
        clientChannel,
        options: CallOptions(
          timeout: const Duration(seconds: 30),
          providers: [authorization.provider],
        ),
      ));
  }

  XmuxRpc._(
    this.authorization,
    this.userClient,
    this.aaosClient,
    this.lostAndFoundClient,
    this.forumClient,
  );
}
