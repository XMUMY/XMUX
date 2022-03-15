import 'package:flutter/material.dart';
import 'package:xmus_client/generated/forum_thread.pb.dart';

import '../../util/screen.dart';
import 'thread_card.dart';

class ThreadDetailPage extends StatelessWidget {
  final Thread thread;

  const ThreadDetailPage({Key? key, required this.thread}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(thread.title),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
        children: [
          Hero(
            tag: thread.id,
            child: ThreadCard(
              thread: thread,
              expanded: true,
              exbandable: true,
            ),
          )
        ],
      ),
    );
  }
}
