import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/components/image_editor.dart';
import 'package:xmux/config.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/redux.dart';
import 'package:xmux/translations/translation.dart';

import 'about.dart';
import 'calendar/academic_calendar.dart';
import 'campus/academic_tools/ecr.dart';
import 'campus/academic_tools/exam_result.dart';
import 'campus/academic_tools/geogebra.dart';
import 'campus/academic_tools/gpa_calculator.dart';
import 'campus/academic_tools/vpn.dart';
import 'campus/academic_tools/wolfram_engine/input_constructor.dart';
import 'campus/bus_schedule.dart';
import 'campus/klia_express.dart';
import 'campus/lost_and_found/create.dart';
import 'campus/lost_and_found/square.dart';
import 'campus/maintenance/maintenance.dart';
import 'campus/travelviser.dart';
import 'explore/lost_and_found/lost_and_found_page.dart' as old;
import 'main_page.dart';
import 'settings/developer_options.dart';
import 'settings/edit_profile.dart';
import 'settings/sessions.dart';
import 'settings/settings.dart';
import 'tools/emergency.dart';
import 'tools/emgs.dart';
import 'tools/epayment.dart';
import 'tools/room_reservation.dart';

class MainApp extends StatelessWidget {
  /// Routes for main app.
  static final routes = <String, WidgetBuilder>{
    '/About': (_) => AboutPage(),
    '/Calendar/CalendarImage': (_) => AcademicCalendarPage(),
    '/Campus/ACTools/ExamResult': (_) => ExamResultPage(),
    '/Campus/ACTools/WolframEngine': (_) => InputConstructor(),
    '/Campus/ACTools/GeoGebra': (_) => GeoGebraPage(),
    '/Campus/ACTools/GPACalculator': (_) => GPACalculatorPage(),
    '/Campus/ACTools/VPN': (_) => VPNPage(),
    '/Campus/ACTools/ECR': (_) => ElectiveCourseRegistrationPage(),
    '/Campus/Tools/BusSchedule': (_) => BusSchedulePage(),
    '/Campus/Tools/KliaExpress': (_) => KliaExpressPage(),
    '/Campus/Tools/Maintenance': (_) => MaintenancePage(),
    '/Campus/Tools/Travelviser': (_) => TravelviserPage(),
    '/Campus/Tools/Travelviser/DigitalPass': (_) => DigitalPassPage(),
    '/Campus/Tools/LostAndFound': (_) => LostAndFoundPage(),
    '/Campus/Tools/LostAndFound/New': (_) => NewLostAndFoundPage(),
    '/Components/ImageEditor': (_) => ImageEditorPage(),
    '/Explore/LostAndFound': (_) => old.LostAndFoundPage(),
    '/Me/Epayment': (_) => EPaymentPage(),
    '/Me/RoomReservation': (_) => RoomWebViewPage(),
    '/Me/Emgs': (_) => EmgsPage(),
    '/Me/Emergency': (_) => EmergencyPage(),
    '/Settings': (_) => SettingsPage(),
    '/Settings/ChangeProfile': (_) => EditProfilePage(),
    '/Settings/Sessions': (_) => SessionsPage(),
    '/Settings/DeveloperOptions': (_) => DeveloperOptionsPage(),
  };

  @override
  Widget build(BuildContext context) {
    return StoreProvider<MainAppState>(
      store: store,
      child: StoreConnector<MainAppState, ThemeMode>(
        converter: (s) => s.state.settingState.themeMode,
        builder: (_, themeMode) {
          return MaterialApp(
            title: 'XMUX',
            home: MainPage(),
            theme: ThemeConfig.defaultTheme,
            darkTheme: ThemeConfig.defaultDarkTheme,
            themeMode: themeMode,
            navigatorObservers: <NavigatorObserver>[
              // Only trace in release mode.
              if (P.isVM && bool.fromEnvironment('dart.vm.product'))
                FirebaseAnalyticsObserver(analytics: firebase.analytics),
            ],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              MainLocalizationsDelegate.delegate,
              S.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            initialRoute: '/',
            routes: routes,
          );
        },
      ),
    );
  }
}
