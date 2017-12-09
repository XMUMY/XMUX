import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ClassesPage extends StatelessWidget {
  final Map rawData;

  ClassesPage(this.rawData);

  List<_Class> classes = [];

  void _classConvert() {
    for (var i in rawData["classes"]) {
      List<String> detail = i["class"].split("\n");
      classes.add(
        new _Class(
          i["day"] * 100 + i["time"][0],
          day: rawData["weekdays"][i["day"]],
          startTime: rawData["periods"][i["time"].first].split("-")[0],
          endTime: rawData["periods"][i["time"].first].split("-")[1],
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
  final String day, startTime, endTime, classID, name, lecturer, room, period;

  _Class(this.id, {
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

  @override
  Widget build(BuildContext context) {
    final TextStyle descriptionStyle = Theme
        .of(context)
        .textTheme
        .subhead;

    return new Container(
      margin: const EdgeInsets.all(5.0),
//      height: 100.0,
      child: new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // three line description
                  new Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      theClass.name,
                      style:
                      descriptionStyle.copyWith(color: Colors.black54),
                    ),
                  ),
                  new Text(theClass.classID),
                  new Text(theClass.lecturer),
                  new Text(theClass.day+" "+theClass.startTime+"-"+theClass.endTime),
                  new Text(theClass.room),
                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}
