import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ClassesPage extends StatelessWidget {
  final Map rawData;

  ClassesPage(this.rawData, {Key key}) : super(key: key);

  List<_Class> classes = [];

  TimeOfDay getTimeOfDay(String rawTime) {
    return new TimeOfDay(
        hour: rawTime[rawTime.length - 2] == 'a'
            ? int.parse(rawTime.split(".")[0])
            : int.parse(rawTime.split(".")[0]) + 12,
        minute: 0);
  }

  void _classConvert() {
    for (var i in rawData["classes"]) {
      List<String> detail = i["class"].split("\n");
      classes.add(
        new _Class(
          i["day"] * 100 + i["time"][0],
          day: rawData["weekdays"][i["day"]],
          startTime:
              getTimeOfDay(rawData["periods"][i["time"].first].split("-")[0]),
          endTime:
              getTimeOfDay(rawData["periods"][i["time"].last].split("-")[1]),
          classID: detail[0],
          name: detail[1],
          lecturer: detail[2],
          room: detail[3],
          period: detail[4],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _classConvert();

    return new ListView.builder(
        itemCount: rawData["classes"].length,
        itemBuilder: (_, int index) {
          return new _ClassCard(classes[index]);
        });
  }
}

class _Class {
  final int id;
  final String day, classID, name, lecturer, room, period;
  final TimeOfDay startTime, endTime;

  _Class(
    this.id, {
    @required this.day,
    @required this.startTime,
    @required this.endTime,
    @required this.classID,
    @required this.name,
    @required this.lecturer,
    @required this.room,
    @required this.period,
  });
}

class _ClassCard extends StatelessWidget {
  final _Class theClass;

  _ClassCard(this.theClass);

  Map dayColor = {
    "Monday": Colors.pink[200],
    "Tuesday": Colors.orange[300],
    "Wednesday": Colors.green[200],
    "Thursday": Colors.blue[200],
    "Friday": Colors.purple[300],
  };

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
                  theClass.day +
                      " " +
                      theClass.startTime.format(context) +
                      " - " +
                      theClass.endTime.format(context) +
                      " " +
                      theClass.room,
                  style: new TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              color: dayColor[theClass.day],
            ),
            new Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      theClass.name,
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
                            new Text(theClass.classID),
                            new Text(theClass.lecturer),
                          ],
                        ),
                      ),
                      new RaisedButton(
                        onPressed: (new DateTime.now().hour <
                                    theClass.startTime.hour + 1 &&
                                new DateTime.now().hour >
                                    theClass.startTime.hour - 1)
                            ? () {}
                            : null,
                        child: new Text("Sign"),
                        color: Theme.of(context).cardColor,
                      )
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
