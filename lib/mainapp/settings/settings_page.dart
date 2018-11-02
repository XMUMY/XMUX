import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/main.dart';
import 'package:xmux/translations/translation.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MainLocalizations.of(context).get("Settings")),
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: "UserAvatar",
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(firebaseUser?.photoUrl ?? ""),
                    radius: 30.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Text(firebaseUser?.displayName ?? "User"),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            ),
            Divider(),
            ListTile(
              leading: Text(MainLocalizations.of(context)
                  .get("Settings/ChangePersonalInfo")),
              onTap: () => Navigator.of(context)
                  .pushNamed("/Settings/ChangePersonalInfo"),
            ),
            ListTile(
              leading: Text(MainLocalizations.of(context)
                  .get("Settings/DeveloperOptions")),
              onTap: () =>
                  Navigator.of(context).pushNamed("/Settings/DeveloperOptions"),
            ),
            Divider(),
            FlatButton(
              color: Theme.of(context).splashColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(MainLocalizations.of(context).get("Settings/SignOut")),
                  Icon(Icons.exit_to_app),
                ],
              ),
              onPressed: signOut,
            ),
          ],
        ),
      );
}
