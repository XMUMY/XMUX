import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:xmus_client/api/lost_found.pb.dart';

import '../../../component/floating_card.dart';
import '../../../component/gravatar.dart';
import '../../../component/user_profile.dart';
import '../../../global.dart';
import '../../../util/screen.dart';
import 'create.dart';
import 'detail.dart';

class LostAndFoundPage extends StatefulWidget {
  const LostAndFoundPage({super.key});

  @override
  State<LostAndFoundPage> createState() => _LostAndFoundPageState();
}

class _LostAndFoundPageState extends State<LostAndFoundPage> {
  final _pagingController = PagingController<int, LostAndFoundBrief>(
    firstPageKey: 1,
  );

  Future<void> _fetchPage(int pageKey) async {
    final resp = await rpc.lostAndFoundClient
        .getBriefs(GetBriefsReq(before: _pagingController.itemList?.last.time));
    final briefs = resp.briefs;
    if (!mounted) return;
    if (briefs.isNotEmpty) {
      _pagingController.appendPage(briefs, pageKey + briefs.length);
    } else {
      _pagingController.appendLastPage([]);
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
      appBar: AppBar(
        title: Text(LocaleKeys.Campus_LaF.tr()),
      ),
      body: PagedListView<int, LostAndFoundBrief>(
        pagingController: _pagingController,
        padding: context.padListView,
        builderDelegate: PagedChildBuilderDelegate<LostAndFoundBrief>(
          itemBuilder: (context, item, index) => _ItemBriefCard(brief: item),
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ItemBriefCard extends StatelessWidget {
  final LostAndFoundBrief brief;

  const _ItemBriefCard({required this.brief});

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
                      child: Gravatar(
                        url: profile.avatar,
                        fallbackName: profile.displayName,
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
                        style: Theme.of(context).textTheme.bodySmall,
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
              .findAncestorStateOfType<_LostAndFoundPageState>()
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
