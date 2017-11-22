import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Offstage(
              offstage: _currentIndex != 0,
              child: new TickerMode(
                enabled: _currentIndex == 0,
                child: new Scaffold(
                  body: new Text("1"),
                ),
              ),
            ),
            new Offstage(
              offstage: _currentIndex != 1,
              child: new TickerMode(
                enabled: _currentIndex == 1,
                child: new Scaffold(
                  body: new Text("2"),
                ),
              ),
            ),
            new Offstage(
              offstage: _currentIndex != 2,
              child: new TickerMode(
                enabled: _currentIndex == 2,
                child: new Scaffold(
                  body: new Text("3"),
                ),
              ),
            ),
            new Offstage(
              offstage: _currentIndex != 3,
              child: new TickerMode(
                enabled: _currentIndex == 3,
                child: new Scaffold(
                  body: new Text("4"),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              title: new Text('Message'),
              icon: new Icon(Icons.comment),
              backgroundColor: Colors.lightBlue,
            ),
            new BottomNavigationBarItem(
              title: new Text('Tools'),
              icon: new Icon(Icons.build),
              backgroundColor: Colors.lightBlue,
            ),
            new BottomNavigationBarItem(
              title: new Text('Calendar'),
              icon: new Icon(Icons.calendar_today),
              backgroundColor: Colors.lightBlue,
            ),
            new BottomNavigationBarItem(
              title: new Text('Moodle'),
              icon: new Icon(Icons.school),
              backgroundColor: Colors.lightBlue,
            ),
          ],
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          fixedColor: Colors.red,
        ),
        drawer: new Drawer(),
      ),
    );
  }
}
