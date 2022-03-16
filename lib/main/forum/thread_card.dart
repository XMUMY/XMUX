import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart';
import 'package:xmus_client/generated/forum_saved.pb.dart';
import 'package:xmus_client/generated/forum_thread.pb.dart';

import '../../../component/floating_card.dart';
import '../../../component/user_profile.dart';
import '../../component/like_icon.dart';
import '../../global.dart';
import 'post_dialog.dart';

class ThreadCard extends StatefulWidget {
  final Thread thread;

  /// Expanded by default.
  final bool expanded;

  /// Whether the body of the thread is expandable.
  final bool exbandable;

  final VoidCallback? onPostComment;

  const ThreadCard({
    Key? key,
    required this.thread,
    this.expanded = false,
    this.exbandable = false,
    this.onPostComment,
  }) : super(key: key);

  @override
  State<ThreadCard> createState() => _ThreadCardState();
}

class _ThreadCardState extends State<ThreadCard> {
  late ExpandableController _expandableController;

  @override
  void initState() {
    _expandableController = ExpandableController(
      initialExpanded: widget.expanded,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    final ts = format(
      widget.thread.createAt.toDateTime(),
      locale: lang,
      allowFromNow: true,
    );

    final header = UserProfileBuilder(
      uid: widget.thread.uid,
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

    final collapsed = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.thread.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            widget.thread.body,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

    final expanded = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.thread.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SelectableText(widget.thread.body),
        ],
      ),
    );

    final footer = Row(
      children: [
        IconButton(
          icon: LikeIcon(liked: widget.thread.liked > 0),
          iconSize: 25,
          padding: EdgeInsets.zero,
          onPressed: () {
            final liked = widget.thread.liked > 0 ? 0 : 1;
            widget.thread.likes += liked > 0 ? 1 : -1;
            setState(() => widget.thread.liked = liked);
            rpc.forumClient.likeThread(LikeThreadReq(
              threadId: widget.thread.id,
              like: liked,
            ));
          },
        ),
        Text('${max(0, widget.thread.likes)}'),
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
              );
              if (r == true) {
                setState(() => widget.thread.posts++);
                widget.onPostComment?.call();
              }
            },
          ),
        ),
        Text(widget.thread.posts.toString()),
        const VerticalDivider(color: Colors.transparent),
        IconButton(
          icon: AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            firstChild: const Icon(Icons.bookmark_border),
            secondChild: const Icon(Icons.bookmark),
            crossFadeState: widget.thread.saved
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
          iconSize: 25,
          padding: EdgeInsets.zero,
          onPressed: () {
            rpc.forumClient.saveThread(SaveThreadReq(
              threadId: widget.thread.id,
            ));
            setState(() => widget.thread.saved = !widget.thread.saved);
          },
        ),
      ],
    );

    return FloatingCard(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(5),
      onTap: () => context.go(
        '/M/Community/Thread/${widget.thread.id}',
        extra: widget.thread,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpandablePanel(
            theme: ExpandableThemeData(
              tapHeaderToExpand: false,
              hasIcon: widget.exbandable,
              iconColor: Theme.of(context).iconTheme.color,
            ),
            controller: _expandableController,
            header: header,
            collapsed: collapsed,
            expanded: expanded,
          ),
          const Divider(height: 12),
          footer,
        ],
      ),
    );
  }
}
