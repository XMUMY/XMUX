import 'package:animations/animations.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/main/forum/forum_page.dart';

import '../global.dart';
import '../redux/state/state.dart';
import '../util/screen.dart';
import 'calendar/calendar_page.dart';
import 'campus/campus_page.dart';
import 'drawer.dart';

abstract class TopLevelPage implements Widget {
  String get label;

  Widget get icon;

  Widget get activeIcon;
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const pages = <TopLevelPage>[
    CalendarPage(),
    CampusPage(),
    ForumPage(),
  ];

  var _index = 0;

  void navigateTo(int index) {
    if (!mounted || index == _index) return;
    setState(() => _index = index);
  }

  @override
  Widget build(BuildContext context) {
    Widget navigationRail = const SizedBox();
    Widget bottomNavigationBar = const SizedBox.shrink();
    if (context.isBetween(Breakpoint.extraSmall)) {
      bottomNavigationBar = BottomNavigationBar(
        enableFeedback: true,
        currentIndex: _index,
        onTap: navigateTo,
        items: [
          for (var page in pages)
            BottomNavigationBarItem(
              icon: page.icon,
              activeIcon: page.activeIcon,
              label: page.label,
            ),
        ],
      );
    } else {
      navigationRail = NavigationRail(
        groupAlignment: -0.95,
        extended: context.isBetween(Breakpoint.medium) ||
            context.isBetween(Breakpoint.large),
        selectedIndex: _index,
        onDestinationSelected: navigateTo,
        labelType: context.isBetween(Breakpoint.small)
            ? NavigationRailLabelType.selected
            : NavigationRailLabelType.none,
        leading: StoreConnector<AppState, String>(
          distinct: true,
          converter: (s) => store.state.user.profile.avatar.isNotEmpty
              ? store.state.user.profile.avatar
              : remoteConfigs.staticResources.defaultAvatar,
          builder: (context, s) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: ExtendedImage.network(s, shape: BoxShape.circle),
            iconSize: 40,
          ),
        ),
        destinations: [
          for (var page in pages)
            NavigationRailDestination(
              icon: page.icon,
              selectedIcon: page.activeIcon,
              label: Text(page.label),
            ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            navigationRail,
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: PageTransitionSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: pages[_index],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: bottomNavigationBar,
      ),
      drawer: const MainDrawer(),
    );
  }
}
