import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../util/screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.university),
            label: 'Campus',
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
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: Text('Calendar'),
          ),
          NavigationRailDestination(
            icon: Icon(FontAwesomeIcons.university),
            label: Text('Campus'),
          ),
        ],
      );
    }

    return Scaffold(
      body: Row(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: navigationRail,
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: PageTransitionSwitcher(
              transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                return child;
              },
              child: Container(),
            ),
          )
        ],
      ),
      bottomNavigationBar: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: bottomNavigationBar,
      ),
    );
  }
}
