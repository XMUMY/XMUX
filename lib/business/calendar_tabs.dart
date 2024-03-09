import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../component/tab_shell_container.dart';
import '../foundation/localization/locale_keys.dart';
import '../foundation/platform/platform.dart';

class CalendarTabs implements TabInformationProvider {
  static const _translations = {
    '/calendar/timetable': LocaleKeys.Calendar_Classes,
    '/calendar/exam': LocaleKeys.Calendar_Exams,
    '/calendar/assignment': LocaleKeys.Calendar_Assignments,
    '/calendar/upcoming_event': LocaleKeys.Calendar_UpcomingEvents,
    '/calendar/moodle_notification': LocaleKeys.Calendar_Notifications,
  };

  const CalendarTabs();

  @override
  Widget? buildLeading(BuildContext context) => null;

  @override
  Widget? buildTrailing(BuildContext context) => IconButton(
        icon: const Icon(Icons.calendar_month),
        tooltip: LocaleKeys.Calendar_Academic.tr(),
        onPressed: () {
          if (isWeb) {
            launchUrlString('https://www.xmu.edu.my/14702/list.htm');
          } else {
            context.push('/calendar/academic_calendar');
          }
        },
      );

  @override
  Iterable<(int, String)> getTabs(Iterable<(int, String)> branches) =>
      branches.map((e) => (e.$1, _translations[e.$2]!.tr()));
}
