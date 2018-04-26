import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/loginapp/login_app.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/translations/translation.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  Future<Null> _deleteData() async {
    Navigator.pop(context);
    FirebaseAuth.instance.signOut();
    mainAppStore.dispatch(new LogoutAction());
    runApp(new LoginApp());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(MainLocalizations.of(context).get("me")),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new CircleAvatar(
            radius: 30.0,
            backgroundImage: new NetworkImage(firebaseUser.photoUrl),
          ),
          new Divider(
            height: 15.0,
            color: Theme.of(context).canvasColor,
          ),
          new Text(firebaseUser.displayName),
          new Divider(
            height: 10.0,
            color: Theme.of(context).canvasColor,
          ),
          new Container(
            margin: const EdgeInsets.all(10.0),
            child: new FlatButton(
              color: Theme.of(context).splashColor,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                      MainLocalizations.of(context).get("me/signout") + " "),
                  new Icon(Icons.exit_to_app),
                ],
              ),
              onPressed: _deleteData,
            ),
          ),
        ],
      ),
    );
  }
}
