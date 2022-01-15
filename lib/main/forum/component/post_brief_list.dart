import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/generated/post.pb.dart';

import '../../../util/screen.dart';
import 'content_cards.dart';

class PostBriefList extends StatelessWidget {
  final _pagingController = PagingController<int, PostDetails>(
    firstPageKey: 0,
  );
  final Future<List<PostDetails>> Function(int pageKey) getPostFunc;
  final Future<void> Function(PostDetails)? onTap;

  PostBriefList({Key? key, required this.getPostFunc, this.onTap})
      : super(key: key) {
    _pagingController.addPageRequestListener(_fetchPage);
  }

  void refresh() => _pagingController.refresh();

  void dispose() => _pagingController.dispose();

  Future<void> _fetchPage(int pageKey) async {
    // The default forum group has id 1
    final pd = await getPostFunc(pageKey);
    if (pd.isNotEmpty) {
      _pagingController.appendPage(pd, pageKey + 1);
    } else {
      _pagingController.appendLastPage([PostDetails(id: -14514)]);
    }
  }

  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).toString();

    return PagedListView<int, PostDetails>(
      pagingController: _pagingController,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
      builderDelegate: PagedChildBuilderDelegate<PostDetails>(
        itemBuilder: (context, item, index) {
          if (item.id == -14514) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: Text('-----END-----',
                    style: Theme
                        .of(context)
                        .textTheme
                        .caption,
                    textAlign: TextAlign.center));
          }
          return PostBriefCard(
            postDetails: item,
            locale: locale,
            onTap: () async {
              if (onTap != null) {
                await onTap!(item);
              }
            },
          );
        },
      ),
    );
  }
}
