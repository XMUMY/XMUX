import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/generated/post.pb.dart';
import 'package:xmus_client/generated/reply.pb.dart';

import '../../../util/screen.dart';
import 'content_cards.dart';

class ReplyList extends StatelessWidget {
  final _pagingController = PagingController<int, Reply>(
    firstPageKey: 0,
  );
  final Future<List<Reply>> Function(int pageKey) getReplyFunc;
  final Future<void> Function(Reply)? onTap;
  final bool isSaved;

  ReplyList({Key? key, required this.getReplyFunc, this.onTap, this.isSaved = false})
      : super(key: key) {
    _pagingController.addPageRequestListener(_fetchPage);
  }

  void refresh() => _pagingController.refresh();

  void dispose() => _pagingController.dispose();

  Future<void> _fetchPage(int pageKey) async {
    // The default forum group has id 1
    final reply = await getReplyFunc(pageKey);
    if (reply.isNotEmpty) {
      _pagingController.appendPage(reply, pageKey + 1);
    } else {
      _pagingController.appendLastPage([Reply(id: -14514)]);
    }
  }

  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).toString();

    return PagedListView<int, Reply>(
      pagingController: _pagingController,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
      builderDelegate: PagedChildBuilderDelegate<Reply>(
        itemBuilder: (context, item, index) {
          if (item.id == -14514) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: Text('-----END-----',
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.center));
          }
          return ReplyCard(
            reply: item,
            locale: locale,
            onTap: () async {
              if (onTap != null) {
                await onTap!(item);
              }
            },
            isSaved: isSaved,
          );
        },
      ),
    );
  }
}
