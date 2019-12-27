import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/components/page_routes.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/drawer.dart';
import 'package:xmux/redux/redux.dart';

import 'calendar/calendar.dart';
import 'campus/campus.dart';
import 'explore/explore_page.dart';
import 'home/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  /// Used to control the route for home pages.
  final _homePageNavigatorKey = GlobalKey<NavigatorState>();

  StreamSubscription _drawerListener;
  var _currentIndex = 0;
  var _bottomNavigationBarElevation = 0.0;

  @override
  void initState() {
    // Lock the screen orientation.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      // Main pages.
      body: Navigator(
        key: _homePageNavigatorKey,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
            case '/HomePages/0':
              return FadePageRoute(
                  transitionDuration: const Duration(milliseconds: 150),
                  pageBuilder: (_, __, ___) => HomePage());
              break;
            case '/HomePages/1':
              return FadePageRoute(
                  transitionDuration: const Duration(milliseconds: 150),
                  pageBuilder: (_, __, ___) => CalendarPage());
              break;
            case '/HomePages/2':
              return FadePageRoute(
                  transitionDuration: const Duration(milliseconds: 150),
                  pageBuilder: (_, __, ___) => CampusPage());
              break;
            case '/HomePages/3':
              return FadePageRoute(
                  transitionDuration: const Duration(milliseconds: 150),
                  pageBuilder: (_, __, ___) => ExplorePage());
              break;
            default:
              return null;
          }
        },
        observers: <NavigatorObserver>[
          HeroController(),
        ],
      ),

      // Bottom navigation.
      bottomNavigationBar: BottomNavigationBar(
        elevation: _bottomNavigationBarElevation,
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
              title: Text(i18n('Campus', context)),
              icon: Icon(FontAwesomeIcons.university),
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Theme.of(context).primaryColor
                  : Colors.lightBlue),
          BottomNavigationBarItem(
              title: Text(i18n('Explore', context)),
              icon: Icon(Icons.explore),
              backgroundColor: Color(0xFF231E5E)),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (int index) => setState(() {
          _homePageNavigatorKey.currentState
              .pushReplacementNamed('/HomePages/$index');
          _currentIndex = index;
          _bottomNavigationBarElevation = _currentIndex == 3 ? 0.0 : 8.0;
        }),
      ),

      // Drawers.
      drawer: DrawerPage(),
      endDrawer: EndDrawer(),
    );
  }
}
