import 'package:flutter/material.dart';
import 'package:xmux/events/actions.dart';
import 'package:xmux/init.dart';
import 'package:xmux/translate.dart';

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
        leading: new IconButton(
            icon: new Icon(Icons.view_list),
            onPressed: () {
              actionEventBus.fire(new OpenDrawer(true));
            }),
        title: new Text(MainLocalizations.of(context).get("explore title")),
        backgroundColor: Colors.purple,
      ),
      body: new Center(
        child: new Text("Bdbai 666"),
      ),
    );
  }
}
