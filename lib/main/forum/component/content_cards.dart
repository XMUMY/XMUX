import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmus_client/generated/post.pb.dart';
import 'package:xmus_client/generated/reply.pb.dart';
import 'package:xmus_client/generated/saved.pb.dart';
import 'package:xmux/main/forum/component/widgets.dart';

import '../../../component/floating_card.dart';
import '../../../component/user_profile.dart';
import '../../../global.dart';

class PostBriefCard extends StatelessWidget {
  final PostDetails postDetails;
  final String locale;
  final Future<void> Function()? onTap;
  final Future<void> Function()? onLongPress;

  const PostBriefCard(
      {Key? key,
      required this.postDetails,
      required this.locale,
      this.onTap,
      this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ProfileHeadline(
          uid: postDetails.uid,
          time: postDetails.updateTime.toDateTime(),
          topped: postDetails.topped,
          best: postDetails.best,
        ),
        // Build title.
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(postDetails.title,
              style: Theme.of(context).textTheme.titleMedium),
        ),
      ],
    );

    return FloatingCard(
      onTap: onTap,
      onLongPress: onLongPress,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(5),
      child: content,
    );
  }
}

class PostDetailsCard extends StatelessWidget {
  final PostDetails postDetails;
  final String locale;

  const PostDetailsCard(
      {Key? key, required this.postDetails, required this.locale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var expansibleContent = ExpandablePanel(
        theme: const ExpandableThemeData(hasIcon: false),
        controller: ExpandableController(initialExpanded: true),
        header: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ProfileHeadline(
                uid: postDetails.uid,
                time: postDetails.createTime.toDateTime(),
                topped: postDetails.topped,
                best: postDetails.best,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  postDetails.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )
            ])),
        collapsed: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              postDetails.body,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            )),
        expanded: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Linkify(
                  text: postDetails.body,
                  style: Theme.of(context).textTheme.bodyLarge,
                  onOpen: (link) => launch(link.url),
                ),
              )
            ],
          ),
        ));

    return FloatingCard(
      margin: const EdgeInsets.symmetric(vertical: 0),
      padding: const EdgeInsets.symmetric(vertical: 5),
      onLongPress: () => showPostBottomSheet(context, postDetails),
      child: expansibleContent,
    );
  }
}

class ReplyCard extends StatelessWidget {
  final Reply reply;
  final String locale;
  final void Function()? replyOnClick;
  final bool inBottomSheet;
  final Future<void> Function()? onTap;
  final bool isSaved;

  const ReplyCard(
      {Key? key,
      required this.reply,
      required this.locale,
      this.replyOnClick,
      this.inBottomSheet = false,
      this.onTap,
      this.isSaved = false})
      : super(key: key);

  Future<void> _showReplySheet(BuildContext context, int replyId) async {
    var tracedReply =
        await rpc.forumClient.getReplyById(GetReplyByIdReq(replyId: replyId));
    return showModalBottomSheet<void>(
        builder: (BuildContext context) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Text(
                        'Forum.ReferedComment'.tr(),
                        style: Theme.of(context).textTheme.titleLarge,
                      )),
                  ReplyCard(
                    reply: tracedReply,
                    locale: locale,
                    inBottomSheet: true,
                  )
                ]),
        context: context);
  }

  void _handleOnTap(BuildContext context) {
    if (inBottomSheet) {
      Navigator.of(context).pop();
    }
    _showReplySheet(context, reply.refReplyId);
  }

  @override
  Widget build(BuildContext context) {
    var expansibleContent = ExpandablePanel(
        theme: const ExpandableThemeData(hasIcon: false),
        controller: ExpandableController(initialExpanded: true),
        header: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            child: ProfileHeadline(
              uid: reply.uid,
              time: reply.createTime.toDateTime(),
              topped: reply.topped,
              sideButton: replyOnClick != null
                  ? IconButton(
                      onPressed: replyOnClick,
                      icon: const Icon(Icons.add_comment_rounded),
                      color: Theme.of(context).hintColor,
                    )
                  : null,
            )),
        collapsed: Container(),
        expanded: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                  child: reply.refReplyId == -1
                      ? Linkify(
                          text: reply.content,
                          style: Theme.of(context).textTheme.bodyLarge,
                          onOpen: (link) => launch(link.url),
                        )
                      : UserProfileBuilder(
                          uid: reply.refUid,
                          builder: (context, profile) {
                            final linkSpan = buildTextSpan(
                                linkify(reply.content),
                                onOpen: (link) => launch(link.url),
                                style: Theme.of(context).textTheme.bodyLarge,
                                linkStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline,
                                    ));
                            linkSpan.children?.insert(
                                0,
                                TextSpan(
                                  text: '@${profile.displayName} ',
                                  style: const TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => _handleOnTap(context),
                                ));

                            return RichText(text: linkSpan);
                          },
                        ))
            ],
          ),
        ));

    return FloatingCard(
      onTap: onTap,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(5),
      onLongPress: () => _showReplyBottomSheet(context, reply, isSaved),
      child: expansibleContent,
    );
  }
}

