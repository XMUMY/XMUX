import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../util/screen.dart';
import 'calendar/calendar_page.dart';
import 'campus/campus_page.dart';

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
  ];

  int _index = 0;

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
        extended: context.isBetween(Breakpoint.medium) ||
            context.isBetween(Breakpoint.large),
        selectedIndex: _index,
        onDestinationSelected: navigateTo,
        labelType: context.isBetween(Breakpoint.small)
            ? NavigationRailLabelType.selected
            : NavigationRailLabelType.none,
        // TODO: avatar
        leading: const CircleAvatar(
          child: Icon(Icons.access_alarm),
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
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: navigationRail,
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: PageTransitionSwitcher(
                transitionBuilder: (child, animation, secondaryAnimation) {
                  return SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.scaled,
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
        duration: const Duration(milliseconds: 300),
        child: bottomNavigationBar,
      ),
    );
  }
}
