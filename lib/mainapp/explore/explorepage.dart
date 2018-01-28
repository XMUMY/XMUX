import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/mainapp/redux/actions.dart';
import 'package:xmux/translations/translation.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new StoreConnector(
          converter: (store) {
            return () => store.dispatch(new openDrawerAction(true));
          },
          builder: (context, callback) {
            return new IconButton(
                icon: new Icon(Icons.view_list), onPressed: callback);
          },
        ),
        title: new Text(MainLocalizations.of(context).get("explore")),
        backgroundColor: Colors.purple,
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.all(10.0),
              child: new Card(
                child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        width: MediaQuery.of(context).size.width - 50.0,
                        child: new Text(
                            "Warning! These functions are still under developing."),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            new FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "/explore/lostandfound");
              },
              child: new Row(
                children: <Widget>[
                  new Icon(Icons.find_in_page),
                  new Text(
                    " " + MainLocalizations.of(context).get("lostandfound"),
                    style: Theme.of(context).textTheme.subhead,
                  )
                ],
              ),
            ),
            new FlatButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    new SnackBar(content: new Text("Coming soon...")));
              },
              child: new Row(
                children: <Widget>[
                  new Icon(FontAwesomeIcons.table),
                  new Text(
                    " " + MainLocalizations.of(context).get("roomreservation"),
                    style: Theme.of(context).textTheme.subhead,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
