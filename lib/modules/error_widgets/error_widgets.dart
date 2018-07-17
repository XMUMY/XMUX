library error_widgets;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'empty_error_button.dart';
part 'empty_error_page.dart';

class ErrorWidgets {
  @protected
  static ErrorWidgets instance;

  /// Error widgets can only have one instance.
  factory ErrorWidgets() {
    if (instance == null) instance = new ErrorWidgets._();
    return instance;
  }

  /// Provide a new instance of ErrorWidgets.
  ErrorWidgets._();

  EmptyErrorButton emptyErrorButton({AsyncCallback onRefresh}) =>
      EmptyErrorButton(onRefresh: onRefresh);

  EmptyErrorPage get emptyErrorPage => EmptyErrorPage();
}
