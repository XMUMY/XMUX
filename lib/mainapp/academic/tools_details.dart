import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xmux/translations/translation.dart';

class AcademicToolDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MainLocalizations.of(context).get("Academic")),
        ),
        body: ListView(
          children: <Widget>[
            _AcademicPageCard(
              title: MainLocalizations
                  .of(context)
                  .get("Academic/WolframEngine/Title"),
              caption: MainLocalizations
                  .of(context)
                  .get("Academic/WolframEngine/Caption"),
              image: "res/academic/wolfram.png",
              route: "/Academic/WolframEngine",
            ),
            _AcademicPageCard(
              title:
                  MainLocalizations.of(context).get("Academic/GeoGebra/Title"),
              caption: MainLocalizations
                  .of(context)
                  .get("Academic/GeoGebra/Caption"),
              image: "res/academic/geogebra.png",
              route: "/Academic/GeoGebra",
            ),
            _AcademicPageCard(
              title: MainLocalizations
                  .of(context)
                  .get("Academic/GPACalculator/Name"),
              caption: MainLocalizations
                  .of(context)
                  .get("Academic/GPACalculator/Caption"),
              image: "res/academic/gpa.png",
              route: "/Academic/GPACalculator",
            ),
          ],
        ),
      );
}

class _AcademicPageCard extends StatelessWidget {
  final String title, caption, image, route;

  _AcademicPageCard(
      {@required this.title,
      @required this.caption,
      @required this.image,
      @required this.route});

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: MaterialButton(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Image.asset(
                  image,
                  height: 66.0,
                  width: 66.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      Divider(
                        height: 5.0,
                        color: Theme.of(context).canvasColor,
                      ),
                      Text(
                        caption,
                        style: Theme.of(context).textTheme.caption,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            onPressed: () => Navigator.pushNamed(context, route)),
      );
}
