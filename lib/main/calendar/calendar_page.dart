import 'package:flutter/material.dart';

import '../main_page.dart';
import 'timetable.dart';

class CalendarPage extends StatelessWidget implements TopLevelPage {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  String get label => 'Calendar';

  @override
  Widget get icon => const Icon(Icons.calendar_today_outlined);

  @override
  Widget get activeIcon => const Icon(Icons.calendar_today);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                  BoxShadow(
                    color: Theme.of(context).colorScheme.surface,
                    offset: const Offset(-1, 0),
                  ),
                ],
              ),
              child: const TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: 'Timetable'),
                  Tab(text: 'Exam'),
                  Tab(text: 'Assignment'),
                ],
              ),
            ),
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 100),
        ),
        body: const TabBarView(
          children: [
            TimetablePage(),
            Center(
              child: Text('2'),
            ),
            Center(
              child: Text('3'),
            ),
          ],
        ),
      ),
    );
  }
}
