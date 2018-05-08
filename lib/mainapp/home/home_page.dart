import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/home/chatroom/chat_room_page.dart';
import 'package:xmux/mainapp/home/home_slider.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/translations/translation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: CircleAvatar(
            radius: 18.0,
            backgroundImage: NetworkImage(firebaseUser?.photoUrl ?? ""),
          ),
          onPressed: () => mainAppStore.dispatch(OpenDrawerAction(true)),
        ),
        title: Text(MainLocalizations.of(context).get("Home")),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            child: new HomeSlider(),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 18 * 9,
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
