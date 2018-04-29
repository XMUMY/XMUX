import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/translations/translation.dart';

class ExamResultPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExamResultPageState();
}

class _ExamResultPageState extends State<ExamResultPage> {
  var _examResult, _currentSession;

  @override
  void initState() {
    _examResult = mainAppStore.state.acState.examResult;
    _currentSession = _examResult[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: AppBar(
          title: Text(MainLocalizations.of(context).get("Tools/ExamResult")),
        ),
        body: _examResult != null
            ? new ListView(
                children: <Widget>[
                  new ListTile(
                    title: new Text(
                      MainLocalizations
                          .of(context)
                          .get("Tools/ExamResult/ChooseSession"),
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
            : new EmptyErrorPage(),
      );
}

class _CourseResultUI extends StatelessWidget {
  final Map _courseResult;

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
