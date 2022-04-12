import 'dart:async';

import 'package:xmus_client/generated/chat.pb.dart';

import 'client.dart';

class ChatManager {
  static ChatManager? _instance;

  /// The underlying client that holds the connection between server.
  final _client = ChatClient.adaptive();

  /// The countdown timer to offline client.
  Timer? _offlineCountdown;

  /// Whether the client is online.
  ///
  /// The online status is determined by heartbeat message from server.
  bool get isOnline => _offlineCountdown?.isActive ?? false;

  /// Stream to notify when online status changed.
  Stream<bool> get onlineStatusChanged => _onlineStatus.stream;
  final _onlineStatus = StreamController<bool>.broadcast();

  factory ChatManager() {
    _instance ??= ChatManager._().._client.setupStream();
    return _instance!;
  }

  ChatManager._() {
    // Initial value for online status stream.
    _onlineStatus.onListen = () {
      _onlineStatus.add(isOnline);
    };

    // Reset offline countdown.
    _client.receiving.stream
        .where((e) => e.whichResp() == ChatResp_Resp.heartbeat)
        .listen((e) {
      _onlineStatus.add(true);
      _offlineCountdown?.cancel();
      _offlineCountdown = Timer(const Duration(seconds: 90), () {
        _onlineStatus.add(false);
      });
    });
  }

  Future<GetOnlineUsersResp> getOnlineUsers() async {
    final future = _client.receiving.stream
        .firstWhere((e) => e.whichResp() == ChatResp_Resp.getOnlineUserResp);
    _client.sending.add(ChatReq(getOnlineUserReq: GetOnlineUsersReq()));
    return (await future).getOnlineUserResp;
  }
}
