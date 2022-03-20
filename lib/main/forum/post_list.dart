import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/generated/forum_common.pb.dart';
import 'package:xmus_client/generated/forum_post.pb.dart';
import 'package:xmus_client/generated/forum_thread.pb.dart';

import '../../global.dart';
import '../../util/screen.dart';
import 'post_card.dart';

/// Display a post list under specific parent post.
/// Used in bottom sheet to show 2nd level posts.
class PostList extends StatefulWidget {
  final Thread thread;
  final Post parentPost;
  final ScrollController? scrollController;

  const PostList({
    Key? key,
    required this.thread,
    required this.parentPost,
    this.scrollController,
  }) : super(key: key);

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
    final thread = widget.thread;
    final parentPost = widget.parentPost;
    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: BodyPadding(
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: PostCard(
                thread: thread,
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
                thread: widget.thread,
                post: post,
                onPostComment: _pagingController.refresh,
              ),
            ),
          ),
          separatorBuilder: (context, index) => const BodyPadding(
            child: Divider(),
          ),
        ),
      ],
    );
  }
}
