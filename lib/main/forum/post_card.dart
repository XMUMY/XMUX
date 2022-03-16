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
  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    final ts = format(
      widget.post.createAt.toDateTime(),
      locale: lang,
      allowFromNow: true,
    );

    final header = UserProfileBuilder(
      uid: widget.post.uid,
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
    );

    final content = Padding(
      padding: const EdgeInsets.only(left: 52, right: 8),
      child: SelectableText(widget.post.content),
    );

    final footer = Row(
      children: [
        IconButton(
          icon: LikeIcon(liked: widget.post.liked > 0),
          iconSize: 25,
          padding: EdgeInsets.zero,
          onPressed: () {
            final liked = widget.post.liked > 0 ? 0 : 1;
            widget.post.likes += liked > 0 ? 1 : -1;
            setState(() => widget.post.liked = liked);
            rpc.forumClient.likePost(LikePostReq(
              postId: widget.post.id,
              like: liked,
            ));
          },
        ),
        Text('${max(0, widget.post.likes)}'),
        const VerticalDivider(color: Colors.transparent),
        Transform.translate(
          offset: const Offset(0, -1),
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.commentDots),
            iconSize: 23,
            padding: EdgeInsets.zero,
            onPressed: () async {
              final r = await NewPostDialog.show(
                context,
                thread: widget.thread,
                parentPost: widget.post,
              );
              if (r == true) widget.onPostComment?.call();
            },
          ),
        ),
        const VerticalDivider(color: Colors.transparent),
        IconButton(
          icon: AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            firstChild: const Icon(Icons.bookmark_border),
            secondChild: const Icon(Icons.bookmark),
            crossFadeState: widget.post.saved
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
          iconSize: 25,
          padding: EdgeInsets.zero,
          onPressed: () {
            rpc.forumClient.savePost(SavePostReq(
              postId: widget.post.id,
            ));
            setState(() => widget.post.saved = !widget.post.saved);
          },
        ),
      ],
    );

    Widget? children;
    if (widget.children.isNotEmpty) {
      children = Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final c in widget.children)
              Row(
                children: [
                  UserProfileBuilder(
                    uid: c.uid,
                    builder: (context, profile) =>
                        Text(profile.displayName + ': '),
                  ),
                  Text(c.content),
                ],
              )
          ],
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
