import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/translations/translation.dart';

class ExamResultPage extends StatefulWidget {
  final _examResult = mainAppStore.state.acState.examResult;

  static Color getGradeColor(double point) {
    if (point >= 3.7)
      return Colors.green;
    else if (point >= 1.7)
      return Colors.orange;
    else
      return Colors.red;
  }

  @override
  State<StatefulWidget> createState() => _ExamResultPageState();
}

class _ExamResultPageState extends State<ExamResultPage> {
  Map _currentSession;

  @override
  void initState() {
    _currentSession = widget._examResult == null ? {} : widget._examResult[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MainLocalizations.of(context).get("Academic/ExamResult")),
        ),
        body: widget._examResult != null
            ? ListView(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      MainLocalizations
                          .of(context)
                          .get("Academic/ExamResult/ChooseSession"),
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    trailing: DropdownButton(
                      items: widget._examResult
                          .map((session) => DropdownMenuItem(
                                child: Text(session["academicSession"]),
                                value: session,
                              ))
                          .toList(),
                      onChanged: (sessionChosen) {
                        setState(() {
                          _currentSession = sessionChosen;
                        });
                      },
                      value: _currentSession,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: (_currentSession["result"] as List)
                          .map((courseResult) => _CourseResultUI(courseResult))
                          .toList(),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                          margin: EdgeInsets.fromLTRB(10.0, 0.0, 3.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                "GPA : " + _currentSession["GPA"].toString(),
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline
                                    .copyWith(
                                      color: ExamResultPage.getGradeColor(
                                          double.parse(_currentSession["GPA"])),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          margin: EdgeInsets.fromLTRB(3.0, 0.0, 10.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                "CGPA : " + _currentSession["CGPA"].toString(),
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline
                                    .copyWith(
                                      color: ExamResultPage.getGradeColor(double
                                          .parse(_currentSession["CGPA"])),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : EmptyErrorPage(),
      );
}

class _CourseResultUI extends StatelessWidget {
  final Map _courseResult;

  _CourseResultUI(this._courseResult);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    _courseResult["courseName"],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Divider(),
                  Text(
                    _courseResult["courseCode"] +
                        "   " +
                        _courseResult["credit"].toString() +
                        " " +
                        MainLocalizations
                            .of(context)
                            .get("Academic/ExamResult/credits"),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 3.0, 0.0, 3.0),
              child: Text(
                _courseResult["grade"] +
                    "\n" +
                    _courseResult["gradePoint"].toStringAsFixed(2),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline.copyWith(
                    color: ExamResultPage
                        .getGradeColor(_courseResult["gradePoint"].toDouble())),
              ),
            )
          ],
        ),
      );
}
