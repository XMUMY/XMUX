import 'package:flutter/material.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n('Settings', context)),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'UserAvatar',
                child: CircleAvatar(
                  backgroundImage: NetworkImage(XMUXApi.convertAvatarUrl(
                      firebaseUser?.photoUrl, store.state.user.moodleKey)),
                  radius: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Text(firebaseUser?.displayName ?? 'User'),
              Padding(
                padding: EdgeInsets.all(5),
              ),
            ],
          ),
          Divider(),
          ListTile(
            title: Text(i18n('Settings/ChangeProfile', context)),
            onTap: () =>
                Navigator.of(context).pushNamed('/Settings/ChangeProfile'),
          ),
          ListTile(
            title: Text(S.of(context).Settings_Sessions),
            onTap: () => Navigator.of(context).pushNamed('/Settings/Sessions'),
          ),
          ListTile(
            title: Text(i18n('Settings/DeveloperOptions', context)),
            onTap: () =>
                Navigator.of(context).pushNamed('/Settings/DeveloperOptions'),
          ),
          ListTile(
            title: Text(i18n('About', context)),
            onTap: () => Navigator.of(context).pushNamed('/About'),
          ),
          Divider(),
          RaisedButton.icon(
            label: Text(i18n('Settings/SignOut', context)),
            icon: Icon(Icons.exit_to_app),
            onPressed: logout,
          ),
        ],
      ),
    );
  }
}
