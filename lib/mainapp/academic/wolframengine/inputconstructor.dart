import 'package:flutter/material.dart';
import 'package:xmux/mainapp/academic/wolframengine/result.dart';
import 'package:xmux/translations/translation.dart';

class InputConstructor extends StatefulWidget {
  InputConstructor({Key key}) : super(key: key);

  @override
  _InputConstructorState createState() => new _InputConstructorState();
}

class _InputConstructorState extends State<InputConstructor> {
  final TextEditingController _inputTextController =
      new TextEditingController();

  Widget getInputButton(String inputButton) {
    return new IconButton(
        icon: new Text(
          inputButton,
          style: new TextStyle(fontSize: 25.0),
        ),
        onPressed: () {
          if (_inputTextController.text.isNotEmpty) {
            var baseOffset = _inputTextController.selection.baseOffset;
            _inputTextController.text = _inputTextController.text
                    .substring(0, _inputTextController.selection.baseOffset) +
                inputButton +
                _inputTextController.text.substring(
                    _inputTextController.selection.baseOffset,
                    _inputTextController.text.length);
            _inputTextController.selection =
                new TextSelection.collapsed(offset: baseOffset + 1);
          } else {
            _inputTextController.text += inputButton;
            _inputTextController.selection =
                new TextSelection.collapsed(offset: 1);
          }
        });
  }

  String dropdown2Value;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange,
        title: new Text(MainLocalizations
            .of(context)
            .get("academic/wolframengine/inputconstructor")),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: new Row(
              children: <Widget>[
                new Flexible(
                    child: new TextField(
                  autofocus: true,
                  controller: _inputTextController,
                  onSubmitted: null,
                  decoration:
                      new InputDecoration(hintText: 'Search anything !'),
                  onChanged: (string) {},
                )),
                new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute<Null>(
                      builder: (BuildContext context) {
                        return new WolframResult(_inputTextController.text);
                      },
                    ));
                  },
                ),
              ],
            ),
          ),
          new ListTile(
            title: const Text('Commonly used:'),
            trailing: new DropdownButton<String>(
              value: dropdown2Value,
              hint: const Text('Choose'),
              onChanged: (String command) {
                setState(() {
                  _inputTextController.text += command;
                  _inputTextController.selection = new TextSelection.collapsed(
                      offset: _inputTextController.text.length);
                });
              },
              items: <String>[
                'solve',
                'upper triangular',
                'row reduce',
                'integral'
              ].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getInputButton("+"),
              getInputButton("-"),
              getInputButton("*"),
              getInputButton("/"),
              getInputButton("["),
              getInputButton("]"),
              getInputButton("^"),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getInputButton("("),
              getInputButton(")"),
              getInputButton("{"),
              getInputButton("}"),
              getInputButton("="),
              getInputButton("x"),
              getInputButton("y"),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getInputButton(","),
              getInputButton("%"),
              new MaterialButton(
                child: new Text(MainLocalizations
                    .of(context)
                    .get("academic/wolframengine/inputconstructor/clearall")),
                onPressed: () {
                  _inputTextController.clear();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
