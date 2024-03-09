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

  const PostList({
    super.key,
    required this.parentPost,
    this.scrollController,
  });

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _pagingController = PagingController<int, Post>(firstPageKey: 0);

  Future<void> _fetchPage(int pageKey) async {
    final parentPost = widget.parentPost;
    final resp = await rpc.forumClient.getPostsByParent(GetPostsByParentReq(
      parentId: parentPost.id,
      ordering: Ordering.oldest,
      offset: pageKey,
      count: 10,
    ));
    if (!mounted) return;
    final posts = resp.posts;
    if (posts.length >= 10) {
      _pagingController.appendPage(posts, pageKey + posts.length);
    } else {
      _pagingController.appendLastPage(posts);
    }
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
    final parentPost = widget.parentPost;
    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: BodyPadding(
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
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Post>(
            itemBuilder: (context, post, index) => BodyPadding(
              child: PostCard(
                threadId: post.threadId,
                post: post,
                onPostComment: _pagingController.refresh,
              ),
            ),
          ),
          separatorBuilder: (context, index) => const BodyPadding(
            child: Divider(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 4,
          ),
        ),
      ],
    );
  }
}
