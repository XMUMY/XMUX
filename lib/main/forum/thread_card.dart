import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart';
import 'package:xmus_client/generated/forum_saved.pb.dart';
import 'package:xmus_client/generated/forum_thread.pb.dart';

import '../../../component/floating_card.dart';
import '../../../component/user_profile.dart';
import '../../component/gravatar.dart';
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

  Future<void> _like() async {
    final liked = widget.thread.liked > 0 ? 0 : 1;
    widget.thread.likes += liked > 0 ? 1 : -1;
    setState(() => widget.thread.liked = liked);
    rpc.forumClient.likeThread(LikeThreadReq(
      threadId: widget.thread.id,
      like: liked,
    ));
  }

  Future<void> _comment() async {
    final r = await NewPostDialog.show(
      context,
      threadId: widget.thread.id,
    );
    if (r == true) {
      setState(() => widget.thread.posts++);
      widget.onPostComment?.call();
    }
  }

  Future<void> _save() async {
    final thread = widget.thread;
    if (thread.saved) {
      rpc.forumClient.unsaveThread(UnsaveThreadReq(
        threadId: thread.id,
      ));
    } else {
      rpc.forumClient.saveThread(SaveThreadReq(
        threadId: thread.id,
      ));
    }
    setState(() => thread.saved = !thread.saved);
  }

  @override
  void initState() {
    _expandableController = ExpandableController(
      initialExpanded: widget.expanded,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final thread = widget.thread;
    final lang = Localizations.localeOf(context).languageCode;
    final ts = format(
      thread.createAt.toDateTime(),
      locale: lang,
      allowFromNow: true,
    );

    final header = UserProfileBuilder(
      uid: thread.uid,
      builder: (context, profile) => Row(
        key: ValueKey(profile),
        children: <Widget>[
          // Build user avatar.
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Gravatar(
              url: profile.avatar,
              fallbackName: profile.displayName,
              radius: 18,
            ),
          ),

          // Build user name and timestamp.
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(profile.displayName),
              Text(ts, style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ],
      ),
      placeholder: (context) => Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Gravatar(radius: 18),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('  ...  '),
              Text(ts, style: Theme.of(context).textTheme.bodySmall)
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
            thread.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (thread.hasPlainContent())
            Text(
              thread.plainContent.content,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          else if (thread.hasMarkdownContent())
            Text(
              thread.markdownContent.content.replaceAll(RegExp('#| '), ''),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          else
            Text(LocaleKeys.Community_Unsupported.tr())
        ],
      ),
    );

    final expanded = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            thread.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (thread.hasPlainContent())
            SelectableText(thread.plainContent.content)
          else if (thread.hasMarkdownContent())
            MarkdownBody(
              data: thread.markdownContent.content,
              selectable: true,
              shrinkWrap: true,
            )
          else
            Text(LocaleKeys.Community_Unsupported.tr())
        ],
      ),
    );

    final footer = Row(
      children: [
        IconButton(
          tooltip: LocaleKeys.Community_Like.tr(),
          icon: LikeIcon(liked: thread.liked > 0),
          iconSize: 25,
          padding: EdgeInsets.zero,
          onPressed: _like,
        ),
        Text('${max(0, thread.likes)}'),
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
        Text(thread.posts.toString()),
        const VerticalDivider(color: Colors.transparent),
        IconButton(
          icon: AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            firstChild: const Icon(Icons.bookmark_border),
            secondChild: const Icon(Icons.bookmark),
            crossFadeState: thread.saved
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
          iconSize: 25,
          padding: EdgeInsets.zero,
          onPressed: _save,
        ),
      ],
    );

    return FloatingCard(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(5),
      onTap: widget.exbandable
          ? null // Already in detail page.
          : () => context.push(
                '/Community/Thread/${thread.id}',
                extra: thread,
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
