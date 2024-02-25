import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:timeago/timeago.dart';

import '../../component/gravatar.dart';
import '../../component/user_profile.dart';
import '../../util/tab.dart';
import 'manager.dart';
import 'p2p_chat_page.dart';

class ChatTab extends StatefulWidget implements TabEntry {
  const ChatTab({super.key});

  @override
  String get path => 'Chat';

  @override
  String get label => 'Chat';

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> with AutomaticKeepAliveClientMixin {
  final chatManager = ChatManager();

  void _openP2PSessionWith(String uid) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => P2PChatPage(uid: uid),
    ));
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final lang = Localizations.localeOf(context).languageCode;

    return Observer(builder: (context) {
      final entries = chatManager.latestMessage.entries.toList()
        ..sort(
          (a, b) =>
              a.value.createAt.seconds.compareTo(b.value.createAt.seconds),
        );
      return ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, i) {
          final entry = entries[i];
          return UserProfileBuilder(
            uid: entry.key,
            builder: (context, profile) => ListTile(
              leading: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                child: Gravatar(
                  url: profile.avatar,
                  fallbackName: profile.displayName,
                  radius: 18,
                ),
              ),
              title: Row(children: [
                Text(profile.displayName),
                Expanded(
                  child: Text(
                    format(
                      entry.value.createAt.toDateTime(),
                      locale: lang,
                      allowFromNow: true,
                    ),
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                )
              ]),
              subtitle: Text(
                entry.value.textMsg,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => _openP2PSessionWith(entry.key),
            ),
            placeholder: (context) => ListTile(
              title: Row(children: [
                const Text('  ...  '),
                Expanded(
                  child: Text(
                    format(
                      entry.value.createAt.toDateTime(),
                      locale: lang,
                      allowFromNow: true,
                    ),
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                )
              ]),
              subtitle: Text(
                entry.value.textMsg,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => _openP2PSessionWith(entry.key),
            ),
          );
        },
      );
    });
  }
}
