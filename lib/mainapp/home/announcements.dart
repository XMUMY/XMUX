import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/translations/translation.dart';

class HomeAnnouncements extends StatelessWidget {
  final List<Announcement> announcements;

  HomeAnnouncements(this.announcements);

  Widget _buildAnnouncement(BuildContext context, Announcement announcement) =>
      ExpansionTile(
        backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
        title: Text(
          announcement.headline,
          style: Theme.of(context).textTheme.subhead,
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              announcement.detail,
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
                        .format(announcement.timestamp) +
                    " " +
                    DateFormat.Hms(Localizations.localeOf(context).languageCode)
                        .format(announcement.timestamp),
                style: Theme.of(context).textTheme.caption,
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              announcement.uri.isEmpty
                  ? Container()
                  : OutlineButton(
                      onPressed: () => launch(announcement.uri),
                      child: Text(MainLocalizations.of(context)
                          .get("Home/Announcements/More")),
                    )
            ],
          ),
        ],
      );

  @override
  Widget build(BuildContext context) =>
      (announcements != null && announcements.isNotEmpty)
          ? Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      i18n("Home/Announcements", context),
                      style: Theme.of(context).textTheme.headline,
                    ),
                    Divider(),
                    Column(
                      children: announcements
                          .map((_) => _buildAnnouncement(context, _))
                          .toList(),
                    ),
                  ],
                ),
              ),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            )
          : Container();
}
