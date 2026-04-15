import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/api/forum.pb.dart';

import '../../component/floating_card.dart';
import '../../component/tab.dart';
import '../../foundation/localization/locale_keys.dart';
import '../../foundation/platform/breakpoint.dart';
import '../../global.dart';

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
  late final _pagingController = PagingController<int, ForumDetail>(
    getNextPageKey: (state) {
      final pages = state.pages;
      if (pages == null || pages.isEmpty) return 0;
      if (pages.last.length < 10) return null;
      return state.keys!.last + pages.last.length;
    },
    fetchPage: (pageKey) async {
      final resp = await rpc.forumClient.getForums(GetForumsReq(count: 10));
      return resp.forums;
    },
  );

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PagingListener(
      controller: _pagingController,
      builder: (context, state, fetchNextPage) =>
          PagedListView<int, ForumDetail>(
            primary: false,
            padding: EdgeInsets.symmetric(
              vertical: 4,
              horizontal: context.padBody,
            ),
            state: state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate<ForumDetail>(
              itemBuilder: (context, forum, index) =>
                  FloatingCard(child: Text(forum.title), onTap: () {}),
              noItemsFoundIndicatorBuilder: (context) => const SizedBox(),
            ),
          ),
    );
  }
}
