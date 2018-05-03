import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/translations/translation.dart';

class SettingsPage extends StatelessWidget {
  Widget _getSimpleSettingWidget(
          {@required BuildContext context,
          @required String name,
          String route,
          VoidCallback callback}) =>
      FlatButton(
        onPressed: route == null
            ? callback
            : () => Navigator.pushNamed(context, route),
        child: Row(
          children: <Widget>[
            Text(
              MainLocalizations.of(context).get(name),
            ),
          ],
        ),
      );

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
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(firebaseUser?.photoUrl ?? ""),
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
            _getSimpleSettingWidget(
                context: context,
                route: "/Settings/ChangeDisplayName",
                name: "Settings/ChangeDisplayName"),
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
