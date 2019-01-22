import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/academic/academic_page.dart';
import 'package:xmux/mainapp/calendar/calendar_page.dart';
import 'package:xmux/mainapp/drawer.dart';
import 'package:xmux/mainapp/explore/explore_page.dart';
import 'package:xmux/mainapp/home/home_page.dart';
import 'package:xmux/redux/redux.dart';

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
        store.dispatch(UpdateHomepageAnnouncementsAction());
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
    _drawerListener = store.onChange.listen((s) {
      if (s.uiState.drawerIsOpen) {
        _scaffoldKey.currentState.openDrawer();
        store.dispatch(OpenDrawerAction(false));
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
        body: _getPage(_currentIndex),

        // Bottom navigation.
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                title: Text(i18n('Home', context)),
                icon: Icon(Icons.home),
                backgroundColor: Theme.of(context).primaryColor),
            BottomNavigationBarItem(
                title: Text(i18n('Calendar', context)),
                icon: Icon(Icons.calendar_today),
                backgroundColor: Theme.of(context).primaryColor),
            BottomNavigationBarItem(
                title: Text(i18n('Academic', context)),
                icon: Icon(FontAwesomeIcons.graduationCap),
                backgroundColor: Colors.lightBlue),
            BottomNavigationBarItem(
                title: Text(i18n('Explore', context)),
                icon: Icon(Icons.explore),
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
