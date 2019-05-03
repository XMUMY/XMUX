import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/about.dart';
import 'package:xmux/mainapp/calendar/calendar_image.dart';
import 'package:xmux/mainapp/campus/academic_tools/ec_registration.dart';
import 'package:xmux/mainapp/campus/academic_tools/exam_result.dart';
import 'package:xmux/mainapp/campus/academic_tools/geogebra.dart';
import 'package:xmux/mainapp/campus/academic_tools/gpa_calculator.dart';
import 'package:xmux/mainapp/campus/academic_tools/tools_details.dart';
import 'package:xmux/mainapp/campus/academic_tools/vpn.dart';
import 'package:xmux/mainapp/campus/academic_tools/wolfram_engine/input_constructor.dart';
import 'package:xmux/mainapp/explore/lost_and_found/lost_and_found_page.dart';
import 'package:xmux/mainapp/main_page.dart';
import 'package:xmux/mainapp/settings/developer_options.dart';
import 'package:xmux/mainapp/settings/edit_profile.dart';
import 'package:xmux/mainapp/settings/settings_page.dart';
import 'package:xmux/mainapp/tools/emergency.dart';
import 'package:xmux/mainapp/tools/emgs.dart';
import 'package:xmux/mainapp/tools/epayment.dart';
import 'package:xmux/mainapp/tools/room_reservation.dart';
import 'package:xmux/redux/redux.dart';
import 'package:xmux/translations/translation.dart';

class MainApp extends StatelessWidget {
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
            initialRoute: '/',
            navigatorObservers: <NavigatorObserver>[
              FirebaseAnalyticsObserver(analytics: firebaseAnalytics),
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
            // Define route for main app.
            routes: <String, WidgetBuilder>{
              '/About': (_) => AboutPage(),
              '/Calendar/CalendarImage': (_) => CalendarImagePage(),
              '/Campus/AcademicTools/Details': (_) => AcademicToolDetailsPage(),
              '/Campus/AcademicTools/ExamResult': (_) => ExamResultPage(),
              '/Campus/AcademicTools/WolframEngine': (_) => InputConstructor(),
              '/Campus/AcademicTools/GeoGebra': (_) => GeoGebraPage(),
              '/Campus/AcademicTools/GPACalculator': (_) => GPACalculatorPage(),
              '/Campus/AcademicTools/VPN': (_) => VPNPage(),
              '/Campus/AcademicTools/ECR': (_) =>
                  ElectiveCourseRegistrationPage(),
              '/Explore/LostAndFound': (_) => LostAndFoundPage(),
              '/Me/Epayment': (_) => EPaymentPage(),
              '/Me/RoomReservation': (_) => RoomWebviewPage(),
              '/Me/Emgs': (_) => EmgsPage(),
              '/Me/Emergency': (_) => EmergencyPage(),
              '/Settings': (_) => SettingsPage(),
              '/Settings/ChangeProfile': (_) => ChangeProfilePage(),
              '/Settings/DeveloperOptions': (_) => DeveloperOptionsPage(),
              '/explore/lostandfound': (_) => LostAndFoundPage()
            },
          );
        },
      ),
    );
  }
}
