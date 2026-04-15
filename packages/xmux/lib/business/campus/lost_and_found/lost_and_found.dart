import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';
import 'package:xmus_client/api/lost_found/v4/lost_found.pb.dart';

import '../../../component/floating_card.dart';
import '../../../component/gravatar.dart';
import '../../../component/user_profile.dart';
import '../../../foundation/localization/locale_keys.dart';
import '../../../foundation/platform/breakpoint.dart';
import '../../../global.dart';
import 'create.dart';
import 'detail.dart';

class LostAndFoundPage extends StatefulWidget {
  const LostAndFoundPage({super.key});

  @override
  State<LostAndFoundPage> createState() => _LostAndFoundPageState();
}

class _LostAndFoundPageState extends State<LostAndFoundPage> {
  late final PagingController<Timestamp, LostAndFoundBrief> _pagingController =
      PagingController<Timestamp, LostAndFoundBrief>(
        getNextPageKey: (state) {
          final pages = state.pages;
          if (pages == null || pages.isEmpty) return Timestamp();
          if (pages.last.isEmpty) return null;
          return pages.last.last.time;
        },
        fetchPage: (pageKey) async {
          final resp = await rpc.lostAndFoundClient.getBriefs(
            GetBriefsReq(before: pageKey.seconds == 0 ? null : pageKey),
          );
          return resp.briefs;
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
      appBar: AppBar(title: Text(LocaleKeys.Campus_LaF.tr())),
      body: PagingListener(
        controller: _pagingController,
        builder: (context, state, fetchNextPage) =>
            PagedListView<Timestamp, LostAndFoundBrief>(
              state: state,
              fetchNextPage: fetchNextPage,
              padding: context.padListView,
              builderDelegate: PagedChildBuilderDelegate<LostAndFoundBrief>(
                itemBuilder: (context, item, index) =>
                    _ItemBriefCard(brief: item),
              ),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: LocaleKeys.Campus_LaFNew.tr(),
        onPressed: () async {
          final shouldRefresh = await Navigator.of(context).push<bool>(
            MaterialPageRoute(
              builder: (context) => const NewLostAndFoundPage(),
            ),
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
                      ),
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
            builder: (context) => LostAndFoundDetailPage(brief: brief),
          ),
        );
        if (context.mounted && (shouldRefresh ?? false)) {
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
