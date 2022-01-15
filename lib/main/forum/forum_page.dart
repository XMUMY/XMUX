import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/generated/post.pb.dart';
import 'package:xmux/main/forum/thread.dart';
import 'package:xmux/util/screen.dart';

import '../../global.dart';
import '../main_page.dart';
import 'content_cards.dart';
import 'create_post.dart';

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

class _ForumPageState extends State<ForumPage>
    with SingleTickerProviderStateMixin {
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

  final _pagingController = PagingController<int, PostDetails>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    // The default forum group has id 1
    final resp = await rpc.forumClient
        .getPost(GetPostReq(pageNo: pageKey, pageSize: 10, groupIds: <int>[1]));
    final pd = resp.pd;
    if (pd.isNotEmpty) {
      _pagingController.appendPage(pd, pageKey + 1);
    } else {
      _pagingController.appendLastPage([PostDetails(id: -14514)]);
    }
  }

  Future<void> _handleRefresh() async {
    _pagingController.refresh();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Forum.Forum'.tr()),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: PagedListView<int, PostDetails>(
          pagingController: _pagingController,
          padding:
              EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
          builderDelegate: PagedChildBuilderDelegate<PostDetails>(
            itemBuilder: (context, item, index) {
              if (item.id == -14514) {
                return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('-----END-----',
                        style: Theme.of(context).textTheme.caption,
                        textAlign: TextAlign.center));
              }
              return PostBriefCard(
                postDetails: item,
                locale: locale,
                onTap: () async {
                  final shouldRefresh = await Navigator.of(context).push<bool>(
                    MaterialPageRoute(
                        builder: (context) => ThreadPage(postDetails: item)),
                  );
                  if (shouldRefresh ?? false) {
                    context
                        .findAncestorStateOfType<_ForumPageState>()
                        ?._pagingController
                        .refresh();
                  }
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: 'Forum.CreatePost'.tr(),
        onPressed: () async {
          final shouldRefresh = await Navigator.of(context).push<bool>(
            MaterialPageRoute(builder: (context) => const NewPostPage()),
          );
          if (shouldRefresh ?? false) {
            _pagingController.refresh();
          }
        },
      ),
    );
  }
}

String groupNameDecorationUtil(String groupName) {
  return 'g/$groupName';
}
