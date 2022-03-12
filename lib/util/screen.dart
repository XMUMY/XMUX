import 'dart:math';

import 'package:flutter/widgets.dart';

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

  bool isIn(double width) {
    return minWidth <= width && width <= maxWidth;
  }

  // Get horizontal padding.
  static double getPadding(double width) {
    width = width.roundToDouble();
    if (Breakpoint.extraSmall.isIn(width)) return Breakpoint.extraSmall.margin!;
    if (Breakpoint.small1.isIn(width)) return Breakpoint.small1.margin!;
    if (Breakpoint.small2.isIn(width)) {
      return max((width - Breakpoint.small2.body!) / 2, 0);
    }
    if (Breakpoint.medium.isIn(width)) return Breakpoint.medium.margin!;
    return max((width - Breakpoint.large.body!) / 2, 0);
  }

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

extension BreakpointExtension on BuildContext {
  bool isBetween(Breakpoint breakpoint) {
    return breakpoint.isIn(MediaQuery.of(this).size.width);
  }

  double get padBody {
    return Breakpoint.getPadding(MediaQuery.of(this).size.width);
  }
}

class BodyPaddingBuilder extends StatelessWidget {
  final Widget Function(BuildContext, double) builder;

  const BodyPaddingBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final padding = Breakpoint.getPadding(constraints.maxWidth);
      return builder(context, padding);
    });
  }
}
