import 'package:mobx/mobx.dart';
import 'package:xmus_client/generated/chat.pb.dart';
import 'package:xmus_client/generated/chat_msg.pb.dart';
import 'package:xmus_client/generated/google/protobuf/timestamp.pb.dart';

import '../../global.dart';

class P2PChatSession {
  final String uid;
  final Sink<ChatReq> sendingSink;
  final ObservableList<ChatMsg> messages;

  P2PChatSession({
    required this.uid,
    required this.sendingSink,
    required this.messages,
  });

  void sendText(String msg) {
    sendingSink.add(ChatReq(
      chatMsg: ChatMsg(
        createAt: Timestamp.fromDateTime(DateTime.now()),
        from: store.state.user.campusId,
        to: uid,
        textMsg: msg,
      ),
    ));
  }
}
