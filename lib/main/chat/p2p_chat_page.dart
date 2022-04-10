import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xmus_client/generated/chat.pb.dart';
import 'package:xmus_client/generated/chat_msg.pb.dart';

import '../../component/floating_card.dart';
import '../../component/gravatar.dart';
import '../../component/user_profile.dart';
import '../../util/screen.dart';

class P2PChatPage extends StatefulWidget {
  final String uid;
  final StreamController<ChatReq> sending;
  final Stream<ChatResp> receiving;

  const P2PChatPage({
    Key? key,
    required this.uid,
    required this.sending,
    required this.receiving,
  }) : super(key: key);

  @override
  State<P2PChatPage> createState() => _P2PChatPageState();
}

class _P2PChatPageState extends State<P2PChatPage> {
  final _controller = TextEditingController();
  final _list = <ChatMsg>[];
  final _listKey = GlobalKey<AnimatedListState>();
  late final StreamSubscription<ChatResp> _receivingSubscription;

  void send() {}

  void onReceive(ChatResp resp) {}

  @override
  void initState() {
    _receivingSubscription = widget.receiving.listen(onReceive);
    super.initState();
  }

  @override
  void dispose() {
    _receivingSubscription.cancel();
    super.dispose();
  }

  Widget _buildMsgCard(ChatMsg msg) {
    return FloatingCard(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserProfileBuilder(
            uid: msg.from,
            builder: (context, profile) => Gravatar(
              url: profile.avatar,
              fallbackName: profile.displayName,
              radius: 18,
            ),
            placeholder: (context) => const Gravatar(radius: 18),
          ),
          const VerticalDivider(color: Colors.transparent),
          Text(msg.textMsg),
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

    return Scaffold(
      appBar: AppBar(
        title: UserProfileBuilder(
          uid: widget.uid,
          builder: (_, profile) => Text(profile.displayName),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              key: _listKey,
              reverse: true,
              padding: context.padListView,
              itemBuilder: (context, index, animation) {
                final msg = _list[_list.length - 1 - index];
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
              padding: const EdgeInsets.all(8),
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
        ],
      ),
    );
  }
}
