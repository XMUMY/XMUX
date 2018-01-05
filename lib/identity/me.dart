import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/identity/loginhandler.dart';
import 'package:xmux/init.dart';
import 'package:xmux/translations/translation.dart';

class MePage extends StatefulWidget {
  @override
  MePageState createState() => new MePageState();
}

class MePageState extends State<MePage> {
  final TextEditingController _ePaymentPasswordController =
      new TextEditingController();
  bool _isDeleteing = false;
  bool _isProcessing = false;

  Future<Null> _deleteData() async {
    _isDeleteing = true;
    Navigator.pop(context);
    FirebaseAuth.instance.signOut();
    String dir = (await getApplicationDocumentsDirectory()).path;
    await (new File('$dir/login.dat')).delete();
    globalPersonalInfoState.clear();
    globalCalendarState.clear();
    runLoginApp();
  }

  @override
  Widget build(BuildContext context) {
    return _isDeleteing == true
        ? new Container()
        : new Scaffold(
            appBar: new AppBar(
              title: new Text(MainLocalizations.of(context).get("me")),
            ),
            body: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new CircleAvatar(
                  radius: 30.0,
                  backgroundImage:
                      new NetworkImage(globalPersonalInfoState.avatarURL),
                ),
                new Divider(
                  height: 15.0,
                  color: Theme.of(context).canvasColor,
                ),
                new Text(globalPersonalInfoState.fullName),
                new Divider(
                  height: 10.0,
                  color: Theme.of(context).canvasColor,
                ),
                globalPersonalInfoState.ePaymentPassword == null
                    ? new Container(
                        margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                        child: new Row(
                          children: <Widget>[
                            new Flexible(
                              child: new TextField(
                                controller: _ePaymentPasswordController,
                                decoration: new InputDecoration(
                                    hintText: "Login ePayment"),
                                obscureText: true,
                              ),
                            ),
                            _isProcessing
                                ? new CircularProgressIndicator()
                                : new Container(
                                    margin: new EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: new IconButton(
                                      icon: new Icon(Icons.save),
                                      onPressed: () {
                                        if (_ePaymentPasswordController
                                            .text.isNotEmpty) {
                                          setState(() {
                                            _isProcessing = true;
                                          });
                                          LoginHandler
                                              .ePaymentAuth(
                                                  globalPersonalInfoState.id,
                                                  _ePaymentPasswordController
                                                      .text)
                                              .then((r) {
                                            if (r.containsKey("error")) {
                                              String _error = r["error"];
                                              Scaffold.of(context).showSnackBar(
                                                  new SnackBar(
                                                      content: new Text(
                                                          "Error : $_error")));
                                            } else
                                              setState(() {});
                                          });
                                        }
                                      },
                                    ),
                                  ),
                          ],
                        ),
                      )
                    : new Container(),
                new Divider(
                  height: 10.0,
                  color: Theme.of(context).canvasColor,
                ),
                new Container(
                  margin: const EdgeInsets.all(10.0),
                  child: new MaterialButton(
                    color: Theme.of(context).splashColor,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                            MainLocalizations.of(context).get("me/signout") +
                                " "),
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
