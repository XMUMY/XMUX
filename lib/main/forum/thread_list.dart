import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/generated/forum_common.pb.dart';
import 'package:xmus_client/generated/forum_thread.pb.dart';

import '../../global.dart';
import '../../util/screen.dart';
import 'new_thread.dart';
import 'thread_card.dart';

class ThreadList extends StatefulWidget {
  final int forumId;

  const ThreadList({super.key, required this.forumId});

  @override
  State<ThreadList> createState() => _ThreadListState();
}

class _ThreadListState extends State<ThreadList> {
  final _pagingController = PagingController<int, Thread>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    final resp = await rpc.forumClient.getThreads(GetThreadsReq(
      forumId: 1,
      ordering: Ordering.update,
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
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => _pagingController.refresh(),
        child: PagedListView<int, Thread>(
          padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: context.padBody,
          ),
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Thread>(
            itemBuilder: (context, thread, index) => Hero(
              tag: thread.id,
              child: ThreadCard(thread: thread),
            ),
            noItemsFoundIndicatorBuilder: (context) => const SizedBox(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: LocaleKeys.Community_CreateThreadTitle.tr(),
        onPressed: () async {
          final shouldRefresh = await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const NewThreadPage(forumId: 1)),
          );
          if (shouldRefresh ?? false) {
            _pagingController.refresh();
          }
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
