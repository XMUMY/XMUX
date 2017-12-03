import 'package:flutter/material.dart';
import 'package:xmux/engine/wolframresult.dart';

Color enginePageColor = Colors.orange;
String engineTitle = "Wolfram Engine";

class EnginePage extends StatefulWidget {
  EnginePage({Key key}) :super(key: key);

  @override
  _EnginePageState createState() => new _EnginePageState();
}

class _EnginePageState extends State<EnginePage> {

  final TextEditingController _inputTextController = new TextEditingController();

  Widget buildWolframPage() {
    return new Scaffold(
      body: new Container(
        margin: const EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Flexible(
                child: new Image(
                  width: 150.0,
                  height: 150.0,
                  image: new AssetImage('res/wolfram.png'),
                ),
              ),
              new Text("Search anything by powerful wolfram engine."),
              new Row(
                children: <Widget>[
                  new Flexible(
                      child: new TextField(
                        autofocus: false,
                        controller: _inputTextController,
                        onSubmitted: null,
                        decoration: new InputDecoration.collapsed(
                            hintText: 'Push SEND button to use constructor'
                        ),
                        onChanged: (string) {},
                      )
                  ),
                  new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: () {
                      if (_inputTextController.text.isEmpty)
                        Navigator.of(context).pushNamed("/engine/constructor");
                      else
                        Navigator.of(context).push(
                            new MaterialPageRoute<Null>(
                              builder: (BuildContext context) {
                                return new WolframResult(
                                    _inputTextController.text);
                              },
                            ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(engineTitle),
        backgroundColor: enginePageColor,

      ),
      body: buildWolframPage(),
    );
  }
}