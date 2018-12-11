import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/main.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(i18n('Settings', context)),
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'UserAvatar',
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(xmuxApi.convertAvatarUrl(
                        firebaseUser?.photoUrl,
                        store.state.authState.moodleKey)),
                    radius: 30.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Text(firebaseUser?.displayName ?? 'User'),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            ),
            Divider(),
            ListTile(
              leading: Text(i18n('Settings/ChangeProfile', context)),
              onTap: () =>
                  Navigator.of(context).pushNamed('/Settings/ChangeProfile'),
            ),
            ListTile(
              leading: Text(i18n('Settings/DeveloperOptions', context)),
              onTap: () =>
                  Navigator.of(context).pushNamed('/Settings/DeveloperOptions'),
            ),
            Divider(),
            FlatButton(
              color: Theme.of(context).splashColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(i18n('Settings/SignOut', context)),
                  Icon(Icons.exit_to_app),
                ],
              ),
              onPressed: signOut,
            ),
          ],
        ),
      );
}
