import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xmux/init.dart';

class MePage extends StatefulWidget {
  @override
  MePageState createState() => new MePageState();
}

class MePageState extends State<MePage> {
  Future<Null> _deleteData() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    await (new File('$dir/login.dat')).delete();
    runLoginPage();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sign out"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new CircleAvatar(
            child: new Image(
                image: new NetworkImage(globalPersonalInfoState.avatarURL)),
          ),
          new Text(globalPersonalInfoState.fullName),
          new Center(
              child: new IconButton(
            icon: new Icon(Icons.exit_to_app),
            onPressed: _deleteData,
          )),
        ],
      ),
    );
  }
}
