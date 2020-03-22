import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/components/user_profile.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/modules/api/models/v3_lost_and_found.dart';
import 'package:xmux/modules/api/models/v3_user.dart';
import 'package:xmux/modules/api/xmux_api.dart';

class LostAndFoundDetailPage extends StatelessWidget {
  final String id;
  final Profile profile;

  const LostAndFoundDetailPage({Key key, @required this.id, this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = Refreshable<LostAndFoundDetail>(
      onRefresh: () async =>
          (await XmuxApi.instance.lostAndFoundApi.getDetail(id)).data,
      builder: (context, detail) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shrinkWrap: true,
          children: <Widget>[
            if (profile == null)
              UserProfileBuilder(
                uid: detail.uid,
                builder: (context, profile) => Column(
                  children: <Widget>[
                    // Build user avatar.
                    Padding(
                      padding: const EdgeInsets.all(15),
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
                      ],
                    ),
                  ],
                ),
                loadingBuilder: (context) => Column(
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
                      ],
                    ),
                  ],
                ),
              ),

            Divider(color: Colors.transparent),
            // Details card.
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      detail.type == LostAndFoundType.lost
                          ? S.of(context).Campus_ToolsLFLost
                          : S.of(context).Campus_ToolsLFFound,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      detail.name,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Divider(height: 5, color: Colors.transparent),
                    Text(
                      S.of(context).Campus_ToolsLFTime,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      '${DateFormat.yMMMEd(Localizations.localeOf(context).languageCode).format(detail.timestamp)} ${DateFormat.Hm(Localizations.localeOf(context).languageCode).format(detail.timestamp)}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Divider(height: 5, color: Colors.transparent),
                    Text(
                      S.of(context).Campus_ToolsLFLocation,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      detail.location,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Divider(),
                    Text(detail.description),
                    if (detail.contacts?.isNotEmpty ?? false) ...[
                      Divider(),
                      Text(
                        S.of(context).Campus_ToolsLFContacts,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      for (var contact in detail.contacts.entries)
                        Text('${contact.key}  ${contact.value}'),
                    ]
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );

    if (profile != null)
      body = Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: UserAvatar(
              url: profile.avatar,
              radius: 30,
              heroTag: profile.hashCode.toString(),
            ),
          ),
          Text(profile.displayName),
          body,
        ],
      );

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Campus_ToolsLF),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
      ),
      body: body,
    );
  }
}
