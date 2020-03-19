import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/components/user_avatar.dart';
import 'package:xmux/config.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/emgs/emgs.dart' as emgs show getCountryCode;
import 'package:xmux/redux/redux.dart';

class DrawerPage extends StatelessWidget {
  Widget _buildButton(BuildContext ctx,
      {String routeName, String text, IconData icon, Color color}) {
    return ListTile(
      leading: Icon(icon,
          size: 23, color: color ?? Theme.of(ctx).textTheme.button.color),
      onTap: () => Navigator.of(ctx).popAndPushNamed(routeName),
      title: Text(
        i18n(text, ctx),
        style: Theme.of(ctx).textTheme.button.copyWith(color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var header = FlatButton(
      onPressed: () => Navigator.of(context).popAndPushNamed('/Settings'),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: StoreConnector<MainAppState, String>(
              converter: (s) =>
                  s.state.user.profile?.avatar ??
                  firebase.remoteConfigs.staticResources.defaultAvatar,
              builder: (context, s) => UserAvatar(
                url: s,
                radius: 30,
                heroTag: 'UserAvatar',
              ),
            ),
          ),
          Expanded(
            child: StoreConnector<MainAppState, String>(
              converter: (s) => s.state.user.profile?.displayName ?? 'User',
              builder: (context, s) => Text(s, textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );

    return SizedBox(
      width: 250,
      child: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(child: header),
            Expanded(
              child: ListView(
                children: <Widget>[
                  // E-Payment
                  _buildButton(
                    context,
                    routeName: '/Me/Epayment',
                    text: 'Tools/EPayment',
                    icon: FontAwesomeIcons.creditCard,
                  ),

                  // Room Reservation
                  _buildButton(
                    context,
                    routeName: '/Me/RoomReservation',
                    text: 'Tools/RoomReservation',
                    icon: FontAwesomeIcons.table,
                  ),

                  // VISA status
                  StoreConnector<MainAppState, bool>(
                    // Check if nationality supported && enabled.
                    converter: (s) =>
                        emgs.getCountryCode(
                            s.state.acState.info?.nationality ?? null) !=
                        null,
                    builder: (context, enabled) => enabled
                        ? _buildButton(
                            context,
                            routeName: '/Me/Emgs',
                            text: 'Tools/Emgs',
                            icon: FontAwesomeIcons.passport,
                          )
                        : Container(),
                  ),

                  // Emergency
                  _buildButton(
                    context,
                    routeName: '/Me/Emergency',
                    text: 'Tools/Emergency',
                    icon: Icons.error_outline,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).textTheme.button.color,
              ),
              onTap: () => Navigator.of(context).popAndPushNamed('/Settings'),
              title: Text(S.of(context).Settings),
              trailing: StoreConnector<MainAppState, ThemeMode>(
                converter: (s) => s.state.settingState.themeMode,
                builder: (_, mode) => IconButton(
                  icon: Icon(
                    mode == ThemeMode.system
                        ? FontAwesomeIcons.mobileAlt
                        : mode == ThemeMode.light
                            ? FontAwesomeIcons.sun
                            : FontAwesomeIcons.moon,
                    size: 20,
                    color: mode == ThemeMode.dark
                        ? Theme.of(context).accentColor
                        : Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () => store.dispatch(
                      ThemeModeAction(ThemeMode.values[(mode.index + 1) % 3])),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EndDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: <Widget>[
            Hero(
              tag: 'χLogo',
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  'χ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontSize: 55),
                ),
              ),
            ),
            Divider(),
            RaisedButton(
              onPressed: () => launch(BackendApiConfig.websiteAddress),
              child: Text(i18n('Home', context)),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).popAndPushNamed('/About'),
              child: Text(i18n('About', context)),
            ),
            Divider(),
            Text(
              packageInfo.version,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
