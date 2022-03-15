import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/generated/forum_common.pb.dart';
import 'package:xmus_client/generated/forum_thread.pb.dart';

import '../../global.dart';
import '../../util/screen.dart';
import 'new_thread.dart';
import 'thread_card.dart';

/// The discover tab. Currently use forum 0.
class DiscoverTab extends StatefulWidget {
  const DiscoverTab({Key? key}) : super(key: key);

  @override
  State<DiscoverTab> createState() => _DiscoverTabState();
}

class _DiscoverTabState extends State<DiscoverTab>
    with AutomaticKeepAliveClientMixin {
  final _pagingController = PagingController<int, Thread>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    final resp = await rpc.forumClient.getThreads(GetThreadsReq(
      forumId: 1,
      ordering: Ordering.latest,
      offset: pageKey,
      count: 10,
    ));
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
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: PagedListView<int, Thread>(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Thread>(
          itemBuilder: (context, thread, index) => ThreadCard(thread: thread),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        tooltip: LocaleKeys.Community_CreateThreadTitle.tr(),
        onPressed: () async {
          final shouldRefresh = await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const NewThreadPage(forumId: 1)),
          );
          if (shouldRefresh ?? false) {
            _pagingController.refresh();
          }
        },
      ),
    );
  }
}
