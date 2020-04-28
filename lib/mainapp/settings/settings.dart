import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/components/user_profile.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/firebase/firebase.dart';
import 'package:xmux/redux/redux.dart';

import 'about.dart';
import 'developer_options.dart';
import 'edit_profile.dart';
import 'sessions.dart';

class SettingsPage extends StatelessWidget {
  static final routes = <String, WidgetBuilder>{
    '/EditProfile': (_) => EditProfilePage(),
    '/Sessions': (_) => SessionsPage(),
    '/DeveloperOptions': (_) => DeveloperOptionsPage(),
    '/About': (_) => AboutPage(),
  };

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    var navigator = Navigator(
      key: _navigatorKey,
      // TODO: According to RouteSettings.
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/')
          return MaterialPageRoute(builder: (context) => SettingsList());

        if (routes.containsKey(settings.name))
          return MaterialPageRoute(
              builder: (context) => routes[settings.name](context));

        return null;
      },
    );

    return WillPopScope(
      onWillPop: () async => !await _navigatorKey.currentState.maybePop(),
      child: navigator,
    );
  }
}

class SettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var isWide = width > 600;

    Widget settings = ListView(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StoreConnector<MainAppState, String>(
              converter: (s) =>
                  s.state.user.profile?.avatar ??
                  firebase.remoteConfigs.staticResources.defaultAvatar,
              builder: (context, s) => UserAvatar(
                url: s,
                radius: 30,
                heroTag: 'UserAvatar',
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
          onTap: () => Firebase.pushNamed(context, '/EditProfile'),
        ),
        ListTile(
          title: Text(S.of(context).Settings_Sessions),
          onTap: () => Navigator.of(context).pushNamed('/Sessions'),
        ),
        ListTile(
          title: Text(S.of(context).Settings_DeveloperOptions),
          onTap: () => Navigator.of(context).pushNamed('/DeveloperOptions'),
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
    );

    return Scaffold(
      appBar: AppBar(
        leading: isWide
            ? CloseButton(
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
              )
            : BackButton(
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
              ),
        automaticallyImplyLeading: true,
        title: Text(S.of(context).Settings),
      ),
      body: settings,
    );
  }
}
