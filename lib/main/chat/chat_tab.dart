import 'dart:async';

import 'package:flutter/material.dart';

import '../../component/floating_card.dart';
import '../../component/gravatar.dart';
import '../../component/user_profile.dart';
import '../../util/screen.dart';
import '../../util/tab.dart';
import 'manager.dart';

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
  final chatManager = ChatManager();
  var onlineUsers = <String>[];

  Future<void> _refresh() async {
    await chatManager.onlineStatusChanged.firstWhere((e) => e);
    final resp = await chatManager.getOnlineUsers();
    if (mounted) setState(() => onlineUsers = resp.onlineUsers);
  }

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        padding: context.padListView,
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
            onTap: () {},
          );
        },
      ),
    );
  }
}
