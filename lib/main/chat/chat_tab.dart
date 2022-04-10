import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:xmus_client/generated/chat.pb.dart';

import '../../component/floating_card.dart';
import '../../component/gravatar.dart';
import '../../component/user_profile.dart';
import '../../global.dart';
import '../../util/tab.dart';
import 'p2p_chat_page.dart';

class ChatTab extends StatefulWidget implements TabEntry {
  const ChatTab({Key? key}) : super(key: key);

  @override
  String get path => 'Chat';

  @override
  String get label => 'Chat';

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> with AutomaticKeepAliveClientMixin {
  final sending = StreamController<ChatReq>.broadcast();
  final receiving = StreamController<ChatResp>.broadcast();

  List<String> onlineUsers = [];
  late ResponseStream<ChatResp> responseStream;
  late Timer heartbeatTimer;

  void setupStream() {
    responseStream = rpc.chatClient.stream(sending.stream)
      ..listen(receiving.add, onError: (e) {
        if (e is GrpcError && e.code == 4) {
          log.e('Reconnecting stream...');
          responseStream.cancel();
          heartbeatTimer.cancel();
          setupStream();
        }
      });
    heartbeatTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      sending.add(ChatReq(heartbeat: Heartbeat()));
      sending.add(ChatReq(getOnlineUserReq: GetOnlineUsersReq()));
    });
  }

  Future<void> listenOnlineUsers() async {
    final onlineUsersStream = receiving.stream
        .where((e) => e.whichResp() == ChatResp_Resp.getOnlineUserResp)
        .map((e) => e.getOnlineUserResp);
    await for (final resp in onlineUsersStream) {
      setState(() => onlineUsers = resp.onlineUsers);
    }
  }

  @override
  void initState() {
    // Debug message tracing.
    assert(() {
      sending.stream.listen((e) => log.v('Sending $e'));
      receiving.stream.listen((e) => log.v('Receiving $e'));
      return true;
    }());

    setupStream();
    listenOnlineUsers();

    super.initState();
  }

  @override
  void dispose() {
    sending.close();
    receiving.close();
    responseStream.cancel();
    heartbeatTimer.cancel();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async => sending.add(
        ChatReq(getOnlineUserReq: GetOnlineUsersReq()),
      ),
      child: ListView.builder(
        itemCount: onlineUsers.length,
        itemBuilder: (context, i) {
          final uid = onlineUsers[i];
          return FloatingCard(
            child: UserProfileBuilder(
              uid: uid,
              builder: (context, profile) => Row(
                key: ValueKey(profile),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 8,
                    ),
                    child: Gravatar(
                      url: profile.avatar,
                      fallbackName: profile.displayName,
                      radius: 18,
                    ),
                  ),
                  Text(profile.displayName),
                ],
              ),
              placeholder: (context) => Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    child: Gravatar(radius: 18),
                  ),
                  Text('  ...  '),
                ],
              ),
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => P2PChatPage(
                  uid: uid,
                  sending: sending,
                  receiving: receiving.stream.where((e) =>
                      e.whichResp() == ChatResp_Resp.chatMsg &&
                      e.chatMsg.from == uid),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
