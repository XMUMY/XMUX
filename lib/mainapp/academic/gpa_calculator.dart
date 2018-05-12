import 'package:flutter/material.dart';
import 'package:xmux/mainapp/academic/academic_handler.dart';
import 'package:xmux/translations/translation.dart';

class GPACalculatorPage extends StatefulWidget {
  static const Map<String, double> gradePoints = {
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

  static Color getGPAColor(double point) {
    if (point >= 3.7)
      return Colors.green;
    else if (point >= 1.7)
      return Colors.orange;
    else
      return Colors.red;
  }

  static double calculateGPA(List<_CourseInfo> courses) {
    int totalCredits = 0;
    double gpa = 0.0;
    for (var i in courses) totalCredits += i.credits;
    for (var i in courses) {
      gpa += gradePoints[i.chosenGrade] * i.credits / totalCredits;
    }
    return gpa;
  }

  @override
  State<StatefulWidget> createState() => _GPACalculatorPageState();
}

class _GPACalculatorPageState extends State<GPACalculatorPage> {
  List<_CourseInfo> courses = [];

  Widget _buildList() => ListView.builder(
        itemCount: courses.length,
        itemBuilder: (_, index) => ListTile(
              title: Text(courses[index].name),
              trailing: DropdownButton<String>(
                value: courses[index].chosenGrade,
                items: GPACalculatorPage.gradePoints.keys
                    .toList()
                    .map((point) => DropdownMenuItem<String>(
                          value: point,
                          child: Text(point),
                        ))
                    .toList(),
                onChanged: (grade) =>
                    setState(() => courses[index].chosenGrade = grade),
              ),
            ),
      );

  @override
  void initState() {
    AcademicHandler.getCourses(context: context).then((coursesData) {
      for (var i in coursesData)
        courses.add(
            _CourseInfo(i["Course Name (by group)"], int.parse(i["Credit"])));
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
              MainLocalizations.of(context).get("Academic/GPACalculator/Name")),
        ),
        body: courses.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                        child: Text(
                          "GPA : " +
                              GPACalculatorPage
                                  .calculateGPA(courses)
                                  .toStringAsFixed(1),
                          style: Theme.of(context).textTheme.display1.copyWith(
                              color: GPACalculatorPage.getGPAColor(
                                  GPACalculatorPage.calculateGPA(courses))),
                        )),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  Flexible(
                    child: _buildList(),
                  ),
                ],
              ),
      );
}

class _CourseInfo {
  final String name;
  final int credits;
  _CourseInfo(this.name, this.credits);

  String chosenGrade = "A";
}
