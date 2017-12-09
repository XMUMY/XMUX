import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'timetable.dart';
import 'package:xmux/main.dart';
import 'package:xmux/Events/LoginEvent.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => new _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  var data;
  String id, password;

  Future<File> _getFile(String name) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/$name');
  }

  Future<Null> _saveFile(String name, String str) async {
    await (await _getFile(name)).writeAsString(str);
  }

  Future<String> _readFile(String name) async {
    return await (await _getFile(name)).readAsString();
  }

  Future<Null> _getClasses() async {
    var response = await http.post("https://xmux.azurewebsites.net/ac", body: {
      "id": id,
      "pass": password,
    });
    setState(() {
      data = JSON.decode(response.body);
    });
  }

  @override
  void initState() {
    _readFile("login.dat").then((String str) {
      Map loginInfo = JSON.decode(str);
      id = loginInfo["id"];
      password = loginInfo["campus"];
      _getClasses();
    });
    loginEventBus.on(LoginEvent).listen((LoginEvent e) {
      id = e.id;
      password = e.campusIdPassword;
      _getClasses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: new Scaffold(
        appBar: new AppBar(
          title: const Text('Calendar'),
          bottom: new TabBar(
              tabs: <Tab>[
                new Tab(
                  text: "Classes",
                ),
                new Tab(
                  text: "Exams",
                ),
                new Tab(
                  text: "Payment",
                ),
                new Tab(
                  text: "ToDo",
                ),
              ]),
        ),
        body: new TabBarView(
            children: <Widget>[
              data == null ? new _ErrorPage(): new ClassesPage(data),
              new _ErrorPage(),
              new _ErrorPage(),
              new _ErrorPage(),
            ]
        ),
      ),
    );
  }
}

class _ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Card(
        color: Colors.white,
        child: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.error,
                size: 60.0,
                color: Theme
                    .of(context)
                    .errorColor,
              ),
              new Divider(height: 20.0,),
              new Text(
                "Oh ! Nothing is here !\n\nPlease check:\n You are logined successfully.\nYour have connected to internet.",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}