import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmus_client/api/forum_thread.pb.dart';

import '../../business/calendar/academic_calendar.dart';
import '../../business/calendar/assignment.dart';
import '../../business/calendar/exam.dart';
import '../../business/calendar/moodle_notification.dart';
import '../../business/calendar/timetable.dart';
import '../../business/calendar/upcoming_event.dart';
import '../../business/calendar_tabs.dart';
import '../../business/campus/bus_schedule.dart';
import '../../business/campus/campus_page.dart';
import '../../business/campus/ecr.dart';
import '../../business/campus/emgs.dart';
import '../../business/campus/epayment.dart';
import '../../business/campus/geogebra.dart';
import '../../business/campus/gpa_calculator.dart';
import '../../business/campus/klia_express.dart';
import '../../business/campus/lost_and_found/lost_and_found.dart';
import '../../business/campus/maintenance/maintenance.dart';
import '../../business/campus/transcript.dart';
import '../../business/campus/wolfram.dart';
import '../../business/community_tabs.dart';
import '../../business/forum/discover_tab.dart';
import '../../business/forum/favorites.dart';
import '../../business/forum/thread_detail.dart';
import '../../business/init/init_page.dart';
import '../../business/init/login_page.dart';
import '../../business/main_page.dart';
import '../../business/profile/me.dart';
import '../../business/redux/store.dart';
import '../../component/tab_shell_container.dart';
import 'transition.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  redirect: (context, state) {
    if (state.uri.toString() == '/init' || state.uri.toString() == '/login') {
      return null;
    }

    if (!store.state.isInitialized) return '/init';
    if (!store.state.user.isSignedIn) return '/login';

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => '/calendar/timetable',
    ),
    GoRoute(
      path: '/init',
      pageBuilder: (context, state) =>
          FadeTransitionPage(key: state.pageKey, child: const InitPage()),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) =>
          FadeTransitionPage(key: state.pageKey, child: const LoginPage()),
    ),
    GoRoute(
      path: '/calendar/academic_calendar',
      builder: (_, s) => AcademicCalendarPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => MainPage(navigationShell: shell),
      branches: [
        StatefulShellBranch(
          routes: [
            StatefulShellRoute(
              builder: (context, state, shell) => shell,
              navigatorContainerBuilder: (_, shell, children) =>
                  TabShellContainer(
                navigationShell: shell,
                tabInformationProvider: const CalendarTabs(),
                children: children,
              ),
              branches: [
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: '/calendar/timetable',
                      builder: (_, s) => const TimetablePage(),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: '/calendar/exam',
                      builder: (_, s) => const ExamPage(),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: '/calendar/assignment',
                      builder: (_, s) => const AssignmentPage(),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: '/calendar/upcoming_event',
                      builder: (_, s) => const UpcomingEventPage(),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: '/calendar/moodle_notification',
                      builder: (_, s) => const MoodleNotificationPage(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            StatefulShellRoute(
              builder: (context, state, shell) => shell,
              navigatorContainerBuilder: (_, shell, children) =>
                  TabShellContainer(
                navigationShell: shell,
                tabInformationProvider: const CommunityTabs(),
                children: children,
              ),
              branches: [
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: '/community/discover',
                      builder: (_, s) => const DiscoverTab(),
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: '/community/thread/:tid',
              builder: (_, s) => ThreadDetailPage(thread: s.extra as Thread),
            ),
            GoRoute(
              path: '/community/favorite/:favorite_tab',
              builder: (_, state) =>
                  FavoritePage.fromTab(state.pathParameters['favorite_tab']),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/campus',
              builder: (_, s) => const CampusPage(),
              routes: [
                GoRoute(
                  path: 'wolfram_engine',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (_, s) => const WolframPage(),
                ),
                GoRoute(
                  path: 'geogebra',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (_, s) => const GeoGebraPage(),
                ),
                GoRoute(
                  path: 'transcript',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (_, s) => const TranscriptPage(),
                ),
                GoRoute(
                  path: 'gpa_calculator',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (_, s) => const GPACalculatorPage(),
                ),
                GoRoute(
                  path: 'elective_course_registration',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (_, s) => const ElectiveCourseRegistrationPage(),
                ),
                GoRoute(
                  path: 'bus_schedule',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (_, s) => const BusSchedulePage(),
                ),
                GoRoute(
                  path: 'klia_express',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (_, s) => const KliaExpressPage(),
                ),
                GoRoute(
                  path: 'emgs',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (_, s) => const EmgsPage(),
                ),
                GoRoute(
                  path: 'maintenance',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (_, s) => MaintenancePage(),
                ),
                GoRoute(
                  path: 'e_payment',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (_, s) => const EPaymentPage(),
                ),
                GoRoute(
                  path: 'lost_and_found',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (_, s) => const LostAndFoundPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (_, s) => const MePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
