import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/translations/translation.dart';

class DrawerPage extends StatelessWidget {
  Widget _buildButton(BuildContext ctx,
      {String routeName, String text, IconData icon, Color color}) {
    return FlatButton(
      onPressed: () => Navigator.of(ctx).popAndPushNamed(routeName),
      child: Row(
        children: <Widget>[
          Icon(icon, color: color),
          Text(
            " ${i18n(text, ctx)}",
            style: Theme.of(ctx).textTheme.button.copyWith(color: color),
          )
        ],
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
                          // TODO: Implement Gravatar.
                          backgroundImage: NetworkImage(
                              'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d55'),
                          radius: 30.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${i18n('Me/Header/Welcome', context)}\n" +
                            (firebaseUser?.displayName ?? 'User'),
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
                    icon: Icons.credit_card,
                  ),

                  // Room Reservation
                  _buildButton(
                    context,
                    routeName: '/Me/RoomReservation',
                    text: 'Tools/RoomReservation',
                    icon: Icons.room,
                  ),

                  // Emergency
                  _buildButton(context,
                      routeName: '/Me/Emergency',
                      text: 'Tools/Emergency',
                      icon: Icons.error_outline,
                      color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EndDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox(
        width: 150.0,
        child: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: CircleAvatar(
                  radius: 40.0,
                  child: Text(
                    'X',
                    style: TextStyle(fontSize: 50.0),
                  ),
                  backgroundColor: Colors.black,
                ),
              ),
              Container(
                  margin: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Text('Designed by χ'),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      RaisedButton(
                        onPressed: () => launch(
                              'https://xmux.xdea.top',
                            ),
                        child: Text(MainLocalizations.of(context).get('Home')),
                        color: Theme.of(context).cardColor,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      RaisedButton(
                        onPressed: () =>
                            Navigator.of(context).popAndPushNamed('/About'),
                        child: Text(MainLocalizations.of(context).get('About')),
                        color: Theme.of(context).cardColor,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                    ],
                  )),
              Text(
                'Version : \n' + packageInfo.version,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}
