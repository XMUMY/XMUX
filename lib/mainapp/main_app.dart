import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/redux.dart';
import 'package:xmux/translations/translation.dart';

import 'about.dart';
import 'calendar/academic_calendar.dart';
import 'campus/academic_tools/ecr.dart';
import 'campus/academic_tools/exam_result.dart';
import 'campus/academic_tools/geogebra.dart';
import 'campus/academic_tools/gpa_calculator.dart';
import 'campus/academic_tools/tools_details.dart';
import 'campus/academic_tools/vpn.dart';
import 'campus/academic_tools/wolfram_engine/input_constructor.dart';
import 'campus/bus_schedule.dart';
import 'campus/klia_express.dart';
import 'campus/travelviser.dart';
import 'explore/lost_and_found/lost_and_found_page.dart';
import 'main_page.dart';
import 'settings/developer_options.dart';
import 'settings/edit_profile.dart';
import 'settings/settings_page.dart';
import 'tools/emergency.dart';
import 'tools/emgs.dart';
import 'tools/epayment.dart';
import 'tools/room_reservation.dart';

class MainApp extends StatelessWidget {
  /// Routes for main app.
  static final routes = <String, WidgetBuilder>{
    '/About': (_) => AboutPage(),
    '/Calendar/CalendarImage': (_) => AcademicCalendarPage(),
    '/Campus/ACTools/Details': (_) => AcademicToolDetailsPage(),
    '/Campus/ACTools/ExamResult': (_) => ExamResultPage(),
    '/Campus/ACTools/WolframEngine': (_) => InputConstructor(),
    '/Campus/ACTools/GeoGebra': (_) => GeoGebraPage(),
    '/Campus/ACTools/GPACalculator': (_) => GPACalculatorPage(),
    '/Campus/ACTools/VPN': (_) => VPNPage(),
    '/Campus/ACTools/ECR': (_) => ElectiveCourseRegistrationPage(),
    '/Campus/Tools/BusSchedule': (_) => BusSchedulePage(),
    '/Campus/Tools/KliaExpress': (_) => KliaExpressPage(),
    '/Campus/Tools/Travelviser': (_) => TravelviserPage(),
    '/Campus/Tools/Travelviser/DigitalPass': (_) => DigitalPassPage(),
    '/Explore/LostAndFound': (_) => LostAndFoundPage(),
    '/Me/Epayment': (_) => EPaymentPage(),
    '/Me/RoomReservation': (_) => RoomWebviewPage(),
    '/Me/Emgs': (_) => EmgsPage(),
    '/Me/Emergency': (_) => EmergencyPage(),
    '/Settings': (_) => SettingsPage(),
    '/Settings/ChangeProfile': (_) => ChangeProfilePage(),
    '/Settings/DeveloperOptions': (_) => DeveloperOptionsPage(),
  };

  @override
  Widget build(BuildContext context) {
    return StoreProvider<MainAppState>(
      store: store,
      child: StoreBuilder<MainAppState>(
        builder: (_, s) {
          return MaterialApp(
            title: 'XMUX',
            home: MainPage(),
            theme: s.state.uiState.darkMode
                ? ThemeConfig.defaultDarkTheme
                : ThemeConfig.defaultTheme,
            darkTheme: ThemeData.dark(),
            navigatorObservers: <NavigatorObserver>[
              // Only trace in release mode.
              if (bool.fromEnvironment('dart.vm.product'))
                FirebaseAnalyticsObserver(analytics: firebase.analytics),
            ],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              MainLocalizationsDelegate.delegate,
            ],
            supportedLocales: [
              Locale('en', 'US'),
              Locale('zh', 'CN'),
            ],
            initialRoute: '/',
            routes: routes,
          );
        },
      ),
    );
  }
}
