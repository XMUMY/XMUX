import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/states/state.dart';
import 'package:xmux/translations/translation.dart';

class AcademicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: StoreConnector<MainAppState, VoidCallback>(
          converter: (store) => () => store.dispatch(OpenDrawerAction(true)),
          builder: (context, callback) =>
              IconButton(icon: Icon(Icons.view_list), onPressed: callback),
        ),
        title: Text(MainLocalizations.of(context).get("Academic")),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child: Text(
                " " + MainLocalizations.of(context).get("Academic/Tools"),
                style: Theme.of(context).textTheme.title,
              ),
            ),
            FlatButton(
              child: Text(MainLocalizations.of(context).get("Academic/More")),
              onPressed: () =>
                  Navigator.of(context).pushNamed("/Academic/Tools/Details"),
            ),
          ]),
          Divider(
            height: 3.0,
          ),
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
                  icon: Image.asset("res/academic/calculator.png"),
                  title: "Academic/Tools/GPACalculator/Name",
                  path: "/Academic/Tools/GPACalculator"),
              _ToolsButton(
                  icon: Image.asset("res/academic/gpa.png"),
                  title: "Academic/Tools/ExamResult/Title",
                  path: "/Academic/Tools/ExamResult"),
            ],
          ),
          StoreConnector<MainAppState, bool>(
            converter: (s) => s.state.settingState.enableFunctionsUnderDev,
            builder: (_, v) => (v == true)
                ? Row(children: <Widget>[
                    Expanded(
                      child: Text(
                        " " +
                            MainLocalizations.of(context)
                                .get("Academic/PublicTalks"),
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                    FlatButton(
                      child: Text(
                          MainLocalizations.of(context).get("Academic/More")),
                      onPressed: () {},
                    ),
                  ])
                : Container(),
          ),
        ],
      ),
    );
  }
}

class _ToolsButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final String path;

  _ToolsButton(
      {@required this.icon, @required this.title, @required this.path});

  @override
  Widget build(BuildContext context) => Expanded(
        child: IconButton(
          icon: icon,
          onPressed: () => Navigator.of(context).pushNamed(path),
          tooltip: MainLocalizations.of(context).get(title),
          iconSize: MediaQuery.of(context).size.width / 5.5,
        ),
      );
}
