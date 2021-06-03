import 'package:flutter/widgets.dart';

extension BreakpointExtension on BuildContext {
  bool isLocatedIn(Breakpoint breakpoint) {
    final size = MediaQuery.of(this).size;
    return breakpoint.minWidth <= size.width &&
        size.width <= breakpoint.maxWidth;
  }
}

class Breakpoint {
  final double minWidth;
  final double maxWidth;

  const Breakpoint({
    required this.minWidth,
    required this.maxWidth,
  });

  static const extraSmall = Breakpoint(minWidth: 0, maxWidth: 599);
  static const small = Breakpoint(minWidth: 600, maxWidth: 1239);
  static const small1 = Breakpoint(minWidth: 600, maxWidth: 904);
  static const small2 = Breakpoint(minWidth: 905, maxWidth: 1239);
  static const medium = Breakpoint(minWidth: 1240, maxWidth: 1439);
  static const large = Breakpoint(minWidth: 1440, maxWidth: double.infinity);
}
