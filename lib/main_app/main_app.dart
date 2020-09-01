import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tuple/tuple.dart';
import 'package:xmux/components/image_editor.dart';
import 'package:xmux/components/page_routes.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/redux.dart';
import 'package:xmux/theme.dart';
import 'package:xmux/translations/translation.dart';

import 'calendar/academic_calendar.dart';
import 'campus/academic_tools/ecr.dart';
import 'campus/academic_tools/geogebra.dart';
import 'campus/academic_tools/gpa_calculator.dart';
import 'campus/academic_tools/transcript.dart';
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
import 'settings/settings.dart';
import 'tools/emergency.dart';
import 'tools/emgs.dart';
import 'tools/epayment.dart';
import 'tools/room_reservation.dart';

class MainApp extends StatelessWidget {
  /// Routes for main app.
  static final routes = <String, WidgetBuilder>{
    '/Calendar/CalendarImage': (_) => AcademicCalendarPage(),
    '/Campus/ACTools/Transcript': (_) => TranscriptPage(),
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
  };

  /// The sub-routes are handled by nested navigators.
  static final prefixes = <String, WidgetBuilder>{
    '/Settings': (_) => SettingsPage(),
  };

  @override
  Widget build(BuildContext context) {
    var app = StoreConnector<MainAppState, Tuple3<ThemeMode, bool, bool>>(
      converter: (s) => Tuple3(
        s.state.settingState.themeMode,
        s.state.uiState.showPerformanceOverlay,
        s.state.uiState.showSemanticsDebugger,
      ),
      builder: (context, model) {
        return MaterialApp(
          title: 'XMUX',
          home: MainPage(),
          theme: ThemeConfig.defaultTheme,
          darkTheme: ThemeConfig.defaultDarkTheme,
          themeMode: model.item1,
          localizationsDelegates: context.localizationDelegates
            ..add(MainLocalizationsDelegate.delegate),
          supportedLocales: context.supportedLocales,
          navigatorObservers: <NavigatorObserver>[
            // Only trace in release mode.
            if (P.isVM && bool.fromEnvironment('dart.vm.product'))
              FirebaseAnalyticsObserver(analytics: firebase.analytics),
          ],
          initialRoute: '/',
          onGenerateRoute: (settings) {
            var matchedPrefix = prefixes.keys.firstWhere(
              (k) => settings.name.startsWith(k),
              orElse: () => null,
            );
            if (matchedPrefix != null)
              switch (matchedPrefix) {
                case '/Settings':
                  return WindowPageRoute(
                    settings: settings,
                    fullscreenDialog: true,
                    builder: (context) => prefixes[matchedPrefix](context),
                  );
              }

            return null;
          },
          routes: routes,
          showPerformanceOverlay: model.item2,
          showSemanticsDebugger: model.item3,
        );
      },
    );

    return EasyLocalization(
      supportedLocales: [Locale('en'), Locale('zh', 'CN')],
      path: 'res/translations',
      fallbackLocale: Locale('en'),
      child: StoreProvider<MainAppState>(
        store: store,
        child: app,
      ),
    );
  }
}
