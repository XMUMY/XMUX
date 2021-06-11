import 'package:flutter/material.dart';

import 'main/calendar/academic_calendar.dart';
import 'main/campus/bus_schedule.dart';
import 'main/campus/emgs.dart';
import 'main/campus/epayment.dart';
import 'main/campus/geogebra.dart';
import 'main/campus/klia_express.dart';
import 'main/campus/lost_and_found/lost_and_found.dart';
import 'main/campus/maintenance/maintenance.dart';
import 'main/campus/transcript.dart';
import 'main/campus/wolfram.dart';

final namedRoutes = <String, WidgetBuilder>{
  '/Calendar/AcademicCalendar': (_) => AcademicCalendarPage(),
  '/Campus/WolframEngine': (_) => const WolframPage(),
  '/Campus/GeoGebra': (_) => const GeoGebraPage(),
  '/Campus/Transcript': (_) => const TranscriptPage(),
  '/Campus/BusSchedule': (_) => const BusSchedulePage(),
  '/Campus/KliaExpress': (_) => const KliaExpressPage(),
  '/Campus/Emgs': (_) => const EmgsPage(),
  '/Campus/Maintenance': (_) => MaintenancePage(),
  '/Campus/EPayment': (_) => const EPaymentPage(),
  '/Campus/LostAndFound': (_) => const LostAndFoundPage(),
};
