import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/init.dart';

class MePage extends StatefulWidget {
  @override
  MePageState createState() => new MePageState();
}

class MePageState extends State<MePage> {
  final TextEditingController _ePaymentPasswordController =
      new TextEditingController();
  bool _isProcessing = false;

  Future<bool> _loginEPayment() async {
    var response = await http.post(BackendApiConfig.address + "/bill", body: {
      "id": globalPersonalInfoState.campusId,
      "pass": _ePaymentPasswordController.text,
    });
    if (response.statusCode >= 400) {
      Scaffold
          .of(context)
          .showSnackBar(new SnackBar(content: new Text("Login Failed")));
      setState(() {
        _isProcessing = false;
      });
      return false;
    }
    Map resJson = JSON.decode(response.body);

    globalPersonalInfoState.ePaymentPassword = _ePaymentPasswordController.text;
    _ePaymentPasswordController.clear();
    globalCalendarState.paymentData = resJson;
    updateEventBus.fire(globalCalendarState);

    _saveData(JSON.encode({
      "campusId": globalPersonalInfoState.campusId,
      "password": globalPersonalInfoState.password,
      "ePaymentPassword": globalPersonalInfoState.ePaymentPassword,
    }));
    return true;
  }

  Future<Null> _saveData(String loginInfo) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    await (new File('$dir/login.dat')).writeAsString(loginInfo);
  }

  void _handleSubmitted() {
    if (_ePaymentPasswordController.text.isEmpty)
      Scaffold.of(context).showSnackBar(
          new SnackBar(content: new Text("Format Error. Please Check.")));
    else {
      setState(() {
        _isProcessing = true;
      });
      _loginEPayment().then((r) {
        if (r)
          Scaffold
              .of(context)
              .showSnackBar(new SnackBar(content: new Text("Success !")));
        setState(() {
          _isProcessing = false;
        });
      });
    }
  }

  Future<Null> _deleteData() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    await (new File('$dir/login.dat')).delete();
    globalPersonalInfoState.clear();
    globalCalendarState.clear();
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
            radius: 40.0,
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
          new Container(
            margin: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: new Row(children: <Widget>[
              new Flexible(
                child: new TextField(
                  controller: _ePaymentPasswordController,
                  decoration: new InputDecoration(hintText: "Login ePayment"),
                ),
              ),
              _isProcessing
                  ? new CircularProgressIndicator()
                  : new Container(
                      margin: new EdgeInsets.symmetric(horizontal: 4.0),
                      child: new IconButton(
                        icon: new Icon(Icons.save),
                        onPressed: _handleSubmitted,
                      )),
            ]),
          ),
          new Divider(
            height: 15.0,
            color: Theme.of(context).canvasColor,
          ),
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
