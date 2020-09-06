import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/components/blur_box.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/main_app/main_page.dart';
import 'package:xmux/modules/attendance/attendance.dart';
import 'package:xmux/redux/redux.dart';

import 'assignment.dart';
import 'attendance.dart';
import 'exam.dart';
import 'notification.dart';
import 'timetable.dart';

class CalendarPage extends StatelessWidget implements MainPageContentProvider {
  @override
  bool get extendBody => true;

  Color getColor(BuildContext context) =>
      context.store.state.settingState.enableBlur
          ? Theme.of(context).primaryColor.withOpacity(0.7)
          : Theme.of(context).primaryColor;

  @override
  BottomNavigationBarItem buildBottomNavigationBarItem(BuildContext context) =>
      BottomNavigationBarItem(
        label: LocaleKeys.Calendar.tr(),
        icon: Icon(Icons.calendar_today),
        backgroundColor: getColor(context),
      );

  @override
  NavigationRailDestination buildNavigationRailDestination(
          BuildContext context) =>
      NavigationRailDestination(
        icon: Icon(Icons.calendar_today),
        label: Text(LocaleKeys.Calendar.tr()),
      );

  @override
  Widget build(BuildContext context) {
    Widget leading;
    if (MediaQuery.of(context).size.shortestSide < 720)
      leading = IconButton(
        icon: const Icon(Icons.menu),
        onPressed: Scaffold.of(context).openDrawer,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );

    PreferredSizeWidget appBar = AppBar(
      backgroundColor: getColor(context),
      leading: leading,
      title: Text(LocaleKeys.Calendar.tr()),
      actions: <Widget>[
        IconButton(
          icon: Icon(FontAwesomeIcons.calendarAlt),
          tooltip: LocaleKeys.Calendar_Academic.tr(),
          onPressed: () =>
              Navigator.of(context).pushNamed('/Calendar/CalendarImage'),
        )
      ],
      bottom: TabBar(
        isScrollable: true,
        tabs: <Tab>[
          Tab(text: LocaleKeys.Calendar_Classes.tr()),
          if (context.store.state.user.isStudent) ...{
            Tab(text: LocaleKeys.Calendar_Exams.tr()),
            Tab(text: LocaleKeys.Calendar_Assignments.tr()),
          },
          Tab(text: LocaleKeys.Calendar_Notifications.tr()),
          if (AttendanceApi().available)
            Tab(text: LocaleKeys.Calendar_Attendance.tr()),
        ],
      ),
    );

    if (context.store.state.settingState.enableBlur)
      appBar = PreferredSize(
        preferredSize: appBar.preferredSize,
        child: GaussianBlurBox(
          sigma: 10,
          child: appBar,
        ),
      );

    var tabLength = 2;
    if (context.store.state.user.isStudent) tabLength += 2;
    if (AttendanceApi().available) tabLength++;

    return DefaultTabController(
      length: tabLength,
      child: Scaffold(
        appBar: appBar,
        extendBodyBehindAppBar: true,
        body: StoreConnector<MainAppState, QueryState>(
          converter: (s) => s.state.queryState,
          builder: (BuildContext context, state) => TabBarView(
            children: <Widget>[
              TimeTablePage(state.timetable),
              if (context.store.state.user.isStudent) ...{
                ExamsPage(state.exams),
                AssignmentPage(state.assignments),
              },
              NotificationPage(),
              if (AttendanceApi().available) AttendancePage(),
            ],
          ),
        ),
      ),
    );
  }
}
