import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/api/forum_common.pb.dart';
import 'package:xmus_client/api/forum_post.pb.dart';
import 'package:xmus_client/api/forum_thread.pb.dart';

import '../../foundation/localization/locale_keys.dart';
import '../../foundation/platform/breakpoint.dart';
import '../../global.dart';
import '../redux/store.dart';
import 'post_card.dart';
import 'thread_card.dart';

class ThreadDetailPage extends StatefulWidget {
  final Thread thread;

  const ThreadDetailPage({super.key, required this.thread});

  @override
  State<ThreadDetailPage> createState() => _ThreadDetailPageState();
}

class _ThreadDetailPageState extends State<ThreadDetailPage> {
  late final _pagingController = PagingController<int, Post>(
    getNextPageKey: (state) {
      final pages = state.pages;
      if (pages == null || pages.isEmpty) return 0;
      if (pages.last.length < 10) return null;
      return state.keys!.last + pages.last.length;
    },
    fetchPage: (pageKey) async {
      final resp = await rpc.forumClient.getPosts(
        GetPostsReq(
          threadId: widget.thread.id,
          ordering: Ordering.latest,
          offset: pageKey,
          count: 10,
        ),
      );

      final posts = resp.posts;
      for (final post in posts) {
        if (post.parentId > 0) {
          _childrens[post.parentId] ??= [];
          _childrens[post.parentId]!.add(post);
        }
      }
      return posts.where((p) => p.parentId <= 0).toList();
    },
  );
  final _childrens = <int, List<Post>>{};

  Future<void> _remove() async {
    await rpc.forumClient.removeThread(
      RemoveThreadReq(threadId: widget.thread.id),
    );
    if (mounted) context.pop();
  }

  Future<void> _refreshComments() async {
    if (!mounted) return;
    _childrens.clear();
    _pagingController.refresh();
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
                  value: _remove,
                  child: Text(LocaleKeys.Community_Delete.tr()),
                ),
            ],
            onSelected: (v) => v(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshComments,
        child: PagingListener(
          controller: _pagingController,
          builder: (context, state, fetchNextPage) => CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: context.padBody),
                sliver: SliverToBoxAdapter(
                  child: SingleBodyLayout(
                    child: Hero(
                      tag: thread.id,
                      child: ThreadCard(
                        thread: thread,
                        expanded: true,
                        expandable: true,
                        onPostComment: _refreshComments,
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: context.padBody),
                sliver: PagedSliverList.separated(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: PagedChildBuilderDelegate<Post>(
                    itemBuilder: (context, post, index) => SingleBodyLayout(
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
                  separatorBuilder: (context, index) =>
                      const SingleBodyLayout(child: Divider()),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
