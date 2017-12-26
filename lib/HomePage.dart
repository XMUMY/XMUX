import 'package:flutter/material.dart';
import 'package:xmux/academic/academicpage.dart';
import 'package:xmux/calendar/calendarpage.dart';
import 'package:xmux/config.dart';
import 'package:xmux/drawer.dart';
import 'package:xmux/events/actions.dart';
import 'package:xmux/explore/explorepage.dart';
import 'package:xmux/init.dart';
import 'package:xmux/message/messagepage.dart';
import 'package:xmux/translate.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    actionEventBus.on(OpenDrawer).listen((OpenDrawer a) {
      if (a.openDrawer) _scaffoldKey.currentState.openDrawer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
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
              child: new AcademicPage(),
            ),
          ),
          new Offstage(
            offstage: _currentIndex != 3,
            child: new TickerMode(
              enabled: _currentIndex == 3,
              child: new Scaffold(
                body: new ExplorePage(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            title:
                new Text(MainLocalizations.of(context).get("messages title")),
            icon: new Icon(Icons.comment),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          new BottomNavigationBarItem(
            title:
                new Text(MainLocalizations.of(context).get("calendar title")),
            icon: new Icon(Icons.calendar_today),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          new BottomNavigationBarItem(
            title:
                new Text(MainLocalizations.of(context).get("academic title")),
            icon: new Icon(Icons.explore),
            backgroundColor: Colors.lightBlue,
          ),
          new BottomNavigationBarItem(
            title: new Text(MainLocalizations.of(context).get("explore title")),
            icon: new Icon(Icons.search),
            backgroundColor: Colors.purple,
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
      drawer: new DrawerPage(),
      endDrawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new DrawerHeader(
              child: new CircleAvatar(
                radius: 50.0,
                child: new Text(
                  "X",
                  style: new TextStyle(fontSize: 50.0),
                ),
                backgroundColor: Colors.black,
              ),
            ),
            new Expanded(
              child: new Container(
                margin: const EdgeInsets.all(15.0),
                child: new Text(
                  "We still need time to fix bug and build the release version. If you have any problems or suggestions please email us.\n\n Email: x@ctbeta.org",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            new Text("Version : " + AppInfo.version),
          ],
        ),
      ),
    );
  }
}
