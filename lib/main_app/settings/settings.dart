import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/components/user_profile.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/firebase/firebase.dart';
import 'package:xmux/redux/redux.dart';

import 'about.dart';
import 'developer_options.dart';
import 'edit_profile.dart';
import 'interface.dart';
import 'sessions.dart';

class SettingsPage extends StatefulWidget {
  static final routes = <String, WidgetBuilder>{
    '/Settings': (_) => SettingsList(),
    '/Settings/EditProfile': (_) => EditProfilePage(),
    '/Settings/Security/Sessions': (_) => SessionsPage(),
    '/Settings/Interface': (_) => InterfacePage(),
    '/Settings/DeveloperOptions': (_) => DeveloperOptionsPage(),
    '/Settings/About': (_) => AboutPage(),
  };

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    var navigator = Navigator(
      key: _navigatorKey,
      // TODO: According to RouteSettings.
      initialRoute: ModalRoute.of(context).settings.name ?? '/Settings',
      onGenerateRoute: (settings) {
        if (SettingsPage.routes.containsKey(settings.name))
          return MaterialPageRoute(
              builder: (context) =>
                  SettingsPage.routes[settings.name](context));

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
          title: Text(LocaleKeys.Settings_EditProfile.tr()),
          onTap: () => Firebase.pushNamed(context, '/Settings/EditProfile'),
        ),
        ListTile(
          title: Text(LocaleKeys.Settings_SecuritySessions.tr()),
          onTap: () =>
              Navigator.of(context).pushNamed('/Settings/Security/Sessions'),
        ),
        ListTile(
          title: Text(LocaleKeys.Settings_Interface.tr()),
          onTap: () => Navigator.of(context).pushNamed('/Settings/Interface'),
        ),
        ListTile(
          title: Text(LocaleKeys.Settings_DeveloperOptions.tr()),
          onTap: () =>
              Navigator.of(context).pushNamed('/Settings/DeveloperOptions'),
        ),
        ListTile(
          title: Text(LocaleKeys.About.tr()),
          onTap: () => Navigator.of(context).pushNamed('/Settings/About'),
        ),
        Divider(),
        RaisedButton.icon(
          label: Text(LocaleKeys.Settings_SignOut.tr()),
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
        title: Text(LocaleKeys.Settings.tr()),
      ),
      body: settings,
    );
  }
}
