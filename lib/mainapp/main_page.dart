import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/drawer.dart';
import 'package:xmux/redux/redux.dart';

import 'calendar/calendar.dart';
import 'campus/campus.dart';
import 'explore/explore_page.dart';
import 'home/home_page.dart';

class MainPage extends StatefulWidget {
  static final pages = <Widget>[
    HomePage(),
    CalendarPage(),
    CampusPage(),
    ExplorePage(),
  ];

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  /// Listener for opening drawer from children.
  StreamSubscription _drawerListener;

  var _currentIndex = 0;
  var _selectedPage = MainPage.pages[0];

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

  void navigateTo(int index) {
    if (!mounted || index == _currentIndex) return;
    setState(() {
      _selectedPage = MainPage.pages[index];
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _drawerListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Main pages.
    var body = PageTransitionSwitcher(
      duration: const Duration(milliseconds: 100),
      transitionBuilder: (
        Widget child,
        Animation<double> primaryAnimation,
        Animation<double> secondaryAnimation,
      ) =>
          FadeTransition(
        child: child,
        opacity: primaryAnimation,
      ),
      child: _selectedPage,
    );

    var bottom = BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          title: Text(S.of(context).Home),
          icon: Icon(Icons.home),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          title: Text(S.of(context).Calendar),
          icon: Icon(Icons.calendar_today),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          title: Text(S.of(context).Campus),
          icon: Icon(FontAwesomeIcons.university),
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).primaryColor
              : Colors.lightBlue,
        ),
        if (P.isMobile)
          BottomNavigationBarItem(
            title: Text(S.of(context).Explore),
            icon: Icon(Icons.explore),
            backgroundColor: Color(0xFF231E5E),
          ),
      ],
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.shifting,
      onTap: navigateTo,
    );

    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        key: _scaffoldKey,
        body: body,
        // Bottom navigation.
        bottomNavigationBar: constraints.maxWidth < 700 ? bottom : null,
        // Drawers.
        drawer: DrawerPage(constraints.maxWidth < 700 ? null : _currentIndex),
        endDrawer: EndDrawer(),
      ),
    );
  }
}
