import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/components/page_routes.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/components/user_profile.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/mainapp/campus/lost_and_found/detail.dart';
import 'package:xmux/modules/api/models/v3_lost_and_found.dart';
import 'package:xmux/modules/api/xmux_api.dart';

class LostAndFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Campus_ToolsLF),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
      ),
      body: LostAndFoundList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed('/Campus/Tools/LostAndFound/New'),
        child: Icon(Icons.add),
        tooltip: S.of(context).Campus_ToolsLFNew,
      ),
    );
  }
}

class LostAndFoundList extends StatefulWidget {
  @override
  _LostAndFoundListState createState() => _LostAndFoundListState();
}

class _LostAndFoundListState extends State<LostAndFoundList> {
  var refreshableKey = GlobalKey<RefreshableState>();

  @override
  Widget build(BuildContext context) {
    return Refreshable<List<LostAndFoundBrief>>(
      key: refreshableKey,
      onRefresh: () async =>
          (await XmuxApi.instance.lostAndFoundApi.getBriefs()).data,
      builder: (context, list) {
        return ListView(
          children: list.map((e) => _ItemBriefCard(e)).toList(),
        );
      },
    );
  }
}

class _ItemBriefCard extends StatefulWidget {
  final LostAndFoundBrief brief;

  const _ItemBriefCard(this.brief);

  @override
  _ItemBriefCardState createState() => _ItemBriefCardState();
}

class _ItemBriefCardState extends State<_ItemBriefCard> {
  @override
  Widget build(BuildContext context) {
    return FloatingCard(
      onTap: () => Navigator.of(context).push(
          FadePageRoute(child: LostAndFoundDetailPage(id: widget.brief.id))),
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      shape: RoundedRectangleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                UserProfileBuilder(
                  uid: widget.brief.uid,
                  builder: (context, profile) => Row(
                    children: <Widget>[
                      // Build user avatar.
                      Padding(
                        padding: const EdgeInsets.all(13),
                        child: UserAvatar(url: profile.avatar),
                      ),

                      // Build user name and timestamp.
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(profile.displayName),
                          Text(
                            '${DateFormat.yMMMEd(Localizations.localeOf(context).languageCode).format(widget.brief.timestamp)} ${DateFormat.Hm(Localizations.localeOf(context).languageCode).format(widget.brief.timestamp)}',
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                    ],
                  ),
                  loadingBuilder: (context) => Row(
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
                            '${DateFormat.Md(Localizations.localeOf(context).languageCode).format(widget.brief.timestamp)} ${DateFormat.Hm(Localizations.localeOf(context).languageCode).format(widget.brief.timestamp)}',
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
                    widget.brief.type == LostAndFoundType.lost
                        ? S.of(context).Campus_ToolsLFLost
                        : S.of(context).Campus_ToolsLFFound,
                  ),
                ),
              ],
            ),

            // Build title.
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                '${widget.brief.name}\n'
                '${S.of(context).Campus_ToolsLFLocation} ${widget.brief.location}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
