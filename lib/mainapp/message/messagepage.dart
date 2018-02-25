import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/initapp/init.dart';
import 'package:xmux/mainapp/message/chatroompage.dart';
import 'package:xmux/mainapp/redux/actions.dart';
import 'package:xmux/translations/translation.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        ///
        leading: new StoreConnector(
          converter: (store) {
            return () => store.dispatch(new openDrawerAction(true));
          },
          builder: (context, callback) {
            return new IconButton(
                icon: new CircleAvatar(
                  radius: 18.0,
                  backgroundImage:
                      new NetworkImage(globalPersonalInfoState.avatarURL),
                ),
                onPressed: callback);
          },
        ),

        ///
        title: new Text(MainLocalizations.of(context).get("messages")),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: new Column(
        children: <Widget>[
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
