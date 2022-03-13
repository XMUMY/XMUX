import 'package:extended_image/extended_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../global.dart';
import '../../redux/state/state.dart';
import '../../route.dart';
import '../../util/platform.dart';
import '../../util/screen.dart';
import '../main_page.dart';
import 'assignment.dart';
import 'exam.dart';
import 'moodle_notification.dart';
import 'timetable.dart';
import 'upcoming_event.dart';

class CalendarPage extends StatefulWidget implements TopLevelPage {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  String get path => 'Calendar';

  @override
  String get label => LocaleKeys.Calendar_Calendar.tr();

  @override
  Widget get icon => const Icon(Icons.calendar_today_outlined);

  @override
  Widget get activeIcon => const Icon(Icons.calendar_today);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 5, vsync: this);

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: PhysicalModel(
          elevation: 1,
          color: Theme.of(context).shadowColor,
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.surface,
                  offset: const Offset(-1, 0),
                ),
              ],
            ),
            child: Material(
              color: Theme.of(context).colorScheme.surface,
              child: Row(
                children: [
                  if (context.isBetween(Breakpoint.extraSmall))
                    StoreConnector<AppState, String>(
                      distinct: true,
                      converter: (s) =>
                          store.state.user.profile.avatar.isNotEmpty
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
                        Tab(text: LocaleKeys.Calendar_Classes.tr()),
                        Tab(text: LocaleKeys.Calendar_Exams.tr()),
                        Tab(text: LocaleKeys.Calendar_Assignments.tr()),
                        Tab(text: LocaleKeys.Calendar_UpcomingEvents.tr()),
                        Tab(text: LocaleKeys.Calendar_Notifications.tr()),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.calendarAlt),
                    tooltip: LocaleKeys.Calendar_Academic.tr(),
                    onPressed: () {
                      if (isWeb) {
                        launch('http://www.xmu.edu.my/14702/list.htm');
                      } else {
                        context.go('/M/Calendar/AcademicCalendar');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          TimetablePage(),
          ExamPage(),
          AssignmentPage(),
          UpcomingEventPage(),
          MoodleNotificationPage()
        ],
      ),
    );
  }
}
