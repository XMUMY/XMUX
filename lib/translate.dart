import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainLocalizations {
  final Locale locale;

  MainLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'messages title': 'Messages',
      'calendar title': 'Calendar',
      'academic title': 'Academic',
      'explore title': 'Explore',
      //Calendar
      'calendar/classes': 'Classes',
      'calendar/exams': 'Exams',
      'calendar/assignments': 'Assignments',
      //Academic
      'Academic/wolframengine/title': 'Wolfram Engine',
      'Academic/wolframengine/caption':
          'Search anything by powerful Wolfram Engine',
      'Academic/gpacalculator/name': 'GPA Calculator',
      'Academic/gpacalculator/caption': 'Calculate your GPA easily',
      //me
      'me': 'Me',
      'me/signout': 'Sign out',
      //drawer
      'header/welcome': 'Hello,',
      'e-payment': ' E-Payment',
      'e-payment/login': 'Login E-Payment',
      'e-payment/login/content':
          'Please go to settings and save your E-Payment Password.',
      'e-payment/login/go': 'Go Settings',
    },
    'zh': {
      'messages title': '消息',
      'calendar title': '日程',
      'academic title': '学术',
      'explore title': '发现',
      //Calendar
      'calendar/classes': '课程',
      'calendar/exams': '考试',
      'calendar/assignments': '作业',
      //Academic
      'Academic/wolframengine/title': 'Wolfram 知识引擎',
      'Academic/wolframengine/caption': '利用强大的 Wolfram 引擎进行搜索',
      'Academic/gpacalculator/name': 'GPA 计算器',
      'Academic/gpacalculator/caption': '轻松计算平均学分绩点',
      //me
      'me': '我',
      'me/signout': '登出',
      //drawer
      'header/welcome': '您好，',
      'e-payment': ' E-Payment',
      'e-payment/login': '登陆 E-Payment',
      'e-payment/login/content': '请在设置页绑定您的\nE-Payment 密码。',
      'e-payment/login/go': '前往设置页',
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

class LoginLocalizations {
  final Locale locale;

  LoginLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'signin/title':'Sign in to XMUX',
      'signin':'Sign in',
    },
    'zh': {
      'signin/title':'登陆到XMUX',
      'signin':'登陆',
    }
  };

  String get(String title) {
    return _localizedValues[locale.languageCode][title];
  }

  static LoginLocalizations of(BuildContext context) {
    return Localizations.of(context, LoginLocalizations);
  }
}

class LoginLocalizationsDelegate
    extends LocalizationsDelegate<LoginLocalizations> {
  const LoginLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<LoginLocalizations> load(Locale locale) {
    return new SynchronousFuture<LoginLocalizations>(
        new LoginLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<LoginLocalizations> old) {
    return false;
  }

  static LoginLocalizationsDelegate delegate =
      const LoginLocalizationsDelegate();
}
