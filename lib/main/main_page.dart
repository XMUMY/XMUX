import 'package:animations/animations.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';

import '../global.dart';
import '../redux/state/state.dart';
import '../util/screen.dart';
import 'calendar/calendar_page.dart';
import 'campus/campus_page.dart';
import 'drawer.dart';

const mainPages = <TopLevelPage>[
  CalendarPage(),
  CampusPage(),
];

abstract class TopLevelPage implements Widget {
  String get path;

  String get label;

  Widget get icon;

  Widget get activeIcon;
}

class MainPage extends StatefulWidget {
  final int index;

  const MainPage({Key? key, this.index = 0}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _index = 0;

  void navigateTo(int index) {
    if (!mounted || index == _index) return;
    context.go('/M/${mainPages[index].path}');
  }

  @override
  void initState() {
    _index = widget.index;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MainPage oldWidget) {
    _index = widget.index;
    super.didUpdateWidget(oldWidget);
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
          for (var page in mainPages)
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
          for (var page in mainPages)
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
                child: mainPages[_index],
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
