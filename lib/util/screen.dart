import 'package:flutter/widgets.dart';

extension BreakpointExtension on BuildContext {
  bool isBetween(Breakpoint breakpoint) {
    final width = MediaQuery.of(this).size.width;
    return breakpoint.minWidth <= width && width <= breakpoint.maxWidth;
  }

  double get padBody {
    final width = MediaQuery.of(this).size.width;
    if (isBetween(Breakpoint.extraSmall)) return Breakpoint.extraSmall.margin!;
    if (isBetween(Breakpoint.small1)) return Breakpoint.small1.margin!;
    if (isBetween(Breakpoint.small2)) {
      return (width - Breakpoint.small2.body!) / 2;
    }
    if (isBetween(Breakpoint.medium)) return Breakpoint.medium.margin!;
    return (width - Breakpoint.large.body!) / 2;
  }
}

class Breakpoint {
  final double minWidth;
  final double maxWidth;
  final double? margin;
  final double? body;

  const Breakpoint({
    required this.minWidth,
    required this.maxWidth,
    this.margin,
    this.body,
  });

  static const extraSmall = Breakpoint(
    minWidth: 0,
    maxWidth: 599,
    margin: 16,
  );

  static const small = Breakpoint(
    minWidth: 600,
    maxWidth: 1239,
  );

  static const small1 = Breakpoint(
    minWidth: 600,
    maxWidth: 904,
    margin: 32,
  );

  static const small2 = Breakpoint(
    minWidth: 905,
    maxWidth: 1239,
    margin: 0,
    body: 840,
  );

  static const medium = Breakpoint(
    minWidth: 1240,
    maxWidth: 1439,
    margin: 200,
  );

  static const large = Breakpoint(
    minWidth: 1440,
    maxWidth: double.infinity,
    margin: 0,
    body: 1040,
  );
}
