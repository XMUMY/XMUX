import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/components/empty_error_page.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';

/// Get color for GPA point. Return default for N/A.
Color getPointColor(String point, BuildContext ctx) {
  try {
    var p = double.parse(point);
    if (p >= 3.7)
      return Colors.green;
    else if (p >= 1.7)
      return Colors.orangeAccent;
    else
      return Colors.red;
  } catch (e) {
    return Theme.of(ctx).textTheme.title.color;
  }
}

class ExamResultPage extends StatefulWidget {
  @override
  _ExamResultPageState createState() => _ExamResultPageState();
}

class _ExamResultPageState extends State<ExamResultPage> {
  SessionExamResult currentSession;

  Future<Null> _handleUpdate() async {
    var action = UpdateAcAction();
    store.dispatch(action);
    await action.listener;
  }

  @override
  void initState() {
    if (store.state.acState.examResult == null) _handleUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n('Campus/AcademicTools/ExamResult/Title', context)),
        backgroundColor: Colors.lightBlue,
      ),
      body: StoreConnector<MainAppState, List<SessionExamResult>>(
        converter: (s) => s.state.acState.examResult,
        builder: (ctx, results) {
          if (results.isEmpty) return EmptyErrorPage();
          if (currentSession == null) currentSession = results[0];
          return ListView(
            padding: const EdgeInsets.all(5),
            children: <Widget>[
              ListTile(
                title: Text(i18n(
                    'Campus/AcademicTools/ExamResult/ChooseSession', context)),
                trailing: DropdownButton<SessionExamResult>(
                  items: results
                      .map((session) => DropdownMenuItem(
                            child: Text(session.academicSession),
                            value: session,
                          ))
                      .toList(),
                  onChanged: (sessionChosen) {
                    setState(() => currentSession = sessionChosen);
                  },
                  value: currentSession,
                ),
              ),
              Card(
                  margin: const EdgeInsets.all(5),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'GPA : ${currentSession.gpa}',
                            style: Theme.of(context).textTheme.title.copyWith(
                                color:
                                    getPointColor(currentSession.gpa, context)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'CGPA : ${currentSession.cGpa}',
                            style: Theme.of(context).textTheme.title.copyWith(
                                color: getPointColor(
                                    currentSession.cGpa, context)),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )),
              _ResultDetails(currentSession.result)
            ],
          );
        },
      ),
    );
  }
}

class _ResultDetails extends StatelessWidget {
  final List<CourseExamResult> courseResults;

  const _ResultDetails(this.courseResults);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: max(courseResults.length * 2 - 1, 0),
          itemBuilder: (context, i) {
            if (i % 2 != 0) return Divider();
            var courseResult = courseResults[i ~/ 2];
            return Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        courseResult.courseName,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      Divider(height: 8, color: Colors.transparent),
                      Text(
                        '${courseResult.courseCode}  '
                        '${courseResult.credit.toString()} '
                        '${i18n('Campus/AcademicTools/ExamResult/credits', context)}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(3, 3, 12, 3),
                  child: Text(
                    '${courseResult.grade}\n'
                    '${courseResult.gradePoint.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.title.copyWith(
                        color: getPointColor(
                            courseResult.gradePoint.toString(), context)),
                  ),
                )
              ],
            );
          }),
    );
  }
}
