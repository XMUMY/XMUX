import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xmus_client/generated/lost_found.pb.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/components/lazy_loader.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/components/user_profile.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/main_app/campus/lost_and_found/detail.dart';

class LostAndFoundPage extends StatelessWidget {
  final _refreshableKey = GlobalKey<RefreshableState>();

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text(LocaleKeys.Campus_ToolsLF.tr()),
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).primaryColor
          : Colors.lightBlue,
    );

    var list = Refreshable<List<LostAndFoundBrief>>(
      key: _refreshableKey,
      onRefresh: () async =>
          (await rpc.lostAndFoundClient.getBriefs(GetBriefsReq())).briefs,
      builder: (context, _) => LazyLoader<List<LostAndFoundBrief>>(
        onLoadMore: (list) async {
          return true;
        },
        builder: (context, list) {
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => _ItemBriefCard(list[index]),
          );
        },
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: list,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var shouldRefresh = await Navigator.of(context)
              .pushNamed('/Campus/Tools/LostAndFound/New');
          if (shouldRefresh ?? false) _refreshableKey.currentState.refresh();
        },
        child: Icon(Icons.add),
        tooltip: LocaleKeys.Campus_ToolsLFNew.tr(),
      ),
    );
  }
}

class _ItemBriefCard extends StatelessWidget {
  final LostAndFoundBrief brief;
  final profileKey = GlobalKey<UserProfileBuilderState>();

  _ItemBriefCard(this.brief);

  @override
  Widget build(BuildContext context) {
    var languageCode = Localizations.localeOf(context).languageCode;

    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            UserProfileBuilder(
              key: profileKey,
              uid: brief.uid,
              builder: (context, profile) => Row(
                key: ValueKey(profile),
                children: <Widget>[
                  // Build user avatar.
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: UserAvatar(
                      url: profile.avatar,
                      heroTag: brief.hashCode.toString(),
                    ),
                  ),

                  // Build user name and timestamp.
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(profile.displayName),
                      Text(
                        '${DateFormat.yMMMEd(languageCode).format(brief.time.toDateTime().toLocal())} '
                        '${DateFormat.Hm(languageCode).format(brief.time.toDateTime().toLocal())}',
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                ],
              ),
              placeholder: (context) => Row(
                children: <Widget>[
                  // Build user avatar.
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: Shimmer.fromColors(
                      child: CircleAvatar(),
                      baseColor: Colors.black12,
                      highlightColor: Colors.white,
                    ),
                  ),

                  // Build user name and timestamp.
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Shimmer.fromColors(
                        child: Text('...'),
                        baseColor: Colors.black12,
                        highlightColor: Colors.white,
                      ),
                      Text(
                        '${DateFormat.yMMMEd(languageCode).format(brief.time.toDateTime().toLocal())} '
                        '${DateFormat.Hm(languageCode).format(brief.time.toDateTime().toLocal())}',
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                ],
              ),
            ),

            // Build price.
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                brief.type == LostAndFoundType.Lost
                    ? LocaleKeys.Campus_ToolsLFLost.tr()
                    : LocaleKeys.Campus_ToolsLFFound.tr(),
              ),
            ),
          ],
        ),

        // Build title.
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            '${brief.name}\n'
            '${LocaleKeys.Campus_ToolsLFLocation.tr()} ${brief.location}',
          ),
        ),
      ],
    );

    return FloatingCard(
      onTap: () async {
        var shouldRefresh =
            await Navigator.of(context).push<bool>(MaterialPageRoute(
          builder: (_) => LostAndFoundDetailPage(
            brief: brief,
            profile: profileKey.currentState.profile,
          ),
        ));
        if (shouldRefresh ?? false)
          context
              .findAncestorWidgetOfExactType<LostAndFoundPage>()
              ._refreshableKey
              .currentState
              .refresh();
      },
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(),
      child: content,
    );
  }
}
