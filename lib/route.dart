import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'init/init_page.dart';
import 'init/login_page.dart';
import 'main/calendar/academic_calendar.dart';
import 'main/campus/bus_schedule.dart';
import 'main/campus/emgs.dart';
import 'main/campus/epayment.dart';
import 'main/campus/geogebra.dart';
import 'main/campus/gpa_calculator.dart';
import 'main/campus/klia_express.dart';
import 'main/campus/lost_and_found/lost_and_found.dart';
import 'main/campus/maintenance/maintenance.dart';
import 'main/campus/transcript.dart';
import 'main/campus/wolfram.dart';
import 'main/main_page.dart';

Page<T> _fade<T>(BuildContext context, GoRouterState state, Widget child) =>
    CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );

final routes = [
  GoRoute(
    path: '/',
    redirect: (_) => '/M/Calendar',
  ),
  GoRoute(
    path: '/Init',
    pageBuilder: (context, state) => _fade(context, state, const InitPage()),
  ),
  GoRoute(
    path: '/Login',
    pageBuilder: (context, state) => _fade(context, state, const LoginPage()),
  ),
  GoRoute(
    path: '/M/:page',
    builder: (context, state) {
      final page = state.params['page'];
      return MainPage(index: mainPages.indexWhere((e) => e.path == page));
    },
    routes: [
      GoRoute(
        path: 'AcademicCalendar',
        builder: (_, s) => AcademicCalendarPage(),
      ),
      GoRoute(
        path: 'WolframEngine',
        builder: (_, s) => const WolframPage(),
      ),
      GoRoute(
        path: 'GeoGebra',
        builder: (_, s) => const GeoGebraPage(),
      ),
      GoRoute(
        path: 'Transcript',
        builder: (_, s) => const TranscriptPage(),
      ),
      GoRoute(
        path: 'GPACalculator',
        builder: (_, s) => const GPACalculatorPage(),
      ),
      GoRoute(
        path: 'BusSchedule',
        builder: (_, s) => const BusSchedulePage(),
      ),
      GoRoute(
        path: 'KliaExpress',
        builder: (_, s) => const KliaExpressPage(),
      ),
      GoRoute(
        path: 'Emgs',
        builder: (_, s) => const EmgsPage(),
      ),
      GoRoute(
        path: 'Maintenance',
        builder: (_, s) => MaintenancePage(),
      ),
      GoRoute(
        path: 'EPayment',
        builder: (_, s) => const EPaymentPage(),
      ),
      GoRoute(
        path: 'LostAndFound',
        builder: (_, s) => const LostAndFoundPage(),
      ),
    ],
  ),
];

const calendarPageNames = [
  '/Calendar/Timetable',
  '/Calendar/Exam',
  '/Calendar/Assignment',
  '/Calendar/UpcomingEvent',
  '/Calendar/MoodleNotification',
];
