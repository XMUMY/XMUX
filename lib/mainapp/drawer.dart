import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/translations/translation.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox(
        width: 250.0,
        child: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: FlatButton(
                  onPressed: () =>
                      Navigator.of(context).popAndPushNamed("/Settings"),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: Hero(
                          tag: "user-avatar",
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(firebaseUser?.photoUrl ?? ""),
                            radius: 30.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          MainLocalizations
                                  .of(context)
                                  .get("Me/Header/Welcome") +
                              "\n" +
                              (firebaseUser?.displayName ?? "User"),
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
                    FlatButton(
                      onPressed: () =>
                          Navigator.of(context).popAndPushNamed("/Me/Epayment"),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.credit_card),
                          Text("  " +
                              MainLocalizations
                                  .of(context)
                                  .get("Tools/EPayment"))
                        ],
                      ),
                    ),

                    // Emergency
                    FlatButton(
                      onPressed: () => Navigator
                          .of(context)
                          .popAndPushNamed("/Me/Emergency"),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                          ),
                          Text(
                            "  " +
                                MainLocalizations
                                    .of(context)
                                    .get("Tools/Emergency"),
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
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
                    "X",
                    style: TextStyle(fontSize: 50.0),
                  ),
                  backgroundColor: Colors.black,
                ),
              ),
              Container(
                  margin: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Text("Designed by χ"),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      RaisedButton(
                        onPressed: () => launch(
                              "https://xmux.xdea.top",
                            ),
                        child: Text(MainLocalizations.of(context).get("Home")),
                        color: Theme.of(context).cardColor,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      RaisedButton(
                        onPressed: () =>
                            Navigator.of(context).popAndPushNamed("/About"),
                        child: Text(MainLocalizations.of(context).get("About")),
                        color: Theme.of(context).cardColor,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                    ],
                  )),
              Text(
                "Version : \n" + packageInfo.version,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}
