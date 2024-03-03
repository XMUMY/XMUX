import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:xmus_client/api/chat_msg.pb.dart';

import '../../component/gravatar.dart';
import '../../component/user_profile.dart';
import '../../global.dart';
import '../../util/screen.dart';
import 'manager.dart';
import 'p2p_chat_session.dart';

class P2PChatPage extends StatefulWidget {
  final String uid;

  const P2PChatPage({
    super.key,
    required this.uid,
  });

  @override
  State<P2PChatPage> createState() => _P2PChatPageState();
}

class _P2PChatPageState extends State<P2PChatPage> {
  final _controller = TextEditingController();
  final _listKey = GlobalKey<AnimatedListState>();
  late final Dispose _dispose;
  late final P2PChatSession session;

  void send() {
    if (_controller.text.isEmpty) return;
    session.sendText(_controller.text);
    _controller.clear();
  }

  @override
  void initState() {
    session = ChatManager().createP2PSession(widget.uid);
    _dispose = session.messages.observe((change) {
      _listKey.currentState?.insertItem(0);
    });
    super.initState();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  Widget _buildMsgCard(ChatMsg msg) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (msg.from != store.state.user.campusId)
            UserProfileBuilder(
              uid: msg.from,
              builder: (context, profile) => Gravatar(
                url: profile.avatar,
                fallbackName: profile.displayName,
                radius: 16,
              ),
              placeholder: (context) => const Gravatar(radius: 16),
            ),
          Expanded(
            child: BubbleNormal(
              text: msg.textMsg,
              isSender: msg.from == store.state.user.campusId,
            ),
          ),
          if (msg.from == store.state.user.campusId)
            UserProfileBuilder(
              uid: msg.from,
              builder: (context, profile) => Gravatar(
                url: profile.avatar,
                fallbackName: profile.displayName,
                radius: 16,
              ),
              placeholder: (context) => const Gravatar(radius: 16),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final inputField = Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Theme.of(context).canvasColor,
      ),
      child: TextField(
        autofocus: true,
        controller: _controller,
        maxLines: 2,
        minLines: 1,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(4, 4, 4, 6),
          isDense: true,
          border: InputBorder.none,
        ),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
      ),
    );

    final horizontalPadding = context.padBody;
    return Scaffold(
      appBar: AppBar(
        title: UserProfileBuilder(
          uid: widget.uid,
          builder: (_, profile) => Text(profile.displayName),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: AnimatedList(
            key: _listKey,
            reverse: true,
            padding: context.padListView,
            initialItemCount: session.messages.length,
            itemBuilder: (context, index, animation) {
              final msgs = session.messages;
              final msg = msgs[msgs.length - 1 - index];
              return FadeTransition(
                opacity: animation,
                child: _buildMsgCard(msg),
              );
            },
          ),
        ),
        Material(
          color: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              8,
              horizontalPadding,
              8,
            ),
            child: Row(
              children: [
                Expanded(child: inputField),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: send,
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
