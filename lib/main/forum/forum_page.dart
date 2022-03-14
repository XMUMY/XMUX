import 'package:extended_image/extended_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../global.dart';
import '../../redux/state/state.dart';
import '../../route.dart';
import '../../util/platform.dart';
import '../../util/screen.dart';
import '../main_page.dart';

class ForumPage extends StatefulWidget implements TopLevelPage {
  const ForumPage({Key? key}) : super(key: key);

  @override
  String get path => 'Forum';

  @override
  String get label => LocaleKeys.Community_Community.tr();

  @override
  Widget get icon => const Icon(Icons.chat_outlined);

  @override
  Widget get activeIcon => const Icon(Icons.chat);

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);

    // Track tab pages.
    if (kReleaseMode && (isMobile || isWeb)) {
      _controller.addListener(
        () => FirebaseAnalytics.instance.setCurrentScreen(
          screenName: calendarPageNames[_controller.index],
        ),
      );
    }

    super.initState();
  }

  @override
  void dispose() {
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
                    tabs: [
                      Tab(text: LocaleKeys.Community_Discover.tr()),
                      Tab(text: LocaleKeys.Community_Forums.tr()),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  tooltip: 'Favorites',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
