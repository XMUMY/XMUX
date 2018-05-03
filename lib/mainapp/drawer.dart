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
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(firebaseUser?.photoUrl ?? ""),
                          radius: 30.0,
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
  Widget build(BuildContext context) {
    return new Drawer(
      child: new Column(
        children: <Widget>[
          new DrawerHeader(
            child: new CircleAvatar(
              radius: 50.0,
              child: new Text(
                "X",
                style: new TextStyle(fontSize: 50.0),
              ),
              backgroundColor: Colors.black,
            ),
          ),
          new Expanded(
            child: new ListView(
              children: <Widget>[
                new Container(
                    margin: const EdgeInsets.all(15.0),
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          "We still need time to fix bug and build the release version. If you have any problems or suggestions please contact us.\n\n Email: x@ctbeta.org \n QQGroup: 585779547",
                          textAlign: TextAlign.center,
                        ),
                        new Divider(
                          height: 20.0,
                        ),
                        new RaisedButton(
                          onPressed: () {
                            launch(
                                "http://shang.qq.com/wpa/qunwpa?idkey=f07eb500a50900e4b475abc17ceeda9fb648cd7a57110a2710e14cbe6601ec2f");
                          },
                          child: new Text("Join QQ Group"),
                          color: Theme.of(context).cardColor,
                        ),
                      ],
                    )),
                new Text(
                  "Version : " + AppInfo.version,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
