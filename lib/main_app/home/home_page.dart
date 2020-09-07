import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:waterfall_flow/waterfall_flow.dart';
import 'package:xmux/components/user_profile.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/main_app/calendar/timetable.dart';
import 'package:xmux/main_app/home/announcements.dart';
import 'package:xmux/main_app/home/home_slider.dart';
import 'package:xmux/main_app/main_page.dart';
import 'package:xmux/modules/firebase/firebase.dart';
import 'package:xmux/modules/rpc/clients/aaos.pb.dart';
import 'package:xmux/redux/redux.dart';

class HomePage extends StatelessWidget implements MainPageContentProvider {
  @override
  bool get extendBody => false;

  @override
  Color getColor(BuildContext context) => Theme.of(context).primaryColor;

  @override
  BottomNavigationBarItem buildBottomNavigationBarItem(BuildContext context) =>
      BottomNavigationBarItem(
        label: LocaleKeys.Home.tr(),
        icon: Icon(Icons.home),
        backgroundColor: Theme.of(context).primaryColor,
      );

  @override
  NavigationRailDestination buildNavigationRailDestination(
          BuildContext context) =>
      NavigationRailDestination(
        icon: Icon(Icons.home),
        label: Text(LocaleKeys.Home.tr()),
      );

  @override
  Widget build(BuildContext context) {
    Widget leading;
    if (MediaQuery.of(context).size.width < 720)
      leading = IconButton(
        icon: StoreConnector<MainAppState, String>(
          converter: (s) =>
              s.state.user.profile?.avatar ??
              Firebase.remoteConfigs.staticResources.defaultAvatar,
          builder: (context, s) => UserAvatar(url: s, radius: 18),
        ),
        onPressed: Scaffold.of(context).openDrawer,
      );

    var appBar = AppBar(
      leading: leading,
      title: Text(LocaleKeys.Home.tr()),
    );

    var body = RefreshIndicator(
      onRefresh: () async {
        var newsAction = UpdateHomepageNewsAction(context: context);
        var announcementsAction =
            UpdateHomepageAnnouncementsAction(context: context);
        store.dispatch(newsAction);
        store.dispatch(announcementsAction);
        await newsAction.listener;
        await announcementsAction.listener;
      },
      child: WaterfallFlow(
        gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
          crossAxisCount: max(MediaQuery.of(context).size.width ~/ 400, 1),
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        children: <Widget>[
          // Slider
          AspectRatio(
            aspectRatio: 18 / 9,
            child: HomeSlider(),
          ),

          // Announcements (if have)
          StoreConnector<MainAppState, List>(
            converter: (store) => store.state.uiState.announcements,
            builder: (_, announcements) => HomeAnnouncements(announcements),
          ),

          StoreConnector<MainAppState, List<Timetable_Class>>(
            converter: (s) => s.state.queryState.timetable?.classes ?? null,
            builder: (_, lessons) {
              if (lessons == null || lessons.isEmpty) return Container();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '   ${i18n('Home/NextClass', context)}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  ClassCard(TimeTablePage.sortTimetable(lessons)[0])
                ],
              );
            },
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
