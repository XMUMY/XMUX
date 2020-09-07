import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/components/blur_box.dart';
import 'package:xmux/components/user_profile.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/main_app/drawer.dart';
import 'package:xmux/modules/firebase/firebase.dart';
import 'package:xmux/redux/state/state.dart';

import 'calendar/calendar.dart';
import 'campus/campus.dart';
import 'explore/explore_page.dart';
import 'home/home_page.dart';

/// Interface for main pages.
abstract class MainPageContentProvider extends Widget {
  /// Whether to extend body behind bottom bar.
  bool get extendBody;

  /// Primary color for page.
  Color getColor(BuildContext context);

  /// Build item for [BottomNavigationBar]
  BottomNavigationBarItem buildBottomNavigationBarItem(BuildContext context);

  /// Build destination for [NavigationRail].
  NavigationRailDestination buildNavigationRailDestination(
      BuildContext context);
}

class MainPage extends StatefulWidget {
  final _pageTransitionSwitcherKey = GlobalKey();

  final pages = <MainPageContentProvider>[
    HomePage(),
    CalendarPage(),
    CampusPage(),
    ExplorePage(),
  ];

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _currentIndex = 0;

  MainPageContentProvider get currentPage => widget.pages[_currentIndex];

  void navigateTo(int index) {
    if (!mounted || index == _currentIndex) return;
    setState(() => _currentIndex = index);
  }

  @override
  void initState() {
    // Lock the screen orientation.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Main pages.
    Widget body = PageTransitionSwitcher(
      key: widget._pageTransitionSwitcherKey,
      duration: const Duration(milliseconds: 300),
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

    var bottom = GaussianBlurBox(
      sigma: 10.0,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: [
          widget.pages[0].buildBottomNavigationBarItem(context),
          widget.pages[1].buildBottomNavigationBarItem(context),
          widget.pages[2].buildBottomNavigationBarItem(context),
          if (P.isMobile) widget.pages[3].buildBottomNavigationBarItem(context),
        ],
        currentIndex: _currentIndex,
        onTap: navigateTo,
      ),
    );

    var isWide = MediaQuery.of(context).size.width >= 720;
    if (isWide)
      body = Row(
        children: [
          NavigationRail(
            groupAlignment: 0,
            labelType: NavigationRailLabelType.selected,
            backgroundColor: currentPage.getColor(context),
            leading: StoreConnector<MainAppState, String>(
              converter: (s) =>
                  s.state.user.profile?.avatar ??
                  Firebase.remoteConfigs.staticResources.defaultAvatar,
              builder: (context, url) => IconButton(
                icon: UserAvatar(url: url, radius: 18),
                onPressed: Scaffold.of(context).openDrawer,
              ),
            ),
            destinations: [
              widget.pages[0].buildNavigationRailDestination(context),
              widget.pages[1].buildNavigationRailDestination(context),
              widget.pages[2].buildNavigationRailDestination(context),
              if (P.isMobile)
                widget.pages[3].buildNavigationRailDestination(context),
            ],
            selectedIndex: _currentIndex,
            onDestinationSelected: navigateTo,
          ),
          Expanded(child: body),
        ],
      );

    return Scaffold(
      extendBody: currentPage.extendBody,
      body: body,
      bottomNavigationBar: !isWide ? bottom : null,
      drawer: DrawerPage(),
    );
  }
}
