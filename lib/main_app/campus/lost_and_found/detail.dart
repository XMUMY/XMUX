import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/components/user_profile.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/api/xmux_api.dart';

class LostAndFoundDetailPage extends StatelessWidget {
  final LostAndFoundBrief brief;
  final Profile profile;

  const LostAndFoundDetailPage({Key key, @required this.brief, this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = Refreshable<LostAndFoundDetail>(
      onRefresh: () async =>
          (await XmuxApi.instance.lostAndFoundApi.getDetail(brief.id)).data,
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
                        heroTag: brief.hashCode.toString(),
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
            if (profile == null) Divider(color: Colors.transparent),
            // Details card.
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      detail.type == LostAndFoundType.lost
                          ? LocaleKeys.Campus_ToolsLFLost.tr()
                          : LocaleKeys.Campus_ToolsLFFound.tr(),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      detail.name,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Divider(height: 5, color: Colors.transparent),
                    Text(
                      LocaleKeys.Campus_ToolsLFTime.tr(),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      '${DateFormat.yMMMEd(Localizations.localeOf(context).languageCode).format(detail.timestamp)} ${DateFormat.Hm(Localizations.localeOf(context).languageCode).format(detail.timestamp)}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Divider(height: 5, color: Colors.transparent),
                    Text(
                      LocaleKeys.Campus_ToolsLFLocation.tr(),
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
                        LocaleKeys.Campus_ToolsLFContacts.tr(),
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
      firstLoadingIndicator: SpinKitWave(color: Colors.black38, size: 20),
    );

    if (profile != null)
      body = Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: UserAvatar(
              url: profile.avatar,
              radius: 30,
              heroTag: brief.hashCode.toString(),
            ),
          ),
          Text(profile.displayName),
          Divider(color: Colors.transparent),
          body,
        ],
      );

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Campus_ToolsLF.tr()),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
        actions: <Widget>[
          if (brief.uid == store.state.user.campusId)
            IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: () async {
                await XmuxApi.instance.lostAndFoundApi.delete(brief.id);
                Navigator.of(context).pop(true);
              },
            ),
        ],
      ),
      body: body,
    );
  }
}
