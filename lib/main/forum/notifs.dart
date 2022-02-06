import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:xmus_client/generated/notif.pb.dart';
import 'package:xmus_client/generated/post.pb.dart';
import 'package:xmus_client/generated/reply.pb.dart';
import 'package:xmux/component/floating_card.dart';
import 'package:xmux/main/forum/thread.dart';

import '../../global.dart';
import '../../util/screen.dart';
import 'component/widgets.dart';

class NotifPage extends StatefulWidget {
  const NotifPage({Key? key}) : super(key: key);

  @override
  _NotifPageState createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  final _pagingController = PagingController<int, Notif>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    final resp = await rpc.forumClient
        .getNotif(GetNotifReq(pageNo: pageKey, pageSize: 10));
    if (resp.notifs.isNotEmpty) {
      _pagingController.appendPage(resp.notifs, pageKey + 1);
    } else {
      _pagingController.appendLastPage([Notif(id: -14514)]);
    }
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(_fetchPage);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Forum.Notif'.tr()),
        ),
        body: PagedListView(
          pagingController: _pagingController,
          padding:
              EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
          builderDelegate: PagedChildBuilderDelegate<Notif>(
            itemBuilder: (context, item, index) {
              if (item.id == -14514) {
                return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('-----END-----',
                        style: Theme.of(context).textTheme.caption,
                        textAlign: TextAlign.center));
              }
              return VisibilityDetector(
                child: NotifCard(notif: item),
                onVisibilityChanged: (visibilityInfo) {
                  if (!item.hasRead && visibilityInfo.visibleFraction >= 0.8) {
                    rpc.forumClient.notifMarkAsRead(
                        NotifMarkAsReadReq(ids: <int>[item.id]));
                  }
                },
                key: Key(item.id.toString()),
              );
            },
          ),
        ));
  }
}

class NotifCard extends StatelessWidget {
  final Notif notif;
  late final middleMessage = notif.type == NotifType.POST_REPLY
      ? 'Forum.CommentNotif'.tr()
      : 'Forum.ReplyNotif'.tr();

  NotifCard({Key? key, required this.notif}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeadline(
            uid: notif.senderUid,
            time: notif.createTime.toDateTime(),
            middleMessage: middleMessage,
            hasRead: notif.hasRead,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                notif.objContent,
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.bodyLarge,
              ))
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(5),
      onTap: () async {
        int postId = notif.refId;
        Reply? reply;
        reply = await rpc.forumClient
            .getReplyById(GetReplyByIdReq(replyId: notif.objId));
        postId = reply.refPostId;
        var pd =
            await rpc.forumClient.getPostById(GetPostByIdReq(postId: postId));
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ThreadPage(
                  postDetails: pd,
                  highlightReply: reply,
                )));
      },
    );
  }
}
