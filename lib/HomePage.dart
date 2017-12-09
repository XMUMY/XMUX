import 'package:flutter/material.dart';
import 'package:xmux/calendar/calendarpage.dart';
import 'package:xmux/engine/enginepage.dart';
import 'package:xmux/message/messagepage.dart';
import 'package:xmux/identity/login.dart';

var setter;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: _currentIndex != 0,
            child: new ChatScreen(),
          ),
          new Offstage(
            offstage: _currentIndex != 1,
            child: new EnginePage(),
          ),
          new Offstage(
            offstage: _currentIndex != 2,
            child: new TickerMode(
              enabled: _currentIndex == 2,
              child: new Scaffold(
                body: new CalendarPage(),
              ),
            ),
          ),
          new Offstage(
            offstage: _currentIndex != 3,
            child: new TickerMode(
              enabled: _currentIndex == 3,
              child: new Scaffold(
                body: new LoginPage(),
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
            title: new Text('Engine'),
            icon: new Icon(Icons.explore),
            backgroundColor: enginePageColor,
          ),
          new BottomNavigationBarItem(
            title: new Text('Calendar'),
            icon: new Icon(Icons.calendar_today),
            backgroundColor: Colors.lightBlue,
          ),
          new BottomNavigationBarItem(
            title: new Text('Me'),
            icon: new Icon(Icons.person),
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
      ),
    );
  }
}
