import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/message/chatroom/chat_room_page.dart';
import 'package:xmux/mainapp/message/home_slider.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/state.dart';
import 'package:xmux/translations/translation.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new StoreBuilder(
          builder: (BuildContext context, Store<MainAppState> store) =>
              new IconButton(
                icon: new CircleAvatar(
                  radius: 18.0,
                  backgroundImage: new NetworkImage(firebaseUser.photoUrl),
                ),
                onPressed: () => store.dispatch(new OpenDrawerAction(true)),
              ),
        ),
        title: new Text(MainLocalizations.of(context).get("messages")),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            child: new HomeSlider(context),
            width: MediaQuery.of(context).size.width,
            height: 200.0,
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 0.0),
            child: new Card(
              child: new MaterialButton(
                child: new Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              "Global Chatroom",
                              style: Theme.of(context).textTheme.title,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new GlobalChatroomPage()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
