import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:xmus_client/generated/post.pb.dart';
import 'package:xmus_client/generated/reply.pb.dart';
import 'package:xmux/main/forum/component/post_brief_list.dart';
import 'package:xmux/main/forum/component/reply_list.dart';
import 'package:xmux/main/forum/thread.dart';

import '../../../global.dart';

class PostReplyCollectionPage extends StatefulWidget {
  final String pageTitle;
  final Future<List<PostDetails>> Function(int pageKey) fetchPostPage;
  final Future<List<Reply>> Function(int pageKey) fetchReplyPage;
  final Future<void> Function(PostDetails postDetails)? postOnTap;
  final Future<void> Function(Reply reply)? replyOnTap;

  const PostReplyCollectionPage(
      {Key? key,
      required this.pageTitle,
      required this.fetchPostPage,
      required this.fetchReplyPage, this.postOnTap, this.replyOnTap})
      : super(key: key);

  @override
  State<PostReplyCollectionPage> createState() =>
      _PostReplyCollectionPageState();
}

class _PostReplyCollectionPageState extends State<PostReplyCollectionPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final _postBriefList = PostBriefList(
    getPostFunc: widget.fetchPostPage,
    onTap: widget.postOnTap ?? _defaultPostOnTap
  );
  late final _replyList = ReplyList(
    getReplyFunc: widget.fetchReplyPage,
    onTap: widget.replyOnTap ?? _defaultReplyOnTap,
  );

  Future<void> _defaultPostOnTap(PostDetails postDetails) async {
    await Navigator.of(context).push<bool>(
      MaterialPageRoute(
          builder: (context) => ThreadPage(postDetails: postDetails)),
    );
  }

  Future<void> _defaultReplyOnTap(Reply reply) async {
   final postDetails = await rpc.forumClient.getPostById(GetPostByIdReq(postId: reply.refPostId));
    await Navigator.of(context).push<bool>(
      MaterialPageRoute(
          builder: (context) => ThreadPage(postDetails: postDetails)),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _postBriefList.dispose();
    _replyList.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.pageTitle),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: 'Post'.tr(),
              ),
              Tab(
                text: 'Reply'.tr(),
              )
            ],
          )),
      body: TabBarView(
        controller: _tabController,
        children: [_postBriefList, _replyList],
      ),
    );
  }
}
