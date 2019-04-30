import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// This app shows the init animation while initializing.
class InitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                'χ',
                style: TextStyle(color: Colors.white, fontSize: 120.0),
              ),
              Divider(height: 30.0, color: Colors.transparent),
              SpinKitThreeBounce(color: Colors.white, size: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
