import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:xmus_client/api/chat.pb.dart';
import 'package:xmus_client/api/chat_msg.pb.dart';

import 'client/client.dart';
import 'p2p_chat_session.dart';

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

  /// Internal storage for messages.
  ///
  /// TODO: persistent storage.
  final _messages = <String, ObservableList<ChatMsg>>{};

  /// The latest message for each session.
  final latestMessage = ObservableMap<String, ChatMsg>();

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

    _client.sending.stream
        .where((e) => e.whichReq() == ChatReq_Req.chatMsg)
        .listen((e) => _processOutgoingMsg(e.chatMsg));
    _client.receiving.stream
        .where((e) => e.whichResp() == ChatResp_Resp.chatMsg)
        .listen((e) => _processIncomingMsg(e.chatMsg));
  }

  void _processOutgoingMsg(ChatMsg msg) {
    _messages[msg.to] ??= ObservableList();
    _messages[msg.to]?.add(msg);
    latestMessage[msg.to] = msg;
  }

  void _processIncomingMsg(ChatMsg msg) {
    _messages[msg.from] ??= ObservableList();
    _messages[msg.from]?.add(msg);
    latestMessage[msg.from] = msg;
  }

  Future<GetOnlineUsersResp> getOnlineUsers() async {
    final future = _client.receiving.stream
        .firstWhere((e) => e.whichResp() == ChatResp_Resp.getOnlineUserResp);
    _client.sending.add(ChatReq(getOnlineUserReq: GetOnlineUsersReq()));
    return (await future).getOnlineUserResp;
  }

  P2PChatSession createP2PSession(String uid) {
    _messages[uid] ??= ObservableList();
    return P2PChatSession(
      uid: uid,
      sendingSink: _client.sending,
      messages: _messages[uid]!,
    );
  }
}
