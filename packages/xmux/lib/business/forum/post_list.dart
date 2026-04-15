import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/api/forum_common.pb.dart';
import 'package:xmus_client/api/forum_post.pb.dart';

import '../../foundation/platform/breakpoint.dart';
import '../../global.dart';
import 'post_card.dart';

/// Display a post list under specific parent post.
/// Used in bottom sheet to show 2nd level posts.
class PostList extends StatefulWidget {
  final Post parentPost;
  final ScrollController? scrollController;

  const PostList({super.key, required this.parentPost, this.scrollController});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  late final _pagingController = PagingController<int, Post>(
    getNextPageKey: (state) {
      final pages = state.pages;
      if (pages == null || pages.isEmpty) return 0;
      if (pages.last.length < 10) return null;
      return state.keys!.last + pages.last.length;
    },
    fetchPage: (pageKey) async {
      final resp = await rpc.forumClient.getPostsByParent(
        GetPostsByParentReq(
          parentId: widget.parentPost.id,
          ordering: Ordering.oldest,
          offset: pageKey,
          count: 10,
        ),
      );
      return resp.posts;
    },
  );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final parentPost = widget.parentPost;
    return PagingListener(
      controller: _pagingController,
      builder: (context, state, fetchNextPage) => CustomScrollView(
        controller: widget.scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: SingleBodyLayout(
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: PostCard(
                  threadId: parentPost.threadId,
                  post: parentPost,
                  onPostComment: _pagingController.refresh,
                ),
              ),
            ),
          ),
          PagedSliverList.separated(
            state: state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate<Post>(
              itemBuilder: (context, post, index) => SingleBodyLayout(
                child: PostCard(
                  threadId: post.threadId,
                  post: post,
                  onPostComment: _pagingController.refresh,
                ),
              ),
            ),
            separatorBuilder: (context, index) =>
                const SingleBodyLayout(child: Divider()),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 4,
            ),
          ),
        ],
      ),
    );
  }
}
