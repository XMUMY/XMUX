import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../global.dart';
import '../../util/platform.dart';
import '../main_page.dart';
import 'academic_calendar.dart';
import 'assignment.dart';
import 'exam.dart';
import 'timetable.dart';
import 'upcoming_event.dart';

class CalendarPage extends StatelessWidget implements TopLevelPage {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  String get label => LocaleKeys.Calendar_Calendar.tr();

  @override
  Widget get icon => const Icon(Icons.calendar_today_outlined);

  @override
  Widget get activeIcon => const Icon(Icons.calendar_today);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: PhysicalModel(
            elevation: 1,
            color: Theme.of(context).shadowColor,
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  // Overlap elevation.
                  // TODO: Breaks hit test on web.
                  if (!isWeb)
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
                    Expanded(
                      child: TabBar(
                        isScrollable: true,
                        tabs: [
                          Tab(text: LocaleKeys.Calendar_Classes.tr()),
                          Tab(text: LocaleKeys.Calendar_Exams.tr()),
                          Tab(text: LocaleKeys.Calendar_Assignments.tr()),
                          Tab(text: LocaleKeys.Calendar_UpcomingEvents.tr()),
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AcademicCalendarPage(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            TimetablePage(),
            ExamPage(),
            AssignmentPage(),
            UpcomingEventsPage(),
          ],
        ),
      ),
    );
  }
}
