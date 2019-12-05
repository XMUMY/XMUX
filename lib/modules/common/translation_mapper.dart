library common.translation_mapper;

import 'package:flutter/widgets.dart';
import 'package:xmux/generated/i18n.dart';

String weekdays(BuildContext context, int day) {
  switch (day) {
    case 1:
      return S.of(context).General_Weekday1;
    case 2:
      return S.of(context).General_Weekday2;
    case 3:
      return S.of(context).General_Weekday3;
    case 4:
      return S.of(context).General_Weekday4;
    case 5:
      return S.of(context).General_Weekday5;
    case 6:
      return S.of(context).General_Weekday6;
    case 7:
      return S.of(context).General_Weekday7;
    default:
      return '';
  }
}
