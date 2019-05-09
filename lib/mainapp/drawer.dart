import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/emgs/emgs.dart' as emgs show getCountryCode;
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
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
    return SizedBox(
      width: 250.0,
      child: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: FlatButton(
                onPressed: () =>
                    Navigator.of(context).popAndPushNamed('/Settings'),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Hero(
                        tag: 'UserAvatar',
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              XMUXApi.convertAvatarUrl(firebaseUser?.photoUrl,
                                  store.state.authState.moodleKey)),
                          radius: 30.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${i18n('Me/Header/Welcome', context)}\n"
                        '${firebaseUser?.displayName ?? 'User'}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
              leading: Icon(Icons.settings,
                  color: Theme.of(context).textTheme.button.color),
              onTap: () => Navigator.of(context).popAndPushNamed('/Settings'),
              title: Text(i18n('Settings', context)),
              trailing: StoreConnector<MainAppState, bool>(
                converter: (s) =>
                    s.state.uiState.darkMode ||
                    MediaQuery.platformBrightnessOf(context) == Brightness.dark,
                builder: (_, isDark) => IconButton(
                      icon: Icon(
                        FontAwesomeIcons.moon,
                        size: 20.0,
                        color: isDark
                            ? Colors.cyan
                            : Theme.of(context).iconTheme.color,
                      ),
                      onPressed: () {
                        if (MediaQuery.platformBrightnessOf(context) !=
                            Brightness.dark)
                          store.dispatch(ToggleDarkModeAction());
                      },
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
      width: 150.0,
      child: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Hero(
                tag: 'χLogo',
                child: CircleAvatar(
                  radius: 40.0,
                  child: Text('X', style: TextStyle(fontSize: 50.0)),
                  backgroundColor: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Text('Designed by χ'),
                  RaisedButton(
                    onPressed: () => launch('https://xmux.xdea.io'),
                    child: Text(i18n('Home', context)),
                  ),
                  RaisedButton(
                    onPressed: () =>
                        Navigator.of(context).popAndPushNamed('/About'),
                    child: Text(i18n('About', context)),
                  ),
                ],
              ),
            ),
            Text(
              'Version : \n${packageInfo.version}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
