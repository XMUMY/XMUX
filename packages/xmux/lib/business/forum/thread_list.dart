import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/api/forum_common.pb.dart';
import 'package:xmus_client/api/forum_thread.pb.dart';

import '../../foundation/localization/locale_keys.dart';
import '../../foundation/platform/breakpoint.dart';
import '../../global.dart';
import 'new_thread.dart';
import 'thread_card.dart';

class ThreadList extends StatefulWidget {
  final int forumId;

  const ThreadList({super.key, required this.forumId});

  @override
  State<ThreadList> createState() => _ThreadListState();
}

class _ThreadListState extends State<ThreadList> {
  late final _pagingController = PagingController<int, Thread>(
    getNextPageKey: (state) {
      final pages = state.pages;
      if (pages == null || pages.isEmpty) return 0;
      if (pages.last.length < 10) return null;
      return state.keys!.last + pages.last.length;
    },
    fetchPage: (pageKey) async {
      final resp = await rpc.forumClient.getThreads(
        GetThreadsReq(
          forumId: 1,
          ordering: Ordering.update,
          offset: pageKey,
          count: 10,
        ),
      );
      return resp.threads;
    },
  );

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
        child: SingleBodyLayout(
          child: PagingListener(
            controller: _pagingController,
            builder: (context, state, fetchNextPage) =>
                PagedListView<int, Thread>(
                  padding: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: context.padBody,
                  ),
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: PagedChildBuilderDelegate<Thread>(
                    itemBuilder: (context, thread, index) => Hero(
                      tag: thread.id,
                      child: ThreadCard(thread: thread),
                    ),
                    noItemsFoundIndicatorBuilder: (context) => const SizedBox(),
                  ),
                ),
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
