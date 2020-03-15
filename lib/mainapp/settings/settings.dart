import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/firebase/firebase.dart';
import 'package:xmux/redux/redux.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Settings),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'UserAvatar',
                child: StoreConnector<MainAppState, String>(
                  converter: (s) => s.state.user.profile?.avatar ?? '',
                  builder: (context, s) => CircleAvatar(
                    backgroundImage: NetworkImage(s),
                    radius: 30,
                  ),
                ),
              ),
              Divider(height: 5, color: Colors.transparent),
              StoreConnector<MainAppState, String>(
                converter: (s) => s.state.user.profile?.displayName ?? 'User',
                builder: (context, s) => Text(s),
              ),
              Divider(height: 5, color: Colors.transparent)
            ],
          ),
          Divider(),
          ListTile(
            title: Text(S.of(context).Settings_EditProfile),
            onTap: () => Firebase.pushNamed(context, '/Settings/ChangeProfile'),
          ),
          ListTile(
            title: Text(S.of(context).Settings_Sessions),
            onTap: () => Navigator.of(context).pushNamed('/Settings/Sessions'),
          ),
          ListTile(
            title: Text(S.of(context).Settings_DeveloperOptions),
            onTap: () =>
                Navigator.of(context).pushNamed('/Settings/DeveloperOptions'),
          ),
          ListTile(
            title: Text(S.of(context).About),
            onTap: () => Navigator.of(context).pushNamed('/About'),
          ),
          Divider(),
          RaisedButton.icon(
            label: Text(S.of(context).Settings_SignOut),
            icon: Icon(Icons.exit_to_app),
            onPressed: logout,
          ),
        ],
      ),
    );
  }
}
