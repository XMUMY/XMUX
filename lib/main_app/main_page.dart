import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xmux/components/blur_box.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/main_app/drawer.dart';
import 'package:xmux/redux/redux.dart';

import 'calendar/calendar.dart';
import 'campus/campus.dart';
import 'explore/explore_page.dart';
import 'home/home_page.dart';

/// Interface for main pages.
abstract class MainPageContentProvider extends Widget {
  /// Whether to extend body behind bottom bar.
  bool get extendBody;

  /// Whether to extend body behind app bar.
  bool get extendBodyBehindAppBar;

  /// Build app bar for scaffold.
  PreferredSizeWidget buildAppBar(BuildContext context);

  /// Build item for [BottomNavigationBar]
  BottomNavigationBarItem buildBottomNavigationBarItem(BuildContext context);
}

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  /// Listener for opening drawer from children.
  StreamSubscription _drawerListener;

  int _currentIndex = 0;
  List<MainPageContentProvider> pages;

  MainPageContentProvider get currentPage => pages[_currentIndex];

  void navigateTo(int index) {
    if (!mounted || index == _currentIndex) return;
    setState(() => _currentIndex = index);
  }

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

    // Initialize pages.
    pages = [
      HomePage(),
      CalendarPage(this),
      CampusPage(),
      ExplorePage(),
    ];

    super.initState();
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
      child: currentPage,
    );

    var bottom = BottomNavigationBar(
      items: [
        pages[0].buildBottomNavigationBarItem(context),
        pages[1].buildBottomNavigationBarItem(context),
        pages[2].buildBottomNavigationBarItem(context),
        if (P.isMobile) pages[3].buildBottomNavigationBarItem(context),
      ],
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.shifting,
      onTap: navigateTo,
    );

    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        key: _scaffoldKey,
        extendBody: currentPage.extendBody,
        extendBodyBehindAppBar: currentPage.extendBodyBehindAppBar,
        appBar: currentPage.buildAppBar(context),
        body: body,
        // Bottom navigation.
        bottomNavigationBar: constraints.maxWidth < 700
            ? GaussianBlurBox(
                sigma: 10.0,
                child: bottom,
              )
            : null,
        // Drawers.
        drawer: DrawerPage(constraints.maxWidth < 700 ? null : _currentIndex),
      ),
    );
  }
}
