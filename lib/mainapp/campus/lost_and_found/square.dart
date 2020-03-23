import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/components/user_profile.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/mainapp/campus/lost_and_found/detail.dart';
import 'package:xmux/modules/api/models/v3_lost_and_found.dart';
import 'package:xmux/modules/api/xmux_api.dart';

class LostAndFoundPage extends StatefulWidget {
  @override
  _LostAndFoundPageState createState() => _LostAndFoundPageState();
}

class _LostAndFoundPageState extends State<LostAndFoundPage> {
  var refreshableKey = GlobalKey<RefreshableState<List<LostAndFoundBrief>>>();
  var listController = ScrollController();

  @override
  void initState() {
    // TODO: Abstraction of AnimatedList.
    listController.addListener(() async {
      if (listController.position.extentAfter == 0) {
        await refreshableKey.currentState
            .showLoadingIndicator(Future.delayed(Duration(seconds: 2)));
        refreshableKey.currentState.data
            .addAll(refreshableKey.currentState.data.toList());
        setState(() {
          listController.animateTo(listController.offset + 50,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut);
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Campus_ToolsLF),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
      ),
      body: Refreshable<List<LostAndFoundBrief>>(
        key: refreshableKey,
        onRefresh: () async =>
            (await XmuxApi.instance.lostAndFoundApi.getBriefs()).data,
        builder: (context, briefs) {
          return ListView.builder(
            controller: listController,
            itemCount: briefs.length,
            itemBuilder: (context, i) => AnimationConfiguration.staggeredList(
              position: i,
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: _ItemBriefCard(briefs[i]),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var shouldRefresh = await Navigator.of(context)
              .pushNamed('/Campus/Tools/LostAndFound/New');
          if (shouldRefresh ?? false) refreshableKey.currentState.refresh();
        },
        child: Icon(Icons.add),
        tooltip: S.of(context).Campus_ToolsLFNew,
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
              .findAncestorStateOfType<_LostAndFoundPageState>()
              .refreshableKey
              .currentState
              .refresh();
      },
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
                  key: profileKey,
                  uid: brief.uid,
                  builder: (context, profile) => Row(
                    children: <Widget>[
                      // Build user avatar.
                      Padding(
                        padding: const EdgeInsets.all(13),
                        child: UserAvatar(
                          url: profile.avatar,
                          heroTag: profile.hashCode.toString(),
                        ),
                      ),

                      // Build user name and timestamp.
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(profile.displayName),
                          Text(
                            '${DateFormat.yMMMEd(Localizations.localeOf(context).languageCode).format(brief.timestamp)} ${DateFormat.Hm(Localizations.localeOf(context).languageCode).format(brief.timestamp)}',
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
                            '${DateFormat.Md(Localizations.localeOf(context).languageCode).format(brief.timestamp)} ${DateFormat.Hm(Localizations.localeOf(context).languageCode).format(brief.timestamp)}',
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
                    brief.type == LostAndFoundType.lost
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
                '${brief.name}\n'
                '${S.of(context).Campus_ToolsLFLocation} ${brief.location}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
