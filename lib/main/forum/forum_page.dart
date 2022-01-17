import 'package:flutter/material.dart';
import 'package:xmus_client/generated/post.pb.dart';
import 'package:xmus_client/generated/reply.pb.dart';
import 'package:xmus_client/generated/saved.pb.dart';
import 'package:xmux/main/forum/thread.dart';

import '../../global.dart';
import '../main_page.dart';
import 'component/widgets.dart';
import 'create_post.dart';
import 'component/post_brief_list.dart';
import 'component/post_reply_collection.dart';

class ForumPage extends StatefulWidget implements TopLevelPage {
  const ForumPage({Key? key}) : super(key: key);

  @override
  String get label => 'Forum.Forum'.tr();

  @override
  Widget get icon => const Icon(Icons.chat_bubble_outline);

  @override
  Widget get activeIcon => const Icon(Icons.chat_outlined);

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  late final _postBriefList = PostBriefList(
    getPostFunc: _fetchPage,
    onTap: _postOnTap,
  );

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

  Future<void> _postOnTap(PostDetails postDetails) async {
    final shouldRefresh = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
          builder: (context) => ThreadPage(postDetails: postDetails)),
    );
    if (shouldRefresh ?? false) {
      context
          .findAncestorStateOfType<_ForumPageState>()
          ?._postBriefList
          .refresh();
    }
  }

  Future<void> _handleRefresh() async {
    _postBriefList.refresh();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Forum.Forum'.tr()),
        actions: [
          PopupMenuButton(
              onSelected: (result) {
                switch (result) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PostReplyCollectionPage(
                              pageTitle: 'Saved'.tr(),
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
                              pageTitle: 'My activity'.tr(),
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
                      child: Text('Saved'.tr()),
                      value: 0,
                    ),
                    PopupMenuItem(
                      child: Text('My Activity'.tr()),
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
