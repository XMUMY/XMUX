import 'package:flutter/material.dart';
import 'package:xmux/engine/enginepage.dart';
import 'package:xmux/engine/wolframresult.dart';

class InputConstructor extends StatefulWidget {
  InputConstructor({Key key}) :super(key: key);

  @override
  _InputConstructorState createState() => new _InputConstructorState();
}

class _InputConstructorState extends State<InputConstructor> {

  final TextEditingController _inputTextController = new TextEditingController();

  Widget getInputButton(String inputButton) {
    return new IconButton(
        icon: new Text(inputButton, style: new TextStyle(fontSize: 25.0),),
        onPressed: () {
          if (_inputTextController.text.isNotEmpty) {
            var baseOffset = _inputTextController.selection.baseOffset;
            _inputTextController.text = _inputTextController.text.substring(
                0, _inputTextController.selection.baseOffset) + inputButton +
                _inputTextController.text.substring(
                    _inputTextController.selection.baseOffset,
                    _inputTextController.text.length);
            _inputTextController.selection = new TextSelection.collapsed(
                offset: baseOffset + 1);
          }
          else{
            _inputTextController.text += inputButton;
            _inputTextController.selection = new TextSelection.collapsed(
                offset: 1);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: enginePageColor,
        title: new Text("Input Constructor"),
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
                      decoration: new InputDecoration(
                          hintText: 'Input here ! '
                      ),
                      onChanged: (string) {},
                    )
                ),
                new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () {
                    Navigator.of(context).push(
                        new MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                            return new WolframResult(_inputTextController.text);
                          },
                        ));
                  },
                ),
              ],
            ),
          ),
          new Row(children: <Widget>[
            getInputButton("+"),
            getInputButton("-"),
            getInputButton("*"),
            getInputButton("/"),
            getInputButton("["),
            getInputButton("]"),
            getInputButton("^"),
          ],),
        ],
      ),
    );
  }
}