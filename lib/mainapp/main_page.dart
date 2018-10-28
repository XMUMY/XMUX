import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/academic/academic_page.dart';
import 'package:xmux/mainapp/calendar/calendar_page.dart';
import 'package:xmux/mainapp/drawer.dart';
import 'package:xmux/mainapp/explore/explore_page.dart';
import 'package:xmux/mainapp/home/home_page.dart';
import 'package:xmux/mainapp/home/homepage_handler.dart';
import 'package:xmux/redux/redux.dart';
import 'package:xmux/translations/translation.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  StreamSubscription _drawerListener;
  int _currentIndex = 0;

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return CalendarPage();
      case 2:
        return AcademicPage();
      case 3:
        return ExplorePage();
      default:
        return HomePage();
    }
  }

  @override
  void initState() {
    // Add listener for drawer.
    _drawerListener = mainAppStore.onChange.listen((s) {
      if (s.uiState.drawerIsOpen) {
        _scaffoldKey.currentState.openDrawer();
        mainAppStore.dispatch(OpenDrawerAction(false));
      }
    });

    // Refresh slider & announcements.
    HomePageHandler.updateNews(context: context).timeout(Duration(seconds: 10));
    HomePageHandler.updateAnnouncements(context: context)
        .timeout(Duration(seconds: 10));

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
        body: _getPage(_currentIndex),

        // Bottom navigation.
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                title: Text(MainLocalizations.of(context).get("Home")),
                icon: Icon(Icons.home),
                backgroundColor: Theme.of(context).primaryColor),
            BottomNavigationBarItem(
                title: Text(MainLocalizations.of(context).get("Calendar")),
                icon: Icon(Icons.calendar_today),
                backgroundColor: Theme.of(context).primaryColor),
            BottomNavigationBarItem(
                title: Text(MainLocalizations.of(context).get("Academic")),
                icon: Icon(Icons.explore),
                backgroundColor: Colors.lightBlue),
            BottomNavigationBarItem(
                title: Text(MainLocalizations.of(context).get("Explore")),
                icon: Icon(Icons.search),
                backgroundColor: Colors.indigo[800]),
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
