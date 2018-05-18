import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xmux/translations/en_US.dart';
import 'package:xmux/translations/zh_CN.dart';

class MainLocalizations {
  final Locale locale;

  MainLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': en_US,
    'zh': zh_CN,
  };

  String get(String title) => _localizedValues[locale.languageCode][title];

  static MainLocalizations of(BuildContext context) =>
      Localizations.of(context, MainLocalizations);
}

class MainLocalizationsDelegate
    extends LocalizationsDelegate<MainLocalizations> {
  const MainLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<MainLocalizations> load(Locale locale) =>
      new SynchronousFuture<MainLocalizations>(new MainLocalizations(locale));

  @override
  bool shouldReload(LocalizationsDelegate<MainLocalizations> old) => false;

  static MainLocalizationsDelegate delegate = const MainLocalizationsDelegate();
}

class LoginLocalizations {
  final Locale locale;

  LoginLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': en_US_login,
    'zh': zh_CN_login,
  };

  String get(String title) => _localizedValues[locale.languageCode][title];

  static LoginLocalizations of(BuildContext context) =>
      Localizations.of(context, LoginLocalizations);
}

class LoginLocalizationsDelegate
    extends LocalizationsDelegate<LoginLocalizations> {
  const LoginLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<LoginLocalizations> load(Locale locale) =>
      new SynchronousFuture<LoginLocalizations>(new LoginLocalizations(locale));

  @override
  bool shouldReload(LocalizationsDelegate<LoginLocalizations> old) => false;

  static LoginLocalizationsDelegate delegate =
      const LoginLocalizationsDelegate();
}
