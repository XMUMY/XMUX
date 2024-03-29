import 'dart:async';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;

import '../../component/gravatar.dart';
import '../../component/tab.dart';
import '../../component/user_profile.dart';
import 'manager.dart';
import 'p2p_chat_page.dart';

class OnlineTab extends StatefulWidget implements TabEntry {
  const OnlineTab({super.key});

  @override
  String get path => 'Online';

  @override
  String get label => 'Online';

  @override
  State<OnlineTab> createState() => _OnlineTabState();
}

class _OnlineTabState extends State<OnlineTab>
    with AutomaticKeepAliveClientMixin {
  final chatManager = ChatManager();
  var onlineUsers = <String>[];

  Future<void> _refresh() async {
    await chatManager.onlineStatusChanged.firstWhere((e) => e);
    final resp = await chatManager.getOnlineUsers();
    if (mounted) setState(() => onlineUsers = resp.onlineUsers);
  }

  void _openP2PSessionWith(String uid) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => P2PChatPage(uid: uid),
    ));
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
        itemCount: onlineUsers.length,
        itemBuilder: (context, i) {
          final uid = onlineUsers[i];
          return UserProfileBuilder(
            uid: uid,
            builder: (context, profile) => ListTile(
              leading: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                child: Badge(
                  position: BadgePosition.bottomEnd(bottom: 0, end: 0),
                  badgeStyle: const BadgeStyle(
                    badgeColor: Colors.greenAccent,
                  ),
                  child: Gravatar(
                    url: profile.avatar,
                    fallbackName: profile.displayName,
                    radius: 18,
                  ),
                ),
              ),
              title: Text(profile.displayName),
              onTap: () => _openP2PSessionWith(uid),
            ),
            placeholder: (context) => ListTile(
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Badge(
                  position: BadgePosition.center(),
                  badgeStyle: const BadgeStyle(
                    badgeColor: Colors.greenAccent,
                  ),
                ),
              ),
              title: const Text('  ...  '),
              onTap: () => _openP2PSessionWith(uid),
            ),
          );
        },
      ),
    );
  }
}
