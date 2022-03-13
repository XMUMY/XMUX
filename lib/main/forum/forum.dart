import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:xmus_client/generated/google/protobuf/empty.pb.dart';
import 'package:xmus_client/generated/post.pb.dart';
import 'package:xmus_client/generated/reply.pb.dart';
import 'package:xmus_client/generated/saved.pb.dart';
import 'package:xmux/main/forum/thread.dart';

import '../../global.dart';
import '../main_page.dart';
import 'component/post_brief_list.dart';
import 'component/post_reply_collection.dart';
import 'component/widgets.dart';
import 'create_post.dart';
import 'notifs.dart';

class ForumList extends StatefulWidget {
  const ForumList({Key? key}) : super(key: key);

  @override
  State<ForumList> createState() => _ForumListState();
}

class _ForumListState extends State<ForumList> {
  late final _postBriefList = PostBriefList(
    getPostFunc: _fetchPage,
    onTap: _postOnTap,
  );
  var notifNum = 0;

  @override
  void initState() {
    super.initState();
    timeago.setLocaleMessages('zh', timeago.ZhCnMessages());
    timeago.setLocaleMessages('et', timeago.EnShortMessages());
    _refreshNotifNum().then((value) => {
          if (mounted) {setState(() {})}
        });
  }

  @override
  void dispose() {
    _postBriefList.dispose();
    super.dispose();
  }

  Future<List<PostDetails>> _fetchPage(int pageKey) async {
    // The default forum group has id 1
    final resp = await rpc.forumClient
        .getPost(GetPostReq(pageNo: pageKey, pageSize: 10, groupIds: <int>[1]));
    return resp.pd;
  }

  Future<void> _refreshNotifNum() async {
    notifNum = (await rpc.forumClient.getNotifNum(Empty())).num;
  }

  Future<void> _postOnTap(PostDetails postDetails) async {
    final shouldRefresh = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
          builder: (context) => ForumList(postDetails: postDetails)),
    );
    if (shouldRefresh ?? false) {
      context
          .findAncestorStateOfType<_ForumListState>()
          ?._postBriefList
          .refresh();
    }
  }

  Future<void> _handleRefresh() async {
    _postBriefList.refresh();
    await _refreshNotifNum();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Forum.Forum'.tr()),
        actions: [
          Badge(
            badgeContent: Text(notifNum.toString()),
            showBadge: notifNum != 0,
            animationType: BadgeAnimationType.fade,
            position: BadgePosition.topEnd(top: 4, end: 4),
            child: IconButton(
              tooltip: 'Forum.Notif'.tr(),
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NotifPage()));
                await _refreshNotifNum();
                setState(() {});
              },
            ),
          ),
          PopupMenuButton(
              tooltip: 'Forum.More'.tr(),
              onSelected: (result) {
                switch (result) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PostReplyCollectionPage(
                              pageTitle: 'Forum.Saved'.tr(),
                              isReplySaved: true,
                              postOnLongPress: (pd) => showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) => Wrap(
                                        children: [
                                          ListTile(
                                            leading: const Icon(
                                                Icons.bookmark_remove_outlined),
                                            title:
                                                Text('Remove from saved'.tr()),
                                            onTap: () async {
                                              await rpc.forumClient
                                                  .removeSavedPost(
                                                      SaveReq(refId: pd.id));
                                              showSnackbarMsg(
                                                  Text('Removed'.tr()),
                                                  context);
                                              Navigator.of(context).pop(true);
                                            },
                                          ),
                                        ],
                                      )),
                              fetchPostPage: (page) => rpc.forumClient
                                  .getSavedPost(
                                      GetSavedReq(pageNo: page, pageSize: 10))
                                  .then((resp) => resp.pd),
                              fetchReplyPage: (page) => rpc.forumClient
                                  .getSavedReply(
                                      GetSavedReq(pageNo: page, pageSize: 10))
                                  .then((resp) => resp.replies))),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PostReplyCollectionPage(
                              pageTitle: 'Forum.MyActivity'.tr(),
                              fetchPostPage: (page) => rpc.forumClient
                                  .getPost(GetPostReq(
                                      pageNo: page,
                                      pageSize: 10,
                                      uid: store.state.user.campusId))
                                  .then((resp) => resp.pd),
                              fetchReplyPage: (page) => rpc.forumClient
                                  .getUserReply(GetUserReplyReq(
                                      pageNo: page,
                                      pageSize: 10,
                                      uid: store.state.user.campusId))
                                  .then((resp) => resp.replies))),
                    );
                    break;
                }
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Forum.Saved'.tr()),
                      value: 0,
                    ),
                    PopupMenuItem(
                      child: Text('Forum.MyActivity'.tr()),
                      value: 1,
                    ),
                  ])
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: _postBriefList,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: 'Forum.CreatePost'.tr(),
        onPressed: () async {
          final shouldRefresh = await Navigator.of(context).push<bool>(
            MaterialPageRoute(builder: (context) => const NewPostPage()),
          );
          if (shouldRefresh ?? false) {
            _postBriefList.refresh();
          }
        },
      ),
    );
  }
}
