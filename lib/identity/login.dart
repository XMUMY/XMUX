import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xmux/Events/LoginEvent.dart';
import 'package:xmux/main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _idPasswordController =
      new TextEditingController();
  final TextEditingController _epaymentPasswordController =
      new TextEditingController();

  Future<bool> _authCampusID() async {
    var response = await http.post("https://xmux.azurewebsites.net/ac", body: {
      "id": _usernameController.text,
      "pass": _idPasswordController.text
    });
    if (response.statusCode >= 500) return false;
    var resJson = JSON.decode(response.body);
    return (resJson["periods"] as List<String>).isNotEmpty;
  }

  Future<bool> _authEPayment(bool idauth) async {
    var response = await http.post("https://xmux.azurewebsites.net/bill",
        body: {
          "id": _usernameController.text,
          "pass": _epaymentPasswordController.text
        });
    var resJson = JSON.decode(response.body) as Map<String, dynamic>;
    if (resJson["error"] != null) {
      Scaffold
          .of(context)
          .showSnackBar(new SnackBar(content: new Text("LoginError: TOS")));
      return false;
    }
    return (resJson["data"] as List<String>).isNotEmpty;
  }

  Future<File> _getFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/login.dat');
  }

  Future<Null> _saveLoginInfo(String info) async {
    await (await _getFile()).writeAsString(info);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 15.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: _usernameController,
                  decoration: new InputDecoration(
                    hintText: 'Campus ID',
                    icon: new Icon(
                      Icons.account_circle,
                    ),
                  ),
                ),
                new TextField(
                  controller: _idPasswordController,
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: 'Campus ID Password',
                    icon: new Icon(
                      Icons.lock_outline,
                    ),
                  ),
                ),
                new TextField(
                  controller: _epaymentPasswordController,
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: 'EPayment Password',
                    icon: new Icon(
                      Icons.lock_outline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          new FlatButton(
            child: new Container(
              height: 30.0,
              decoration: new BoxDecoration(
                color: Theme.of(context).accentColor,
              ),
              child: new Center(
                  child: new Text("Sign In",
                      style: new TextStyle(
                        color: Colors.white,
                      ))),
            ),
            onPressed: () {
              _authCampusID().then(_authEPayment).then((bool auth) {
                if (auth) {
                  var infoMap = {
                    "id": _usernameController.text,
                    "campus": _idPasswordController.text,
                    "epayment": _epaymentPasswordController.text,
                  };
                  _saveLoginInfo(JSON.encode(infoMap));
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text("Success!")));
                  loginEventBus.fire(new LoginEvent(
                      infoMap["id"], infoMap["campus"], infoMap["epayment"]));
                } else
                  Scaffold
                      .of(context)
                      .showSnackBar(new SnackBar(content: new Text("Failed!")));
              });
            },
          ),
        ],
      ),
    );
  }
}
