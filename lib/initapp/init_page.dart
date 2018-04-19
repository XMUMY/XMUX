import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('res/initpage.jpg'),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "X",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 120.0,
                  ),
                ),
                Divider(
                  height: 16.0,
                  color: Color(0),
                ),
                SizedBox(
                  width: 100.0,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
