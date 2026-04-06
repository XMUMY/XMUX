import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

// ignore: non_constant_identifier_names
Widget Localized({required Widget child}) => EasyLocalization(
      path: 'assets/translation',
      supportedLocales: const [
        Locale('en'),
        Locale('zh', 'CN'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      ],
      fallbackLocale: const Locale('en'),
      saveLocale: false,
      child: child,
    );
