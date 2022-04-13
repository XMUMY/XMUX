import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView();
  }
}
