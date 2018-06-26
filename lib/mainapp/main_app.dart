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
import 'package:xmux/mainapp/settings/settings_page.dart';
import 'package:xmux/mainapp/tools/emergency.dart';
import 'package:xmux/mainapp/tools/epayment.dart';
import 'package:xmux/redux/state.dart';
import 'package:xmux/translations/translation.dart';

class MainApp extends StatelessWidget {
  // Get Theme data dynamically.
  ThemeData getThemeData() {
    // TODO: get theme from redux.
    return ThemeConfig.defaultTheme;
  }

  @override
  Widget build(BuildContext context) => StoreProvider<MainAppState>(
        store: mainAppStore,
        child: MaterialApp(
          title: 'XMUX',
          home: MainPage(),
          theme: getThemeData(),
          initialRoute: "/",
          routes: <String, WidgetBuilder>{
            '/About': (BuildContext context) => AboutPage(),
            '/Academic/Tools/Details': (BuildContext context) =>
                AcademicToolDetailsPage(),
            '/Academic/Tools/ExamResult': (BuildContext context) =>
                ExamResultPage(),
            '/Academic/Tools/WolframEngine': (BuildContext context) =>
                InputConstructor(),
            '/Academic/Tools/GeoGebra': (BuildContext context) =>
                GeoGebraPage(),
            '/Academic/Tools/GPACalculator': (BuildContext context) =>
                GPACalculatorPage(),
            '/Calendar/CalendarImage': (BuildContext context) =>
                CalendarImagePage(),
            '/Explore/LostAndFound': (BuildContext context) =>
                LostAndFoundPage(),
            '/Me/Epayment': (BuildContext context) => EPaymentPage(),
            '/Me/Emergency': (BuildContext context) => EmergencyPage(),
            '/Settings': (BuildContext context) => SettingsPage(),
            '/Settings/ChangePersonalInfo': (BuildContext context) =>
                ChangePersonalInfoPage(),

            // old.
            "/wolframengine/constructor": (BuildContext context) =>
                InputConstructor(),
            "/acdemic/gpacalculator": (BuildContext context) =>
                GPACalculatorPage(),
            "/acdemic/gpacalculator/examresult": (BuildContext context) =>
                ExamResultPage(),
            "/me": (BuildContext context) => SettingsPage(),
            "/tools/epayment": (BuildContext context) => EPaymentPage(),
            "/explore/lostandfound": (BuildContext context) =>
                LostAndFoundPage(),
          },
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            MainLocalizationsDelegate.delegate,
          ],
          supportedLocales: [
            Locale('zh', 'CN'),
            Locale('en', 'US'),
          ],
        ),
      );
}
