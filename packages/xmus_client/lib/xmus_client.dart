import 'package:grpc/service_api.dart';

import 'authorization.dart';
import 'client_channel.dart' if (dart.library.html) 'client_channel_web.dart';
import 'generated/aaos.pbgrpc.dart';
import 'generated/chat.pbgrpc.dart';
import 'generated/forum_service.pbgrpc.dart';
import 'generated/lost_found.pbgrpc.dart';
import 'generated/user.pbgrpc.dart';

class XMUXRpc {
  final UserClient userClient;
  final AAOSClient aaosClient;
  final LostAndFoundClient lostAndFoundClient;
  final ForumClient forumClient;
  final ChatClient chatClient;

  final Authorization authorization;

  factory XMUXRpc(String address) {
    var clientChannel = createClientChannel(address);
    var authorization = Authorization();

    return XMUXRpc._(
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
      ),
      ChatClient(
        clientChannel,
        options: CallOptions(
          providers: [authorization.provider],
        ),
      ),
    );
  }

  XMUXRpc._(
    this.authorization,
    this.userClient,
    this.aaosClient,
    this.lostAndFoundClient,
    this.forumClient,
    this.chatClient,
  );
}
