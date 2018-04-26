import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/academic/academic_page.dart';
import 'package:xmux/mainapp/calendar/calendar_page.dart';
import 'package:xmux/mainapp/drawer.dart';
import 'package:xmux/mainapp/explore/explore_page.dart';
import 'package:xmux/mainapp/message/message_page.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/translations/translation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  StreamSubscription _drawerListener;
  int _currentIndex = 0;

  @override
  void initState() {
    // Add listener for drawer.
    _drawerListener = mainAppStore.onChange.listen((s) {
      if (s.uiState.drawerIsOpen) {
        _scaffoldKey.currentState.openDrawer();
        mainAppStore.dispatch(OpenDrawerAction(false));
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _drawerListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,

        // Main pages.
        body: Stack(
          children: <Widget>[
            Offstage(
                offstage: _currentIndex != 0,
                child: TickerMode(
                  enabled: _currentIndex == 0,
                  child: MessagePage(),
                )),
            Offstage(
              offstage: _currentIndex != 1,
              child: CalendarPage(),
            ),
            Offstage(
              offstage: _currentIndex != 2,
              child: TickerMode(
                enabled: _currentIndex == 2,
                child: AcademicPage(),
              ),
            ),
            Offstage(
              offstage: _currentIndex != 3,
              child: TickerMode(
                enabled: _currentIndex == 3,
                child: ExplorePage(),
              ),
            ),
          ],
        ),

        // Bottom navigation.
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              title: Text(MainLocalizations.of(context).get("Messages")),
              icon: Icon(Icons.message),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              title: Text(MainLocalizations.of(context).get("Calendar")),
              icon: Icon(Icons.calendar_today),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              title: Text(MainLocalizations.of(context).get("Academic")),
              icon: Icon(Icons.explore),
              backgroundColor: Colors.lightBlue,
            ),
            BottomNavigationBarItem(
              title: Text(MainLocalizations.of(context).get("Explore")),
              icon: Icon(Icons.search),
              backgroundColor: Colors.purple,
            ),
          ],
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          onTap: (int index) => setState(() => _currentIndex = index),
        ),

        // Drawers.
        drawer: DrawerPage(),
        endDrawer: EndDrawer(),
      );
}
