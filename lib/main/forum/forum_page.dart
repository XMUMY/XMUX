import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart';

import '../../global.dart';
import '../../redux/state/state.dart';
import '../../util/screen.dart';
import '../../util/tab.dart';
import '../../util/tracker.dart';
import '../main_page.dart';
import 'discover.dart';

class ForumPage extends StatefulWidget implements TopLevelPage {
  const ForumPage({Key? key}) : super(key: key);

  @override
  String get path => 'Community';

  @override
  String get label => LocaleKeys.Community_Community.tr();

  @override
  Widget get icon => const Icon(Icons.chat_outlined);

  @override
  Widget get activeIcon => const Icon(Icons.chat);

  static const tabs = <TabEntry>[
    DiscoverTab(),
  ];

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage>
    with SingleTickerProviderStateMixin, RouteAware {
  late final TabController _controller;
  var currentIndex = -1;

  String get currentTabScreenName =>
      '/Community/${ForumPage.tabs[currentIndex].path}';

  void _onTabChanged() {
    if (_controller.index == currentIndex) return;
    currentIndex = _controller.index;
    // Track tab screen.
    setCurrentScreen(screenName: currentTabScreenName);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    // Restore tab screen.
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setCurrentScreen(screenName: currentTabScreenName),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => routeObserver.subscribe(this, ModalRoute.of(context)!),
    );

    _controller = TabController(length: ForumPage.tabs.length, vsync: this)
      ..addListener(_onTabChanged);
    _onTabChanged(); // Initial tab.

    // Necessary messages for timeago.
    setLocaleMessages('zh', ZhCnMessages());

    super.initState();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Material(
            elevation: 1,
            color: Theme.of(context).colorScheme.surface,
            child: Row(
              children: [
                if (context.isBetween(Breakpoint.extraSmall))
                  StoreConnector<AppState, String>(
                    distinct: true,
                    converter: (s) => store.state.user.profile.avatar.isNotEmpty
                        ? store.state.user.profile.avatar
                        : remoteConfigs.staticResources.defaultAvatar,
                    builder: (_, url) => IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: CircleAvatar(
                        foregroundImage: ExtendedNetworkImageProvider(
                          url,
                          cache: true,
                        ),
                      ),
                      iconSize: 30,
                    ),
                  ),
                Expanded(
                  child: TabBar(
                    isScrollable: true,
                    controller: _controller,
                    tabs:
                        ForumPage.tabs.map((e) => Tab(text: e.label)).toList(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  tooltip: LocaleKeys.Community_Favorites.tr(),
                  onPressed: () => context.go('/Community/Favorite'),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: ForumPage.tabs,
        ),
      ),
    );
  }
}
