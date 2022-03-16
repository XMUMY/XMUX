import 'package:flutter/material.dart';
import 'package:xmus_client/generated/forum_post.pb.dart';
import 'package:xmus_client/generated/forum_thread.pb.dart';

import '../../global.dart';
import '../../util/screen.dart';

class NewPostDialog extends StatefulWidget {
  final Thread thread;

  const NewPostDialog({
    Key? key,
    required this.thread,
  }) : super(key: key);

  static Future<bool?> show(
    BuildContext context, {
    required Thread thread,
  }) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => NewPostDialog(thread: thread),
      barrierColor: Colors.black26,
    );
  }

  @override
  State<NewPostDialog> createState() => _NewPostDialogState();
}

class _NewPostDialogState extends State<NewPostDialog> {
  final _controller = TextEditingController();
  bool _isSubmitting = false;

  Future<void> _handleSubmit() async {
    if (_isSubmitting || _controller.text.isEmpty) return;
    _isSubmitting = true;
    try {
      await rpc.forumClient.createPost(CreatePostReq(
        threadId: widget.thread.id,
        content: _controller.text,
      ));
      Navigator.of(context).maybePop(true);
    } finally {
      _isSubmitting = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputField = Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Theme.of(context).canvasColor,
      ),
      child: TextField(
        autofocus: true,
        controller: _controller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 4),
          isDense: true,
          border: InputBorder.none,
          hintText: 'Post a comment',
        ),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
      ),
    );

    final child = Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: inputField),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _handleSubmit,
          )
        ],
      ),
    );

    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    if (bottomPadding != 0) {
      // Keyboard is not visible
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: context.padBody),
        child: child,
      );
    }

    final horizontalPadding = context.padBody;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: EdgeInsets.only(
            left: horizontalPadding,
            right: horizontalPadding,
            bottom: bottomPadding,
          ),
          child: child,
        ),
      ),
    );
  }
}
