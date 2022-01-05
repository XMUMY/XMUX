import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/generated/lost_found.pb.dart';
import 'package:xmus_client/generated/post.pb.dart';
import 'package:xmux/component/floating_card.dart';
import 'package:xmux/component/user_profile.dart';
import 'package:xmux/main/campus/lost_and_found/create.dart';
import 'package:xmux/main/campus/lost_and_found/detail.dart';
import 'package:xmux/util/screen.dart';

import '../../global.dart';
import '../main_page.dart';


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

  final _pagingController = PagingController<int, LostAndFoundBrief>(
    firstPageKey: 1,
  );

  Future<void> _fetchPage(int pageKey) async {
    final resp = await rpc.lostAndFoundClient
        .getBriefs(GetBriefsReq(before: _pagingController.itemList?.last.time));
    final briefs = resp.briefs;
    if (briefs.isNotEmpty) {
      _pagingController.appendPage(briefs, pageKey + briefs.length);
    } else {
      _pagingController.appendLastPage([]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Campus_LaF.tr()),
      ),
      body: PagedListView<int, LostAndFoundBrief>(
        pagingController: _pagingController,
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
        builderDelegate: PagedChildBuilderDelegate<LostAndFoundBrief>(
          itemBuilder: (context, item, index) => _ItemBriefCard(brief: item),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: LocaleKeys.Campus_LaFNew.tr(),
        onPressed: () async {
          final shouldRefresh = await Navigator.of(context).push<bool>(
            MaterialPageRoute(
                builder: (context) => const NewLostAndFoundPage()),
          );
          if (shouldRefresh ?? false) {
            _pagingController.refresh();
          }
        },
      ),
    );
  }
}

class _ItemBriefCard extends StatelessWidget {
  final LostAndFoundBrief brief;

  const _ItemBriefCard({Key? key, required this.brief}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            UserProfileBuilder(
              uid: brief.uid,
              builder: (context, profile) => Row(
                key: ValueKey(profile),
                children: <Widget>[
                  // Build user avatar.
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Hero(
                      tag: brief.hashCode,
                      child: CircleAvatar(
                        child: ExtendedImage.network(
                          profile.avatar,
                          shape: BoxShape.circle,
                        ),
                        radius: 20,
                      ),
                    ),
                  ),

                  // Build user name and timestamp.
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(profile.displayName),
                      Text(
                        '${DateFormat.yMMMEd().format(brief.time.toDateTime().toLocal())} '
                            '${DateFormat.Hm().format(brief.time.toDateTime().toLocal())}',
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                ],
              ),
              placeholder: (context) => const Text('  ...  '),
            ),

            // Build price.
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                brief.type == LostAndFoundType.Lost
                    ? LocaleKeys.Campus_LaFLost.tr()
                    : LocaleKeys.Campus_LaFFound.tr(),
              ),
            ),
          ],
        ),

        // Build title.
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            '${brief.name}\n'
                '${LocaleKeys.Campus_LaFLocation.tr()} ${brief.location}',
          ),
        ),
      ],
    );

    return FloatingCard(
      onTap: () async {
        final shouldRefresh = await Navigator.of(context).push<bool>(
          MaterialPageRoute(
              builder: (context) => LostAndFoundDetailPage(brief: brief)),
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