Future<void> showPostBottomSheet(
    BuildContext pageContext, PostDetails postDetails) async {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: pageContext,
      builder: (context) => Wrap(
            children: [
              if (postDetails.uid == store.state.user.campusId)
                ListTile(
                  leading: const Icon(Icons.delete_outlined),
                  title: Text('Remove post'.tr()),
                  onTap: () {
                    rpc.forumClient.removePost(
                      UpdatePostReq(postId: postDetails.id),
                    );
                    Navigator.of(context).pop(true);
                    Navigator.of(pageContext).pop(true);
                  },
                ),
              ListTile(
                leading: const Icon(Icons.star_border_rounded),
                title: Text('Add to saved'.tr()),
                onTap: () async {
                  var res = await rpc.forumClient
                      .savePost(SaveReq(refId: postDetails.id));
                  if (res.alreadySaved) {
                    showSnackbarMsg(Text('Already saved'.tr()), context);
                  } else {
                    showSnackbarMsg(Text('Saved'.tr()), context);
                  }
                  Navigator.of(context).pop(true);
                },
              ),
              ListTile(
                leading: const Icon(Icons.content_copy),
                title: Text('Copy post title'.tr()),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: postDetails.title));
                  Navigator.of(context).pop(true);
                  showSnackbarMsg(Text('Copied'.tr()), context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.content_copy),
                title: Text('Copy post content'.tr()),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: postDetails.body));
                  Navigator.of(context).pop(true);
                  showSnackbarMsg(Text('Copied'.tr()), context);
                },
              ),
            ],
          ));
}

Future<void> _showReplyBottomSheet(
    BuildContext pageContext, Reply reply, bool isReplySaved) async {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: pageContext,
      builder: (context) => Wrap(
            children: [
              if (reply.uid == store.state.user.campusId)
                ListTile(
                  leading: const Icon(Icons.delete_outlined),
                  title: Text('Remove reply'.tr()),
                  onTap: () {
                    rpc.forumClient.removeReply(
                      UpdateReplyReq(replyId: reply.id),
                    );
                    Navigator.of(context).pop(true);
                    showSnackbarMsg(Text('Removed'.tr()), context);
                  },
                ),
              if (!isReplySaved)
                ListTile(
                  leading: const Icon(Icons.bookmark_add_outlined),
                  title: Text('Add to saved'.tr()),
                  onTap: () async {
                    var res = await rpc.forumClient
                        .saveReply(SaveReq(refId: reply.id));
                    if (res.alreadySaved) {
                      showSnackbarMsg(Text('Already saved'.tr()), context);
                    } else {
                      showSnackbarMsg(Text('Saved'.tr()), context);
                    }
                    Navigator.of(context).pop(true);
                  },
                ),
              if (isReplySaved)
                ListTile(
                  leading: const Icon(Icons.bookmark_remove_outlined),
                  title: Text('Remove from saved'.tr()),
                  onTap: () async {
                    await rpc.forumClient
                        .removeSavedReply(SaveReq(refId: reply.id));
                    showSnackbarMsg(Text('Removed'.tr()), context);
                    Navigator.of(context).pop(true);
                  },
                ),
              ListTile(
                leading: const Icon(Icons.content_copy),
                title: Text('Copy reply'.tr()),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: reply.content));
                  Navigator.of(context).pop(true);
                  showSnackbarMsg(Text('Copied'.tr()), context);
                },
              ),
            ],
          ));
}
