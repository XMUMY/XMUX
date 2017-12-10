import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.purple[900],
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "X",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 120.0,
                ),
              ),
              new Divider(height: 16.0,),
              new SizedBox(
                width: 100.0,
                child: const LinearProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
              new Column(),
            ],
          ),
        ),
      ),
    );
  }
}