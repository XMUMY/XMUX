import 'package:grpc/service_api.dart';

import 'authorization.dart';
import 'client_channel.dart' if (dart.library.html) 'client_channel_web.dart';
import 'clients/aaos.pbgrpc.dart';
import 'clients/lost_found.pbgrpc.dart';
import 'clients/news.pbgrpc.dart';
import 'clients/user.pbgrpc.dart';

class XmuxRpc {
  final UserClient userClient;
  final AAOSClient aaosClient;
  final NewsClient newsClient;

  final LostAndFoundClient lostAndFoundClient;

  final Authorization authorization;

  factory XmuxRpc(String address) {
    var clientChannel = createClientChannel(address);
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
      NewsClient(
        clientChannel,
        options: CallOptions(
          timeout: const Duration(seconds: 30),
        ),
      ),
      LostAndFoundClient(
        clientChannel,
        options: CallOptions(
          timeout: const Duration(seconds: 30),
          providers: [authorization.provider],
        ),
      ),
    );
  }

  XmuxRpc._(
    this.authorization,
    this.userClient,
    this.aaosClient,
    this.newsClient,
    this.lostAndFoundClient,
  );
}
