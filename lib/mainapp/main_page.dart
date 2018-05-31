import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/academic/academic_page.dart';
import 'package:xmux/mainapp/calendar/calendar_page.dart';
import 'package:xmux/mainapp/drawer.dart';
import 'package:xmux/mainapp/explore/explore_page.dart';
import 'package:xmux/mainapp/home/home_page.dart';
import 'package:xmux/mainapp/home/homepage_handler.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/translations/translation.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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

    // Refresh slider & announcements.
    HomePageHandler.updateNews(context: context).timeout(Duration(seconds: 10));
    HomePageHandler
        .updateAnnouncements(context: context)
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
        body: Stack(
          children: <Widget>[
            Offstage(
              offstage: _currentIndex != 0,
              child: TickerMode(
                enabled: _currentIndex == 0,
                child: HomePage(),
              ),
            ),
            Offstage(
              offstage: _currentIndex != 1,
              child: CalendarPage(),
            ),
            Offstage(
              offstage: _currentIndex != 2,
              child: TickerMode(
                enabled: _currentIndex == 2,
                child: Theme(
                  data: Theme.of(context).copyWith(
                        primaryColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Theme.of(context).primaryColor
                                : Colors.lightBlue,
                      ),
                  child: AcademicPage(),
                ),
              ),
            ),
            Offstage(
              offstage: _currentIndex != 3,
              child: TickerMode(
                enabled: _currentIndex == 3,
                child: Theme(
                  data: Theme.of(context).copyWith(
                        primaryColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Theme.of(context).primaryColor
                                : Colors.purple,
                      ),
                  child: ExplorePage(),
                ),
              ),
            ),
          ],
        ),

        // Bottom navigation.
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              title: Text(MainLocalizations.of(context).get("Home")),
              icon: Icon(Icons.home),
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Theme.of(context).primaryColor
                  : Colors.cyan[400],
            ),
            BottomNavigationBarItem(
              title: Text(MainLocalizations.of(context).get("Calendar")),
              icon: Icon(Icons.calendar_today),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              title: Text(MainLocalizations.of(context).get("Academic")),
              icon: Icon(Icons.explore),
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Theme.of(context).primaryColor
                  : Colors.lightBlue,
            ),
            BottomNavigationBarItem(
              title: Text(MainLocalizations.of(context).get("Explore")),
              icon: Icon(Icons.search),
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Theme.of(context).primaryColor
                  : Colors.purple,
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
