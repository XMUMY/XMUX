import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/init.dart';
import 'package:xmux/main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  bool _isProcessing = false;

  Future<bool> _loginAuth(BuildContext context) async {
    var response = await http.post(BackendApiConfig.address + "/login", body: {
      "id": _usernameController.text,
      "cpass": _passwordController.text,
    });
    if (response.statusCode >= 400) {
      Scaffold.of(context).showSnackBar(
          new SnackBar(content: new Text("Login Failed : Server Error")));
      setState(() {
        _isProcessing = false;
      });
      return false;
    }
    Map resJson = JSON.decode(response.body);
    if (resJson.containsKey("error")) {
      String error = resJson["error"];
      Scaffold.of(context).showSnackBar(
          new SnackBar(content: new Text("Login Failed : $error")));
      setState(() {
        _isProcessing = false;
      });
      return false;
    }

    globalPersonalInfoState.campusId = _usernameController.text;
    globalPersonalInfoState.password = _passwordController.text;
    globalCalendarState.classesData = resJson["timetable"];
    globalCalendarState.examsData = resJson["exam"];
    globalCalendarState.assignmentData = resJson["assignment"];
    globalPersonalInfoState.fullName = resJson["moodle"]["fullname"];
    globalPersonalInfoState.avatarURL = resJson["moodle"]["userpictureurl"];

    String loginInfo = JSON.encode({
      "campusId": globalPersonalInfoState.campusId,
      "password": globalPersonalInfoState.password,
    });
    await _saveData(loginInfo, response.body);
    return true;
  }

  Future<Null> _saveData(String loginInfo, String calendarState) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    await (new File('$dir/login.dat')).writeAsString(loginInfo);
    await (new File('$dir/data.json')).writeAsString(calendarState);
  }

  Future _handleSignIn(BuildContext context) async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(
          new SnackBar(content: new Text("Format Error. Please Check.")));
      setState(() {
        _isProcessing = false;
      });
    } else {
      _loginAuth(context).then((r) {
        if (r) runMainApp();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sign in to XMUX"),
      ),
      body: new Builder(builder: (BuildContext context) {
        return new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 15.0, bottom: 20.0),
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
                    controller: _passwordController,
                    obscureText: true,
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      icon: new Icon(
                        Icons.lock_outline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _isProcessing
                ? new CircularProgressIndicator()
                : new FlatButton(
                    child: new Container(
                      width: 120.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                          color: Theme.of(context).buttonColor,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(10.0))),
                      child: new Center(
                          child: new Text("Sign In",
                              style: new TextStyle(
                                color: Theme.of(context).canvasColor,
                              ))),
                    ),
                    onPressed: () {
                      setState(() {
                        _isProcessing = true;
                      });
                      _handleSignIn(context);
                    },
                  ),
          ],
        );
      }),
    );
  }
}
