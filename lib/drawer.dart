import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xmux/init.dart';
import 'package:xmux/translate.dart';

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
                        Navigator.popAndPushNamed(context, "/epayment");
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
