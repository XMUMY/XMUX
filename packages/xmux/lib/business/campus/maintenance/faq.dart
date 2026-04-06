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
  final _pagingController = PagingController<int, FaqEntry>(
    firstPageKey: 1,
  );

  Future<void> _fetchPage(int pageKey) async {
    final resp = await Maintenance.getFaq(page: pageKey);
    if (!mounted) return;
    if (resp.isNotEmpty) {
      _pagingController.appendPage(resp, pageKey + 1);
    } else {
      _pagingController.appendLastPage([]);
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
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PagedListView<int, FaqEntry>(
      pagingController: _pagingController,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
      builderDelegate: PagedChildBuilderDelegate<FaqEntry>(
        itemBuilder: (context, faq, index) => Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  faq.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  DateFormat.yMMMd().format(faq.date),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Divider(),
                Text(faq.answer)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
