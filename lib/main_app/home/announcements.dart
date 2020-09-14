import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/rpc/clients/news.pb.dart';

class HomeAnnouncements extends StatelessWidget {
  final List<Announcement> announcements;

  HomeAnnouncements(this.announcements);

  Widget _buildAnnouncement(BuildContext context, Announcement announcement) {
    var languageCode = Localizations.localeOf(context).languageCode;
    Announcement_Translation translation;
    if (announcement.translations.containsKey(languageCode))
      translation = announcement.translations[languageCode];
    else
      translation = announcement.translations.values.first;

    return ExpansionTile(
      backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
      title: Text(
        translation.title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            translation.text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
                      .format(announcement.releaseDate.toDateTime().toLocal()) +
                  " " +
                  DateFormat.Hms(Localizations.localeOf(context).languageCode)
                      .format(announcement.releaseDate.toDateTime().toLocal()),
              style: Theme.of(context).textTheme.caption,
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
          ],
        ),
      ],
    );
  }

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
                      style: Theme.of(context).textTheme.headline5,
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
