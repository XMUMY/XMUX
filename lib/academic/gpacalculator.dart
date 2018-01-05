import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xmux/config.dart';
import 'package:xmux/init.dart';
import 'package:xmux/translations/translation.dart';

class GPACalculatorPage extends StatefulWidget {
  GPACalculatorPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _GPACalculatorPageState();
}

class _GPACalculatorPageState extends State<GPACalculatorPage> {
  int totalPoint = 0;
  List coursesData;
  List<String> grades = [];
  List<int> coursesCredit = [];
  Map gradePoints = {
    "A": 4.0,
    "A-": 3.7,
    "B+": 3.3,
    "B": 3.0,
    "B-": 2.7,
    "C+": 2.3,
    "C": 2.0,
    "C-": 1.7,
    "D": 1.0,
    "F": 0.0,
  };

  Future _getCourses() async {
    try {
      var response =
          await http.post(BackendApiConfig.address + "/course", body: {
        "id": globalPersonalInfoState.id,
        "pass": globalPersonalInfoState.password,
      });
      coursesData = JSON.decode(response.body)["data"];
    } catch (e) {
      Scaffold
          .of(context)
          .showSnackBar(new SnackBar(content: new Text("Connect Error")));
    }
    coursesData = coursesData
        .map((e) => e["Course Name (by group)"].contains("(Lab)") ? null : e)
        .toList();
    while (coursesData.contains(null)) coursesData.remove(null);
    for (int i = 0; i < coursesData.length; i++) coursesData[i]["No."] = i;
  }

  double _calculateGPA() {
    double sum = 0.0;
    List<double> points = grades.map((grade) => gradePoints[grade]).toList();
    for (int i = 0; i < coursesData.length; i++)
      sum += points[i] * (coursesCredit[i] / totalPoint);
    return sum;
  }

  Color _getGPAColor(double point) {
    if (point >= 3.7)
      return Colors.green;
    else if (point >= 1.7)
      return Colors.orange;
    else
      return Colors.red;
  }

  @override
  void initState() {
    _getCourses().then((Null) {
      for (int i = 0; i < coursesData.length; i++) {
        grades.add("A");
        coursesCredit.add(int.parse(coursesData[i]["Credit"]));
        totalPoint += coursesCredit[i];
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(MainLocalizations.of(context).get("academic/gpacalculator/name")),
      ),
      body: coursesData == null
          ? new Center(
              child: new CircularProgressIndicator(),
            )
          : new Column(
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.all(10.0),
                  child: new Card(
                    child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "Your GPA : " + _calculateGPA().toStringAsFixed(1),
                            style: Theme
                                .of(context)
                                .textTheme
                                .title
                                .copyWith(color: _getGPAColor(_calculateGPA())),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                new Flexible(
                  child: new ListView(
                    children: coursesData
                        .map((course) => new ListTile(
                              title: new Text(course["Course Name (by group)"]),
                              trailing: new DropdownButton<String>(
                                value: grades[course["No."]],
                                onChanged: (String grade) {
                                  setState(() {
                                    grades[course["No."]] = grade;
                                  });
                                },
                                items: <String>[
                                  'A',
                                  'A-',
                                  'B+',
                                  'B',
                                  'B-',
                                  'C+',
                                  'C',
                                  'C-',
                                  'D',
                                  'F',
                                ].map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
    );
  }
}
