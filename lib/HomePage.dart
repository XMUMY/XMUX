import 'package:flutter/material.dart';
import 'package:xmux/calendar/calendarpage.dart';
import 'package:xmux/academic/wolframengine/enginepage.dart';
import 'package:xmux/identity/me.dart';
import 'package:xmux/message/messagepage.dart';
import 'package:xmux/translate.dart';

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
            child: new MessagePage(),
          ),
          new Offstage(
            offstage: _currentIndex != 1,
            child: new CalendarPage(),
          ),
          new Offstage(
            offstage: _currentIndex != 2,
            child: new TickerMode(
              enabled: _currentIndex == 2,
              child: new EnginePage(),
            ),
          ),
          new Offstage(
            offstage: _currentIndex != 3,
            child: new TickerMode(
              enabled: _currentIndex == 3,
              child: new Scaffold(
                body: new MePage(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            title: new Text(MainLocalizations.of(context).get("messages title")),
            icon: new Icon(Icons.comment),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          new BottomNavigationBarItem(
            title: new Text(MainLocalizations.of(context).get("calendar title")),
            icon: new Icon(Icons.calendar_today),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          new BottomNavigationBarItem(
            title: new Text(MainLocalizations.of(context).get("academic title")),
            icon: new Icon(Icons.explore),
            backgroundColor: enginePageColor,
          ),
          new BottomNavigationBarItem(
            title: new Text(MainLocalizations.of(context).get("me title")),
            icon: new Icon(Icons.person),
            backgroundColor: Theme.of(context).primaryColor,
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
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new DrawerHeader(
                child: new CircleAvatar(
              child: new Text("X"),
              backgroundColor: Colors.black,
            )),
            new Container(
              margin: const EdgeInsets.all(15.0),
              child: new Text(
                "We still need time to fix bug and build the release version. If you have any problems or suggestions please email us.\n\n Email: x@ctbeta.org",
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
