import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/config.dart';
import 'package:xmux/init.dart';
import 'package:xmux/translations/translation.dart';

class DrawerPage extends StatefulWidget {
  DrawerPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new DrawerPageState();
}

class DrawerPageState extends State<DrawerPage> {
  Future _loginEPayment() async {
    showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text(MainLocalizations.of(context).get("e-payment/login")),
        content: new Text(
            MainLocalizations.of(context).get("e-payment/login/content")),
        actions: <Widget>[
          new FlatButton(
            child: new Text(
                MainLocalizations.of(context).get("e-payment/login/go")),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/me");
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: 250.0,
      child: new Drawer(
        child: new Column(
          children: <Widget>[
            new DrawerHeader(
              child: new FlatButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/me");
                },
                child: new Row(
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.all(10.0),
                      child: new CircleAvatar(
                        backgroundImage:
                            new NetworkImage(globalPersonalInfoState.avatarURL),
                        radius: 30.0,
                      ),
                    ),
                    new Expanded(
                      child: new Text(
                        MainLocalizations.of(context).get("header/welcome") +
                            "\n" +
                            globalPersonalInfoState.fullName,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new Expanded(
              child: new ListView(
                children: <Widget>[
                  new FlatButton(
                    onPressed: () {
                      if (globalPersonalInfoState.ePaymentPassword != null)
                        Navigator.popAndPushNamed(context, "/drawer/epayment");
                      else
                        _loginEPayment();
                    },
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.credit_card),
                        new Text(MainLocalizations.of(context).get("e-payment"))
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
