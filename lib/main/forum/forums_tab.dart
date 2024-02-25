import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/generated/forum.pb.dart';

import '../../component/floating_card.dart';
import '../../global.dart';
import '../../util/screen.dart';
import '../../util/tab.dart';

class ForumsTab extends StatefulWidget implements TabEntry {
  const ForumsTab({super.key});

  @override
  String get path => 'Forums';

  @override
  String get label => LocaleKeys.Community_Forums.tr();

  @override
  State<ForumsTab> createState() => _ForumsTabState();
}

class _ForumsTabState extends State<ForumsTab>
    with AutomaticKeepAliveClientMixin {
  final _pagingController = PagingController<int, ForumDetail>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    final resp = await rpc.forumClient.getForums(GetForumsReq(count: 10));
    if (!mounted) return;
    if (resp.forums.isNotEmpty && resp.forums.length >= 10) {
      _pagingController.appendPage(resp.forums, pageKey + resp.forums.length);
    } else {
      _pagingController.appendLastPage(resp.forums);
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
  Widget build(BuildContext context) {
    super.build(context);
    return PagedListView<int, ForumDetail>(
      primary: false,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<ForumDetail>(
        itemBuilder: (context, forum, index) => FloatingCard(
          child: Text(forum.title),
          onTap: () {},
        ),
        noItemsFoundIndicatorBuilder: (context) => const SizedBox(),
      ),
    );
  }
}
