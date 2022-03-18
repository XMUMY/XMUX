import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeago/timeago.dart';
import 'package:xmus_client/generated/forum_post.pb.dart';
import 'package:xmus_client/generated/forum_saved.pb.dart';
import 'package:xmus_client/generated/forum_thread.pb.dart';

import '../../../component/user_profile.dart';
import '../../component/like_icon.dart';
import '../../global.dart';
import 'post_dialog.dart';
import 'post_list.dart';

class PostCard extends StatefulWidget {
  final Thread thread;
  final Post post;
  final List<Post> children;
  final VoidCallback? onPostComment;

  const PostCard({
    Key? key,
    required this.thread,
    required this.post,
    this.children = const [],
    this.onPostComment,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  Future<void> _like() async {
    final liked = widget.post.liked > 0 ? 0 : 1;
    widget.post.likes += liked > 0 ? 1 : -1;
    setState(() => widget.post.liked = liked);
    rpc.forumClient.likePost(LikePostReq(
      postId: widget.post.id,
      like: liked,
    ));
  }

  Future<void> _comment() async {
    final r = await NewPostDialog.show(
      context,
      thread: widget.thread,
      toPost: widget.post,
    );
    if (r == true) widget.onPostComment?.call();
  }

  Future<void> _save() async {
    final post = widget.post;
    if (post.saved) {
      rpc.forumClient.unsavePost(UnsavePostReq(
        postId: post.id,
      ));
    } else {
      rpc.forumClient.savePost(SavePostReq(
        postId: post.id,
      ));
    }
    setState(() => post.saved = !post.saved);
  }

  Future<void> _remove() async {
    await rpc.forumClient.removePost(RemovePostReq(
      postId: widget.post.id,
    ));
    widget.onPostComment?.call();
  }

  Future<void> _showChildren() async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.73,
        builder: (context, controller) => PostList(
          thread: widget.thread,
          parentPost: widget.post,
          scrollController: controller,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    final lang = Localizations.localeOf(context).languageCode;
    final ts = format(
      post.createAt.toDateTime(),
      locale: lang,
      allowFromNow: true,
    );

    final header = Row(children: [
      Expanded(
        child: UserProfileBuilder(
          uid: post.uid,
          builder: (context, profile) => Row(
            key: ValueKey(profile),
            children: <Widget>[
              // Build user avatar.
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: CircleAvatar(
                  child: ExtendedImage.network(
                    profile.avatar,
                    shape: BoxShape.circle,
                  ),
                  radius: 18,
                ),
              ),

              // Build user name and timestamp.
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profile.displayName),
                  Text(ts, style: Theme.of(context).textTheme.caption)
                ],
              ),
            ],
          ),
          placeholder: (context) => Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: CircleAvatar(
                  child: ExtendedImage.network(
                    remoteConfigs.staticResources.defaultAvatar,
                    shape: BoxShape.circle,
                  ),
                  radius: 18,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('  ...  '),
                  Text(ts, style: Theme.of(context).textTheme.caption)
                ],
              ),
            ],
          ),
        ),
      ),
      PopupMenuButton<VoidCallback>(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text(LocaleKeys.Community_Delete.tr()),
            value: _remove,
          ),
        ],
        onSelected: (v) => v(),
      ),
    ]);

    final content = Padding(
      padding: const EdgeInsets.only(left: 52, right: 8),
      child: SelectableText(post.content),
    );

    final footer = Row(
      children: [
        IconButton(
          tooltip: LocaleKeys.Community_Like.tr(),
          icon: LikeIcon(liked: post.liked > 0),
          iconSize: 25,
          padding: EdgeInsets.zero,
          onPressed: _like,
        ),
        Text('${max(0, post.likes)}'),
        const VerticalDivider(color: Colors.transparent),
        Transform.translate(
          offset: const Offset(0, -1),
          child: IconButton(
            tooltip: LocaleKeys.Community_Comment.tr(),
            icon: const Icon(FontAwesomeIcons.commentDots),
            iconSize: 23,
            padding: EdgeInsets.zero,
            onPressed: _comment,
          ),
        ),
        const VerticalDivider(color: Colors.transparent),
        IconButton(
          icon: AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            firstChild: const Icon(Icons.bookmark_border),
            secondChild: const Icon(Icons.bookmark),
            crossFadeState: post.saved
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
          iconSize: 25,
          padding: EdgeInsets.zero,
          onPressed: _save,
        ),
      ],
    );

    Widget? children;
    if (widget.children.isNotEmpty) {
      children = Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: _showChildren,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final c in widget.children)
                  UserProfileBuilder(
                    uid: c.uid,
                    builder: (context, profile) => Text(
                      '${profile.displayName}: ${c.content}',
                    ),
                    placeholder: (context) => Text('...: ${c.content}'),
                  )
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header,
        content,
        Padding(
          padding: const EdgeInsets.only(left: 46),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              footer,
              if (children != null) children,
            ],
          ),
        )
      ],
    );
  }
}
