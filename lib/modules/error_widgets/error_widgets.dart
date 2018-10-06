library error_widgets;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'empty_error_button.dart';
part 'empty_error_page.dart';

class ErrorWidgets {
  static EmptyErrorButton emptyErrorButton({AsyncCallback onRefresh}) =>
      EmptyErrorButton(onRefresh: onRefresh);

  static EmptyErrorPage get emptyErrorPage => EmptyErrorPage();
}
