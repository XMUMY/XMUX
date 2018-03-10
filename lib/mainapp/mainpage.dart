import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xmux/main.dart';
import 'package:xmux/mainapp/academic/academicpage.dart';
import 'package:xmux/mainapp/calendar/calendarpage.dart';
import 'package:xmux/mainapp/drawer.dart';
import 'package:xmux/mainapp/explore/explorepage.dart';
import 'package:xmux/mainapp/message/messagepage.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/translations/translation.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription _drawerListener;
  int _currentIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    _drawerListener = mainAppStore.onChange.listen((s) {
      if (s.drawerIsOpen) {
        _scaffoldKey.currentState.openDrawer();
        mainAppStore.dispatch(new OpenDrawerAction(false));
      }
    });
  }

  @override
  void dispose() {
    _drawerListener.cancel();
    super.dispose();
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
            title: new Text(MainLocalizations.of(context).get("messages")),
            icon: new Icon(Icons.message),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          new BottomNavigationBarItem(
            title: new Text(MainLocalizations.of(context).get("calendar")),
            icon: new Icon(Icons.calendar_today),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          new BottomNavigationBarItem(
            title: new Text(MainLocalizations.of(context).get("academic")),
            icon: new Icon(Icons.explore),
            backgroundColor: Colors.lightBlue,
          ),
          new BottomNavigationBarItem(
            title: new Text(MainLocalizations.of(context).get("explore")),
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
      endDrawer: new EndDrawer(),
    );
  }
}
