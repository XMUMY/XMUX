import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainLocalizations {
  final Locale locale;

  MainLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'messages title': 'Messages',
      'academic title': 'academic',
      'calendar title': 'Calendar',
      'me title': 'Me',
      //Calendar
      'calendar/classes': 'Classes',
      'calendar/exams': 'Exams',
      'calendar/assignments': 'Assignments',
    },
    'zh': {
      'messages title': '消息',
      'academic title': '引擎',
      'calendar title': '日程',
      'me title': '我',
      //Calendar
      'calendar/classes': '课程',
      'calendar/exams': '考试',
      'calendar/assignments': '作业',
    }
  };

  String get(String title) {
    return _localizedValues[locale.languageCode][title];
  }

  static MainLocalizations of(BuildContext context) {
    return Localizations.of(context, MainLocalizations);
  }
}

class MainLocalizationsDelegate
    extends LocalizationsDelegate<MainLocalizations> {
  const MainLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<MainLocalizations> load(Locale locale) {
    return new SynchronousFuture<MainLocalizations>(
        new MainLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<MainLocalizations> old) {
    return false;
  }

  static MainLocalizationsDelegate delegate = const MainLocalizationsDelegate();
}
