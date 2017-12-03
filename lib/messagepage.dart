import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) :super(key: key);

  @override
  _MessagePageState createState() => new _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _textController = new TextEditingController();
  final List<Message> _messages = <Message>[];

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      _textController.clear();
      Message message = new Message(
        text: text,
      );
      setState(() {
        _messages.insert(0, message);
      });
    }
  }


  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme
            .of(context)
            .accentColor),
        child: new Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(
                children: <Widget>[
                  new Flexible(
                      child: new TextField(
                        autofocus: false,
                        controller: _textController,
                        onSubmitted: _handleSubmitted,
                        decoration: new InputDecoration.collapsed(
                            hintText: "Send Messages"),
                      )
                  ),
                  new Container(
                    margin: new EdgeInsets.symmetric(horizontal: 4.0),
                    child: new IconButton(
                        icon: new Icon(Icons.send),
                        onPressed: () => _handleSubmitted(_textController.text)
                    ),
                  )
                ]
            )
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Messages"),
        ),
        body: new Column(
            children: <Widget>[
              new Flexible(
                  child: new ListView.builder(
                    padding: new EdgeInsets.all(8.0),
                    reverse: true,
                    itemBuilder: (_, int index) => _messages[index],
                    itemCount: _messages.length,
                  )
              ),
              new Divider(height: 1.0),
              new Container(
                decoration: new BoxDecoration(
                  color: Theme
                      .of(context)
                      .cardColor,
                ),
                child: _buildTextComposer(),
              )
            ]
        )
    );
  }
}

const String _name = "XMU";

class Message extends StatelessWidget {
  Message({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: new CircleAvatar(child: new Text(_name[0])),
              ),
              new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(_name, style: Theme
                        .of(context)
                        .textTheme
                        .subhead),
                    new Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: new Text(text),
                    )
                  ]
              )
            ]
        )
    );
  }
}