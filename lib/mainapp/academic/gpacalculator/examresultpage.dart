import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/initapp/init.dart';

class ExamResultPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ExamResultPageState();
}

class _ExamResultPageState extends State<ExamResultPage> {
  var _examResult, _currentSession;

  Future<Null> _getExamResult() async {
    var response = await http.post(BackendApiConfig.address + "/v2/ac", body: {
      "id": mainAppStore.state.personalInfoState.uid,
      "pass": mainAppStore.state.personalInfoState.password,
    });
    setState(() {
      _examResult = JSON.decode(response.body)["data"]["examResult"];
      _currentSession = _examResult[0];
    });
  }

  @override
  void initState() {
    _getExamResult();
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title: new Text("Exam Result"),
        ),
        body: _examResult != null
            ? new ListView(
                children: <Widget>[
                  new ListTile(
                    title: new Text(
                      "Choose an academic session:",
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    trailing: new DropdownButton(
                      items: (_examResult as List)
                          .map((o) => new DropdownMenuItem(
                                child: new Text(o["academicSession"]),
                                value: o,
                              ))
                          .toList(),
                      onChanged: (e) {
                        setState(() {
                          _currentSession = e;
                        });
                      },
                      value: _currentSession,
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Card(
                      child: new Column(
                        children: (_currentSession["result"] as List)
                            .map((courseResult) =>
                                new _CourseResultUI(courseResult))
                            .toList(),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Card(
                            child: new Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: new Center(
                                child: new Text(
                                  "GPA : " + _currentSession["GPA"].toString(),
                                  style: Theme.of(context).textTheme.headline,
                                ),
                              ),
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Card(
                            child: new Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: new Center(
                                child: new Text(
                                  "CGPA : " +
                                      _currentSession["CGPA"].toString(),
                                  style: Theme.of(context).textTheme.headline,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : new Center(
                child: new CircularProgressIndicator(),
              ),
      );
}

class _CourseResultUI extends StatelessWidget {
  Map _courseResult;

  _CourseResultUI(this._courseResult);

  static Color _getGradeColor(double point) {
    if (point >= 3.7)
      return Colors.green;
    else if (point >= 1.7)
      return Colors.orange;
    else
      return Colors.red;
  }

  @override
  Widget build(BuildContext context) => new Container(
        margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        _courseResult["courseName"],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      new Divider(),
                      new Text(
                        _courseResult["courseCode"] +
                            " " +
                            _courseResult["credit"].toString() +
                            " credits",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.all(8.0),
                  child: new Text(
                    _courseResult["grade"] +
                        "\n" +
                        _courseResult["gradePoint"].toStringAsFixed(2),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline.copyWith(
                        color: _getGradeColor(
                            _courseResult["gradePoint"].toDouble())),
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
