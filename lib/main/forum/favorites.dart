import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/api/forum_post.pb.dart';
import 'package:xmus_client/api/forum_saved.pb.dart';
import 'package:xmus_client/api/forum_thread.pb.dart';

import '../../global.dart';
import '../../util/screen.dart';
import '../../util/tab.dart';
import 'post_card.dart';
import 'thread_card.dart';

class FavoritePage extends StatefulWidget {
  final int index;

  const FavoritePage({super.key, this.index = 0});

  factory FavoritePage.fromTab(String? tab) =>
      FavoritePage(index: tabs.indexWhere((e) => e.path == tab));

  static const tabs = <TabEntry>[
    _Threads(),
    _Posts(),
  ];

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    _controller = TabController(
      length: FavoritePage.tabs.length,
      vsync: this,
      initialIndex: widget.index,
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FavoritePage oldWidget) {
    _controller.index = widget.index;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Community_Favorites.tr()),
        bottom: TabBar(
          isScrollable: true,
          controller: _controller,
          tabs: FavoritePage.tabs.map((e) => Tab(text: e.label)).toList(),
          onTap: (index) => context
              .go('/Community/Favorite/${FavoritePage.tabs[index].path}'),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: FavoritePage.tabs,
      ),
    );
  }
}

class _Threads extends StatefulWidget implements TabEntry {
  @override
  String get path => 'Thread';

  @override
  String get label => LocaleKeys.Community_Threads.tr();

  const _Threads();

  @override
  State<_Threads> createState() => _ThreadsState();
}

class _ThreadsState extends State<_Threads> with AutomaticKeepAliveClientMixin {
  final _pagingController = PagingController<int, Thread>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    final resp = await rpc.forumClient.getSavedThreads(GetSavedThreadsReq(
      offset: pageKey,
      count: 10,
    ));
    if (!mounted) return;
    if (resp.threads.isNotEmpty && resp.threads.length >= 10) {
      _pagingController.appendPage(resp.threads, pageKey + resp.threads.length);
    } else {
      _pagingController.appendLastPage(resp.threads);
    }
  }

  @override
  bool get wantKeepAlive => true;

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
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async => _pagingController.refresh(),
      child: PagedListView<int, Thread>(
        padding: context.padListView,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Thread>(
          itemBuilder: (context, thread, index) => Hero(
            tag: thread.id,
            child: ThreadCard(thread: thread),
          ),
          noItemsFoundIndicatorBuilder: (context) => const SizedBox(),
        ),
      ),
    );
  }
}

class _Posts extends StatefulWidget implements TabEntry {
  @override
  String get path => 'Post';

  @override
  String get label => LocaleKeys.Community_Comment.tr();

  const _Posts();

  @override
  State<_Posts> createState() => _PostsState();
}

class _PostsState extends State<_Posts> with AutomaticKeepAliveClientMixin {
  final _pagingController = PagingController<int, Post>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    final resp = await rpc.forumClient.getSavedPosts(GetSavedPostsReq(
      offset: pageKey,
      count: 10,
    ));
    if (!mounted) return;
    if (resp.posts.isNotEmpty && resp.posts.length >= 10) {
      _pagingController.appendPage(resp.posts, pageKey + resp.posts.length);
    } else {
      _pagingController.appendLastPage(resp.posts);
    }
  }

  @override
  bool get wantKeepAlive => true;

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
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async => _pagingController.refresh(),
      child: PagedListView<int, Post>(
        padding: context.padListView,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Post>(
          itemBuilder: (context, post, index) => PostCard(
            threadId: post.threadId,
            post: post,
          ),
          noItemsFoundIndicatorBuilder: (context) => const SizedBox(),
        ),
      ),
    );
  }
}
