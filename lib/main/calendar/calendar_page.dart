import 'package:flutter/material.dart';

import '../../global.dart';
import '../../util/platform.dart';
import '../main_page.dart';
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
        backgroundColor: Theme.of(context).canvasColor,
        appBar: PreferredSize(
          child: Material(
            elevation: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
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
          ),
          preferredSize: const Size.fromHeight(kToolbarHeight),
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
