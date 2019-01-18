library error_widgets;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'empty_error_button.dart';
part 'empty_error_page.dart';

class ErrorWidgets {
  static _EmptyErrorButton emptyErrorButton({AsyncCallback onRefresh}) =>
      _EmptyErrorButton(onRefresh: onRefresh);

  static _EmptyErrorPage get emptyErrorPage => _EmptyErrorPage();
}
