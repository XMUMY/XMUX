import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xmux/events/actions.dart';
import 'package:xmux/init.dart';
import 'package:xmux/translations/translation.dart';

class AcademicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.view_list),
            onPressed: () {
              actionEventBus.fire(new OpenDrawer(true));
            }),
        title: new Text(MainLocalizations.of(context).get("academic")),
        backgroundColor: Colors.lightBlue,
      ),
      body: new ListView(
        children: <Widget>[
          new _AcademicPageCard(
            title: MainLocalizations
                .of(context)
                .get("academic/wolframengine/title"),
            caption: MainLocalizations
                .of(context)
                .get("academic/wolframengine/caption"),
            image: "res/wolfram.png",
            route: "/wolframengine/constructor",
          ),
          new _AcademicPageCard(
            title: MainLocalizations
                .of(context)
                .get("academic/gpacalculator/name"),
            caption: MainLocalizations
                .of(context)
                .get("academic/gpacalculator/caption"),
            image: "res/gpa.png",
            route: "/acdemic/gpacalculator",
          ),
        ],
      ),
    );
  }
}

class _AcademicPageCard extends StatelessWidget {
  String title, caption, image, route;

  _AcademicPageCard(
      {@required this.title,
      @required this.caption,
      @required this.image,
      @required this.route});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 0.0),
      child: new Card(
        child: new MaterialButton(
            child: new Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
              child: new Row(
                children: <Widget>[
                  new Image.asset(
                    image,
                    height: 66.0,
                    width: 66.0,
                  ),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        new Divider(
                          height: 5.0,
                          color: Theme.of(context).canvasColor,
                        ),
                        new Text(
                          caption,
                          style: Theme.of(context).textTheme.caption,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, route);
            }),
      ),
    );
  }
}
