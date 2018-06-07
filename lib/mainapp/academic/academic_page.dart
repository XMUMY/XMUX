import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/state.dart';
import 'package:xmux/translations/translation.dart';

class AcademicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: StoreConnector<MainAppState, VoidCallback>(
            converter: (store) => () => store.dispatch(OpenDrawerAction(true)),
            builder: (context, callback) =>
                IconButton(icon: Icon(Icons.view_list), onPressed: callback),
          ),
          title: Text(MainLocalizations.of(context).get("Academic")),
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
          children: <Widget>[
            Row(children: <Widget>[
              Text(
                "  Tools",
                style: Theme.of(context).textTheme.title,
              ),
              FlatButton(
                child: Text("More"),
                onPressed: () {},
              ),
            ]),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _ToolsButton(
                    icon: Image.asset("res/academic/wolfram.png"),
                    title: "Academic/Tools/WolframEngine/Title",
                    path: "/Academic/Tools/WolframEngine"),
                _ToolsButton(
                    icon: Image.asset("res/academic/geogebra.png"),
                    title: "Academic/Tools/GeoGebra/Title",
                    path: "/Academic/Tools/GeoGebra"),
                _ToolsButton(
                    icon: Image.asset("res/academic/gpa.png"),
                    title: "Academic/Tools/GPACalculator/Name",
                    path: "/Academic/Tools/GPACalculator"),
                _ToolsButton(
                    icon: Icon(
                      Icons.local_hospital,
                      size: 60.0,
                      color: Colors.red,
                    ),
                    title: "Academic/Tools/ExamResult/Title",
                    path: "/Academic/Tools/ExamResult"),
              ],
            ),
            Text(
              "  Public talks",
              style: Theme.of(context).textTheme.title,
            ),
            Divider(),
          ],
        ),
      );
}

class _ToolsButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final String path;

  _ToolsButton(
      {@required this.icon, @required this.title, @required this.path});

  @override
  Widget build(BuildContext context) => Container(
        height: 80.0,
        width: 80.0,
        margin: EdgeInsets.all(7.0),
        child: IconButton(
          icon: icon,
          onPressed: () => Navigator.of(context).pushNamed(path),
          tooltip: MainLocalizations.of(context).get(title),
          iconSize: 80.0,
        ),
      );
}
