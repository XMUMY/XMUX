import 'package:grpc/grpc.dart';

import 'authorization.dart';
import 'clients/aaos.pbgrpc.dart';
import 'clients/user.pbgrpc.dart';

class XmuxRpc {
  final UserClient userClient;
  final AAOSClient aaosClient;

  final Authorization authorization;

  factory XmuxRpc(String host) {
    var clientChannel = ClientChannel(host);
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
    );
  }

  XmuxRpc._(
    this.authorization,
    this.userClient,
    this.aaosClient,
  );
}
