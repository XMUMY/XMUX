import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Message extends StatelessWidget {
  Message({this.name, this.text, this.animationController});

  final String name;
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController,
            curve: Curves.linear
        ),
        axisAlignment: 0.0,
        child: new Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: new CircleAvatar(child: new Text(name[0])),
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(name, style: Theme
                      .of(context)
                      .textTheme
                      .subhead),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.80,
                      child: new Text(text),),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}

class MessageScreen extends StatefulWidget {
  @override
  State createState() => new _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with TickerProviderStateMixin {

  final List<Message> _messages = <Message>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      _textController.clear();
      setState(() {
        _isComposing = false;
      });
      Message message = new Message(
        name: "Me",
        text: text,
        animationController: new AnimationController(
          duration: new Duration(milliseconds: 700),
          vsync: this,
        ),
      );
      _messages.insert(0, message);
      message.animationController.forward();
      _getReply(text);
    }
  }

  Future<bool> _getReply(String text) async {
    var response = await http.post(
        "https://xmux.azurewebsites.net/chat", body: {"msg": text});
    if (response.statusCode >= 500)
      return false;
    var resJson = JSON.decode(response.body);
    Message message = new Message(
      text: resJson["reply"],
      name: "Bdbai",
    );
    print(message);
    _messages.insert(0, message);
    message.animationController.forward();
    return true;
  }

  void dispose() {
    for (Message message in _messages)
      message.animationController.dispose();
    super.dispose();
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme
          .of(context)
          .accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.isNotEmpty;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration:
                new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme
                    .of(context)
                    .platform == TargetPlatform.iOS
                    ? new CupertinoButton(
                  child: new Text("Send"),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null,
                )
                    : new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null,
                )),
          ]),
          decoration: Theme
              .of(context)
              .platform == TargetPlatform.iOS
              ? new BoxDecoration(
              border:
              new Border(top: new BorderSide(color: Colors.grey[200])))
              : null),
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Messages"),
          elevation:
          Theme
              .of(context)
              .platform == TargetPlatform.iOS ? 0.0 : 4.0
      ),
      body: new Container(
          child: new Column(
              children: <Widget>[
                new Card(
                  child: new Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.95,
                    child: new Text("Payment message"),
                  ),
                ),
                new Flexible(
                    child: new ListView.builder(
                      padding: new EdgeInsets.all(8.0),
                      reverse: true,
                      itemBuilder: (_, int index) => _messages[index],
                      itemCount: _messages.length,
                    )
                ),
                new Container(
                  decoration: new BoxDecoration(
                      color: Theme
                          .of(context)
                          .cardColor),
                  child: _buildTextComposer(),
                ),
              ]
          ),
          decoration: Theme
              .of(context)
              .platform == TargetPlatform.iOS
              ? new BoxDecoration(
              border: new Border(top: new BorderSide(color: Colors.grey[200])))
              : null),
    );
  }
}