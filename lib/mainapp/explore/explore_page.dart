import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/explore/chat_room_page.dart';
import 'package:xmux/mainapp/explore/eatx/eatx_page.dart';
import 'package:xmux/mainapp/explore/flea_market/flea_market_page.dart';
import 'package:xmux/redux/redux.dart';
import 'package:xmux/translations/translation.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: StoreConnector<MainAppState, VoidCallback>(
          converter: (store) => () => store.dispatch(OpenDrawerAction(true)),
          builder: (context, callback) =>
              IconButton(icon: Icon(Icons.view_list), onPressed: callback),
        ),
        title: Text(MainLocalizations.of(context).get("Explore")),
        backgroundColor: Colors.indigo[800],
      ),
      body: new ListView(
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
                          MainLocalizations.of(context).get("Warning")),
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
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (_) => new GlobalChatroomPage())),
            child: new Row(
              children: <Widget>[
                new Icon(Icons.chat),
                new Text(
                  " " + MainLocalizations.of(context).get("About/Feedback"),
                  style: Theme.of(context).textTheme.subhead,
                )
              ],
            ),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).push(
                new MaterialPageRoute(builder: (_) => new FleaMarketPage())),
            child: new Row(
              children: <Widget>[
                new Icon(Icons.store),
                new Text(
                  " " + i18n("FleaMarket", context),
                  style: Theme.of(context).textTheme.subhead,
                )
              ],
            ),
          ),
          StoreConnector<MainAppState, bool>(
            converter: (s) => s.state.settingState.enableFunctionsUnderDev,
            builder: (_, v) => (v == true)
                ? new FlatButton(
                    onPressed: () => Navigator.of(context).push(
                        new MaterialPageRoute(builder: (_) => new EatXPage())),
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.android),
                        new Text(
                          " " + "EatX",
                          style: Theme.of(context).textTheme.subhead,
                        )
                      ],
                    ),
                  )
                : Container(),
          ),
          StoreConnector<MainAppState, bool>(
            converter: (s) => s.state.settingState.enableFunctionsUnderDev,
            builder: (_, v) => (v == true)
                ? new FlatButton(
                    onPressed: () =>
                        showDialog(context: context, builder: (_) => xiA.page),
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.android),
                        new Text(
                          " " + "XiA",
                          style: Theme.of(context).textTheme.subhead,
                        )
                      ],
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
