import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart';
import 'package:xmus_client/api/user.pb.dart';

import '../../component/gravatar.dart';
import '../../global.dart';
import '../../redux/state/state.dart';
import '../../util/screen.dart';
import '../../util/tab.dart';
import '../../util/tracker.dart';
import '../chat/chat_tab.dart';
import '../chat/online_tab.dart';
import '../main_page.dart';
import 'discover_tab.dart';

class CommunityPage extends StatefulWidget implements TopLevelPage {
  const CommunityPage({super.key});

  @override
  String get path => 'Community';

  @override
  String get label => LocaleKeys.Community_Community.tr();

  @override
  Widget get icon => const Icon(Icons.chat_outlined);

  @override
  Widget get activeIcon => const Icon(Icons.chat);

  static List<TabEntry> get tabs => [
        const DiscoverTab(),
        if (store.state.settings.enableDevFunctions) const ChatTab(),
        if (store.state.settings.enableDevFunctions) const OnlineTab(),
      ];

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin, RouteAware {
  late final TabController _controller;
  final _tabs = CommunityPage.tabs;
  var currentIndex = -1;

  String get currentTabScreenName =>
      '/Community/${CommunityPage.tabs[currentIndex].path}';

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

    _controller = TabController(length: _tabs.length, vsync: this)
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
          preferredSize: const Size.fromHeight(48),
          child: Material(
            elevation: 1,
            color: Theme.of(context).colorScheme.surface,
            child: Row(
              children: [
                if (context.isBetween(Breakpoint.extraSmall))
                  IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: StoreConnector<AppState, Profile>(
                      distinct: true,
                      converter: (s) => store.state.user.profile,
                      builder: (_, profile) => Gravatar(
                        url: profile.avatar,
                        fallbackName: profile.displayName,
                      ),
                    ),
                    iconSize: 30,
                  ),
                Expanded(
                  child: TabBar(
                    isScrollable: true,
                    controller: _controller,
                    dividerHeight: 0,
                    tabAlignment: TabAlignment.start,
                    tabs: _tabs.map((e) => Tab(text: e.label)).toList(),
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
          children: _tabs,
        ),
      ),
    );
  }
}
