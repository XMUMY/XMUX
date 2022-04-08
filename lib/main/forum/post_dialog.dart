import 'package:flutter/material.dart';
import 'package:xmus_client/generated/forum_common.pb.dart';
import 'package:xmus_client/generated/forum_post.pb.dart';

import '../../global.dart';
import '../../util/screen.dart';

/// Dialog to create new post.
class NewPostDialog extends StatefulWidget {
  final int threadId;
  final Post? toPost;

  const NewPostDialog({
    Key? key,
    required this.threadId,
    this.toPost,
  }) : super(key: key);

  static Future<bool?> show(
    BuildContext context, {
    required int threadId,
    Post? toPost,
  }) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => NewPostDialog(
        threadId: threadId,
        toPost: toPost,
      ),
      barrierColor: Colors.black26,
    );
  }

  @override
  State<NewPostDialog> createState() => _NewPostDialogState();
}

class _NewPostDialogState extends State<NewPostDialog> {
  final _controller = TextEditingController();
  var _isSubmitting = false;

  Future<void> _handleSubmit() async {
    if (_isSubmitting || _controller.text.isEmpty) return;
    _isSubmitting = true;
    try {
      final toPost = widget.toPost;
      final req = CreatePostReq(
        threadId: widget.threadId,
        plainContent: PlainContent(content: _controller.text),
      );

      if (toPost != null) {
        req.parentId = toPost.parentId == 0
            ? toPost.id // Reply to top level post.
            : toPost.parentId; // Reply to second level post.
      }
      if (toPost != null && toPost.parentId != 0) {
        req.refPostId = toPost.id;
        req.refPostUid = toPost.uid;
      }

      await rpc.forumClient.createPost(req);
      Navigator.of(context).maybePop(true);
    } finally {
      _isSubmitting = false;
    }
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
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(4, 4, 4, 6),
          isDense: true,
          border: InputBorder.none,
          hintText: LocaleKeys.Community_CreatePost.tr(),
        ),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
      ),
    );

    final child = Padding(
      padding: const EdgeInsets.all(8),
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

    final horizontalPadding = context.padBody;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: EdgeInsets.only(
            left: horizontalPadding,
            right: horizontalPadding,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: child,
        ),
      ),
    );
  }
}
