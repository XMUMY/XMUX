import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.black,
        body: new DecoratedBox(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new AssetImage('res/initpage.jpg'),
            ),
          ),
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
              new Divider(
                height: 16.0,
                color: new Color(0),
              ),
              new SizedBox(
                width: 100.0,
                child: const LinearProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
