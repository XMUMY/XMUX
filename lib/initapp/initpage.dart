import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.black,
        body: new Stack(
          children: <Widget>[
            new DecoratedBox(
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
                  ),
                  new SizedBox(
                    width: 100.0,
                    child: const LinearProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
                  new Divider(
                    height: 30.0,
                  ),
                  new Text(
                    "Beta Channel",
                    style: new TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
