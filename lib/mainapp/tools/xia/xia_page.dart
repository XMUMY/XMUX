import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/flutter_dialogflow.dart';
import 'package:xmux/config.dart';

class XiAPage extends StatefulWidget {
  final _dialogflow =
      Dialogflow(token: ApiKeyConfig.dialogflowToken, language: "zh-CN");
  final _textController = TextEditingController();

  @override
  _XiAPageState createState() => _XiAPageState();
}

class _XiAPageState extends State<XiAPage> {
  String str = "AiX";

  Future<void> _handleQuery(String query) async {
    var res = await widget._dialogflow.sendQuery(query);
    setState(() {
      str = res.getMessageResponse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XiA"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(5.0),
            child: Text(str),
          ),
          Flexible(
            child: ListView(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(children: <Widget>[
              new Flexible(
                child: new TextField(
                  controller: widget._textController,
                  decoration:
                      new InputDecoration.collapsed(hintText: "Ask XiA"),
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleQuery(widget._textController.text),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
