import 'package:easy_localization/easy_localization.dart';
import 'package:emgs/emgs.dart' as emgs show getCountryCode;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/components/user_profile.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/firebase/firebase.dart';
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
                  Firebase.remoteConfigs.staticResources.defaultAvatar,
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
                padding: const EdgeInsets.symmetric(vertical: 5),
                children: <Widget>[
                  // Room Reservation
                  if (P.isVM)
                    _buildButton(
                      context,
                      routeName: '/Me/RoomReservation',
                      text: 'Tools/RoomReservation',
                      icon: FontAwesomeIcons.table,
                    ),

                  // VISA status
                  if (P.isVM)
                    StoreConnector<MainAppState, bool>(
                      // Check if nationality supported && enabled.
                      converter: (s) =>
                          emgs.getCountryCode(
                              s.state.user.profile?.nationality ?? null) !=
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
              title: Text(LocaleKeys.Settings.tr()),
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
