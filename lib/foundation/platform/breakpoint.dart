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

  /// Given width is contained in this breakpoint
  bool contains(double width) {
    return minWidth <= width && width <= maxWidth;
  }

  // Get horizontal padding.
  static double getPadding(double width) {
    width = width.roundToDouble();
    if (Breakpoint.extraSmall.contains(width)) {
      return Breakpoint.extraSmall.margin!;
    } else if (Breakpoint.small1.contains(width)) {
      return Breakpoint.small1.margin!;
    } else if (Breakpoint.small2.contains(width)) {
      return max((width - Breakpoint.small2.body!) / 2, 0);
    } else if (Breakpoint.medium.contains(width)) {
      return Breakpoint.medium.margin!;
    } else {
      return max((width - Breakpoint.large.body!) / 2, 0);
    }
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
  bool isBetween(Breakpoint breakpoint) =>
      breakpoint.contains(MediaQuery.of(this).size.width);

  double get padBody => Breakpoint.getPadding(MediaQuery.of(this).size.width);

  EdgeInsets get padListView {
    final horizontalPadding = padBody;
    return EdgeInsets.fromLTRB(
      horizontalPadding,
      4,
      horizontalPadding,
      MediaQuery.of(this).padding.bottom,
    );
  }
}

class BodyPadding extends StatelessWidget {
  final Widget child;

  const BodyPadding({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padBody),
      child: child,
    );
  }
}

class BodyPaddingBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, double horizontalPadding) builder;

  const BodyPaddingBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => builder(
          context,
          Breakpoint.getPadding(constraints.maxWidth),
        ),
      );
}
