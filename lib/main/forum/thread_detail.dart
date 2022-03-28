import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/generated/forum_common.pb.dart';
import 'package:xmus_client/generated/forum_post.pb.dart';
import 'package:xmus_client/generated/forum_thread.pb.dart';

import '../../global.dart';
import '../../util/screen.dart';
import 'post_card.dart';
import 'thread_card.dart';

class ThreadDetailPage extends StatefulWidget {
  final Thread thread;

  const ThreadDetailPage({Key? key, required this.thread}) : super(key: key);

  @override
  State<ThreadDetailPage> createState() => _ThreadDetailPageState();
}

class _ThreadDetailPageState extends State<ThreadDetailPage> {
  final _pagingController = PagingController<int, Post>(firstPageKey: 0);
  final _childrens = <int, List<Post>>{};

  Future<void> _fetchPage(int pageKey) async {
    final resp = await rpc.forumClient.getPosts(GetPostsReq(
      threadId: widget.thread.id,
      ordering: Ordering.latest,
      offset: pageKey,
      count: 10,
    ));

    final posts = resp.posts;
    final tops = posts.where((p) => p.parentId <= 0).toList();
    for (final post in posts) {
      if (post.parentId > 0) {
        _childrens[post.parentId] ??= [];
        _childrens[post.parentId]!.add(post);
      }
    }

    if (!mounted) return;
    if (tops.length >= 10) {
      _pagingController.appendPage(tops, pageKey + tops.length);
    } else {
      _pagingController.appendLastPage(tops);
    }
  }

  Future<void> _remove() async {
    await rpc.forumClient.removeThread(RemoveThreadReq(
      threadId: widget.thread.id,
    ));
    context.pop();
  }

  Future<void> _refreshComments() async {
    if (!mounted) return;
    _childrens.clear();
    _pagingController.refresh();
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final thread = widget.thread;
    return Scaffold(
      appBar: AppBar(
        title: Text(thread.title),
        actions: [
          PopupMenuButton<VoidCallback>(
            itemBuilder: (context) => [
              if (thread.uid == store.state.user.campusId)
                PopupMenuItem(
                  child: Text(LocaleKeys.Community_Delete.tr()),
                  value: _remove,
                ),
            ],
            onSelected: (v) => v(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshComments,
        child: CustomScrollView(
          slivers: [
            const SliverPadding(padding: EdgeInsets.only(top: 4)),
            SliverToBoxAdapter(
              child: BodyPadding(
                child: Hero(
                  tag: thread.id,
                  child: ThreadCard(
                    thread: thread,
                    expanded: true,
                    exbandable: true,
                    onPostComment: _refreshComments,
                  ),
                ),
              ),
            ),
            PagedSliverList.separated(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Post>(
                itemBuilder: (context, post, index) => BodyPadding(
                  child: PostCard(
                    threadId: thread.id,
                    post: post,
                    children: _childrens[post.id] ?? [],
                    thread: thread,
                    onPostComment: _refreshComments,
                  ),
                ),
                noItemsFoundIndicatorBuilder: (_) => const SizedBox(),
              ),
              separatorBuilder: (context, index) => const BodyPadding(
                child: Divider(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
