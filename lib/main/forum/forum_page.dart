import 'package:easy_localization/easy_localization.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/generated/post.pb.dart';
import 'package:xmux/component/floating_card.dart';
import 'package:xmux/component/user_profile.dart';
import 'package:xmux/util/screen.dart';

import '../../global.dart';
import '../main_page.dart';
import 'create_post.dart';
import 'thread.dart';

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
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _pagingController = PagingController<int, PostDetails>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    // TODO: Change this API to personal feed
    final resp = await rpc.forumClient
        .getPost(GetPostReq(pageNo: pageKey, pageSize: 10, groupIds: <int>[1]));
    final pd = resp.pd;
    if (pd.isNotEmpty) {
      _pagingController.appendPage(pd, pageKey + 1);
    } else {
      _pagingController.appendLastPage([PostDetails(id: -14514)]);
    }
  }

  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Forum.Forum'.tr()),
      ),
      body: PagedListView<int, PostDetails>(
        pagingController: _pagingController,
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
        builderDelegate: PagedChildBuilderDelegate<PostDetails>(
          itemBuilder: (context, item, index) {
            if (item.id == -14514) {
              return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('-----END-----',
                      style: Theme.of(context).textTheme.caption,
                      textAlign: TextAlign.center));
            }
            return _PostBriefCard(
              postDetails: item,
              locale: locale,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: 'Create post'.tr(),
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

class _PostBriefCard extends StatelessWidget {
  final PostDetails postDetails;
  final String locale;

  const _PostBriefCard(
      {Key? key, required this.postDetails, required this.locale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            UserProfileBuilder(
              uid: postDetails.uid,
              builder: (context, profile) => Row(
                key: ValueKey(profile),
                children: <Widget>[
                  // Build user avatar.
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      child: ExtendedImage.network(
                        profile.avatar,
                        shape: BoxShape.circle,
                      ),
                      radius: 20,
                    ),
                  ),

                  // Build user name and timestamp.
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(profile.displayName),
                      Text(
                        '${'Updated'.tr()} ${timeUtil(postDetails.updateTime.toDateTime(), locale)}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ],
              ),
              placeholder: (context) => const Text('  ...  '),
            ),

            // Special attributes of post.
            if (postDetails.topped)
              const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.push_pin_rounded,
                  color: Colors.lightGreen,
                ),
              ),
            if (postDetails.best && !postDetails.topped)
              const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.star,
                  color: Colors.lightBlueAccent,
                ),
              ),
          ],
        ),

        // Build title.
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(postDetails.title,
              style: Theme.of(context).textTheme.titleMedium),
        ),
      ],
    );

    return FloatingCard(
      onTap: () async {
        final shouldRefresh = await Navigator.of(context).push<bool>(
          MaterialPageRoute(
              builder: (context) => ThreadPage(postDetails: postDetails)),
        );
        if (shouldRefresh ?? false) {
          context
              .findAncestorStateOfType<_ForumPageState>()
              ?._pagingController
              .refresh();
        }
      },
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(5),
      child: content,
    );
  }
}

String groupNameDecorationUtil(String groupName) {
  return 'g/$groupName';
}

String timeUtil(DateTime date, String locale) {
  locale = locale.substring(0, 2);
  return timeago.format(date, locale: locale, allowFromNow: true);
}
