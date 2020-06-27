import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/components/blur_box.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/main_app/main_page.dart';
import 'package:xmux/modules/attendance/attendance.dart';
import 'package:xmux/redux/redux.dart';

import 'assignment.dart';
import 'attendance.dart';
import 'exam.dart';
import 'notification.dart';
import 'timetable.dart';

class CalendarPage extends StatelessWidget implements MainPageContentProvider {
  CalendarPage(TickerProvider vsync)
      : controller = TabController(vsync: vsync, length: tabLength);

  final TabController controller;

  static int get tabLength {
    var tabLength = 2;
    if (store.state.user.isStudent) tabLength += 2;
    if (AttendanceApi().available) tabLength++;
    return tabLength;
  }

  @override
  bool get extendBody => true;

  @override
  bool get extendBodyBehindAppBar => true;

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    var appBar = AppBar(
      backgroundColor: store.state.settingState.enableBlur
          ? Theme.of(context).primaryColor.withOpacity(0.7)
          : Theme.of(context).primaryColor,
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
        controller: controller,
        isScrollable: true,
        tabs: <Tab>[
          Tab(text: LocaleKeys.Calendar_Classes.tr()),
          if (store.state.user.isStudent) ...{
            Tab(text: LocaleKeys.Calendar_Exams.tr()),
            Tab(text: LocaleKeys.Calendar_Assignments.tr()),
          },
          Tab(text: LocaleKeys.Calendar_Notifications.tr()),
          if (AttendanceApi().available)
            Tab(text: LocaleKeys.Calendar_Attendance.tr()),
        ],
      ),
    );

    if (store.state.settingState.enableBlur)
      return PreferredSize(
        preferredSize: appBar.preferredSize,
        child: GaussianBlurBox(
          sigma: 10,
          child: appBar,
        ),
      );

    return appBar;
  }

  @override
  BottomNavigationBarItem buildBottomNavigationBarItem(BuildContext context) =>
      BottomNavigationBarItem(
        title: Text(LocaleKeys.Home.tr()),
        icon: Icon(Icons.home),
        backgroundColor: store.state.settingState.enableBlur
            ? Theme.of(context).primaryColor.withOpacity(0.7)
            : Theme.of(context).primaryColor,
      );

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MainAppState>(
      builder: (BuildContext context, store) => TabBarView(
        controller: controller,
        children: <Widget>[
          TimeTablePage(store.state.queryState.timetable),
          if (store.state.user.isStudent) ...{
            ExamsPage(store.state.acState.exams),
            AssignmentPage(store.state.queryState.assignments),
          },
          NotificationPage(),
          if (AttendanceApi().available) AttendancePage(),
        ],
      ),
    );
  }
}
