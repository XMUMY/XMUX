import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/translations/translation.dart';

class HomeAnnouncements extends StatelessWidget {
  final List announcements;

  HomeAnnouncements(this.announcements);

  Widget _buildAnnouncement(BuildContext context, Map announcement) =>
      ExpansionTile(
        backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
        title: Text(
          announcement["headline"],
          style: Theme.of(context).textTheme.subhead,
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              announcement["detail"],
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          (announcement["uri"] as String).isEmpty
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    OutlineButton(
                      onPressed: announcement["isWebPage"]
                          ? () => launch(announcement["uri"])
                          : () => Navigator
                              .of(context)
                              .pushNamed(announcement["uri"]),
                      child: Text(MainLocalizations
                          .of(context)
                          .get("Home/Announcements/More")),
                    )
                  ],
                )
        ],
      );

  @override
  Widget build(BuildContext context) => announcements.isNotEmpty
      ? Card(
          margin: EdgeInsets.all(10.0),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  MainLocalizations.of(context).get("Home/Announcements"),
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
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        )
      : Container();
}
