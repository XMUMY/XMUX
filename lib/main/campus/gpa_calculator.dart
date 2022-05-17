import 'package:flutter/material.dart';

import '../../global.dart';
import '../../util/screen.dart';
import 'transcript.dart' show GPAColorExtension;

class GPACalculatorPage extends StatefulWidget {
  static const Map<String, double> gradePoints = {
    'A': 4.0,
    'A-': 3.7,
    'B+': 3.3,
    'B': 3.0,
    'B-': 2.7,
    'C+': 2.3,
    'C': 2.0,
    'C-': 1.7,
    'D': 1.0,
    'F': 0.0,
  };

  const GPACalculatorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GPACalculatorPageState();
}

class _GPACalculatorPageState extends State<GPACalculatorPage> {
  List<_Selection> courses = [];

  static double calculateGPA(List<_Selection> courses) {
    var totalCredits = 0;
    var gpa = 0.0;
    for (var i in courses) {
      totalCredits += i.credits;
    }
    for (var i in courses) {
      gpa += GPACalculatorPage.gradePoints[i.chosenGrade]! *
          i.credits /
          totalCredits;
    }
    return gpa;
  }

  @override
  void initState() {
    courses = store.state.queries.courses.courses
        .map((coursesData) => _Selection(coursesData.name, coursesData.credit))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = const Center(child: CircularProgressIndicator());

    if (courses.isNotEmpty) {
      body = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'GPA: ${calculateGPA(courses).toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: calculateGPA(courses).pointColor,
                    ),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: context.padBody),
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
                      setState(() => courses[index].chosenGrade = grade!),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.Campus_GPACalculator.tr())),
      body: body,
    );
  }
}

class _Selection {
  final String name;
  final int credits;

  _Selection(this.name, this.credits);

  String chosenGrade = 'A';
}
