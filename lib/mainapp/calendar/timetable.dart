import 'package:flutter/material.dart';
import 'package:xmux/translations/translation.dart';

class TimeTablePage extends StatelessWidget {
  final List<Map<String, dynamic>> classes;

  TimeTablePage(this.classes, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) => new ListView.builder(
      itemCount: classes.length,
      itemBuilder: (BuildContext context, int index) =>
          new _ClassCard(classes[index]));
}

class _ClassCard extends StatelessWidget {
  // Colors from monday to friday.
  static final List<Color> dayColor = [
    Colors.pink[200],
    Colors.orange[300],
    Colors.green[200],
    Colors.blue[200],
    Colors.purple[300],
  ];

  // Single class object.
  final Map<String, dynamic> theClass;

  _ClassCard(this.theClass);

  // Convert string to TimeOfDay.
  TimeOfDay _getTimeOfDay(String originTime) => new TimeOfDay(
      hour: int.parse(originTime.split(":")[0]),
      minute: int.parse(originTime.split(":")[1]));

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(5.0),
      child: new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: new Center(
                child: new Text(
                  MainLocalizations.of(context).get("Weekdays/" +
                          (theClass["dayOfWeek"] + 1).toString()) +
                      " " +
                      _getTimeOfDay(theClass["startTimeOfDay"])
                          .format(context) +
                      " - " +
                      _getTimeOfDay(theClass["endTimeOfDay"]).format(context) +
                      " " +
                      theClass["classRoom"],
                  style: new TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              color: dayColor[theClass["dayOfWeek"]],
            ),
            new Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      theClass["courseName"],
                      style: Theme
                          .of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.black54),
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(theClass["courseCode"]),
                            new Text(theClass["lecturer"]),
                          ],
                        ),
                      ),
//                      new RaisedButton(
//                        onPressed: (new DateTime.now().hour <
//                                    theClass.startTime.hour + 1 &&
//                                new DateTime.now().hour >
//                                    theClass.startTime.hour - 1)
//                            ? () {}
//                            : null,
//                        child: new Text("Sign"),
//                        color: Theme.of(context).cardColor,
//                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
