import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/about.dart';
import 'package:xmux/mainapp/academic/tools/exam_result.dart';
import 'package:xmux/mainapp/academic/tools/geogebra.dart';
import 'package:xmux/mainapp/academic/tools/gpa_calculator.dart';
import 'package:xmux/mainapp/academic/tools/tools_details.dart';
import 'package:xmux/mainapp/academic/tools/wolfram_engine/input_constructor.dart';
import 'package:xmux/mainapp/calendar/calendar_image.dart';
import 'package:xmux/mainapp/explore/lost_and_found/lost_and_found_page.dart';
import 'package:xmux/mainapp/main_page.dart';
import 'package:xmux/mainapp/settings/change_personal_info.dart';
import 'package:xmux/mainapp/settings/developer_options.dart';
import 'package:xmux/mainapp/settings/settings_page.dart';
import 'package:xmux/mainapp/tools/emergency.dart';
import 'package:xmux/mainapp/tools/epayment.dart';
import 'package:xmux/mainapp/tools/room_reservation.dart';
import 'package:xmux/redux/redux.dart';
import 'package:xmux/translations/translation.dart';

class MainApp extends StatelessWidget {
  // Get Theme data dynamically.
  ThemeData getThemeData() {
    // TODO: get theme from redux.
    return ThemeConfig.defaultTheme;
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<MainAppState>(
      store: store,
      child: MaterialApp(
        title: 'XMUX',
        home: MainPage(),
        theme: getThemeData(),
        initialRoute: "/",
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          MainLocalizationsDelegate.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('zh', 'CN'),
        ],
        // Observer for auto play VillainTransition.
//        navigatorObservers: [VillainTransitionObserver()],
        // Define route for main app.
        routes: <String, WidgetBuilder>{
          '/About': (_) => AboutPage(),
          '/Academic/Tools/Details': (_) => AcademicToolDetailsPage(),
          '/Academic/Tools/ExamResult': (_) => ExamResultPage(),
          '/Academic/Tools/WolframEngine': (_) => InputConstructor(),
          '/Academic/Tools/GeoGebra': (_) => GeoGebraPage(),
          '/Academic/Tools/GPACalculator': (_) => GPACalculatorPage(),
          '/Calendar/CalendarImage': (_) => CalendarImagePage(),
          '/Explore/LostAndFound': (_) => LostAndFoundPage(),
          '/Me/Epayment': (_) => EPaymentPage(),
          '/Me/RoomReservation': (_) => RoomWebviewPage(),
          '/Me/Emergency': (_) => EmergencyPage(),
          '/Settings': (_) => SettingsPage(),
          '/Settings/ChangePersonalInfo': (_) => ChangePersonalInfoPage(),
          '/Settings/DeveloperOptions': (_) => DeveloperOptionsPage(),
          '/explore/lostandfound': (_) => LostAndFoundPage()
        },
      ),
    );
  }
}
