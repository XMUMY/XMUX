import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/config.dart';
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
                          Text(" " +
                              MainLocalizations
                                  .of(context)
                                  .get("Tools/EPayment"))
                        ],
                      ),
                    ),

                    // Exam result
                    FlatButton(
                      onPressed: () => Navigator
                          .of(context)
                          .popAndPushNamed("/Me/ExamResult"),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.local_hospital),
                          Text(" " +
                              MainLocalizations
                                  .of(context)
                                  .get("Tools/ExamResult"))
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
        width: 180.0,
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
                      Divider(
                        height: 20.0,
                      ),
                      RaisedButton(
                        onPressed: () =>
                            Navigator.of(context).popAndPushNamed("/About"),
                        child: Text("About"),
                        color: Theme.of(context).cardColor,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      RaisedButton(
                        onPressed: () => launch(
                              "https://shang.qq.com/wpa/qunwpa?idkey=f07eb500a50900e4b475abc17ceeda9fb648cd7a57110a2710e14cbe6601ec2f",
                            ),
                        child: Text("Join QQ Group"),
                        color: Theme.of(context).cardColor,
                      ),
                    ],
                  )),
              Text(
                "Version : " + AppInfo.version,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}
