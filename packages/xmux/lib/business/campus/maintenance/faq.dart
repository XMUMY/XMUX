import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:maintenance/maintenance.dart';

import '../../../foundation/platform/breakpoint.dart';

class FaqList extends StatefulWidget {
  const FaqList({super.key});

  @override
  State<FaqList> createState() => _FaqListState();
}

class _FaqListState extends State<FaqList> with AutomaticKeepAliveClientMixin {
  late final _pagingController = PagingController<int, FaqEntry>(
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) async {
      return await Maintenance.getFaq(page: pageKey);
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
          PagedListView<int, FaqEntry>(
        state: state,
        fetchNextPage: fetchNextPage,
        padding:
            EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
        builderDelegate: PagedChildBuilderDelegate<FaqEntry>(
          itemBuilder: (context, faq, index) => Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(faq.title,
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(
                    DateFormat.yMMMd().format(faq.date),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Divider(),
                  Text(faq.answer),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
