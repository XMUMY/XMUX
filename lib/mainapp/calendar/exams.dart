import 'package:flutter/material.dart';

class ExamsPage extends StatelessWidget {
  final List<Map<String, String>> exams;

  ExamsPage(this.exams, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: exams.length,
        itemBuilder: (BuildContext context, int index) {
          return new _ExamCard(exams[index]);
        });
  }
}

class _ExamCard extends StatelessWidget {
  final Map examData;

  _ExamCard(this.examData);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
      child: new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      examData["Course Name"],
                      style: Theme
                          .of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.black54),
                    ),
                  ),
                  new Text(examData["Exam Date"] +
                      " " +
                      examData["Exam Day"] +
                      " " +
                      examData["Exam Time"]),
                  new Text(examData["Exam Venue"]),
                  new Text(examData["Exam Type"]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
