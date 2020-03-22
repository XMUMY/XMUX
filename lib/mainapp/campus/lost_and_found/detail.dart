import 'package:flutter/material.dart';
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

            // Details card.
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '',
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    new Divider(),
                    Text('Contact: ${detail.uid}@xmu.edu.my'),
                    new Divider(),
                    new Text(detail.description),
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
