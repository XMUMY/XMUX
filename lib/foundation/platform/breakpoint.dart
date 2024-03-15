import 'package:flutter/widgets.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class LegacyBreakpoint {
  final double minWidth;
  final double maxWidth;
  final double? margin;
  final double? body;

  const LegacyBreakpoint({
    required this.minWidth,
    required this.maxWidth,
    this.margin,
    this.body,
  });

  static const extraSmall = LegacyBreakpoint(
    minWidth: 0,
    maxWidth: 599,
    margin: 16,
  );

  static const small = LegacyBreakpoint(
    minWidth: 600,
    maxWidth: 1239,
  );

  static const small1 = LegacyBreakpoint(
    minWidth: 600,
    maxWidth: 904,
    margin: 32,
  );

  static const small2 = LegacyBreakpoint(
    minWidth: 905,
    maxWidth: 1239,
    margin: 0,
    body: 840,
  );

  static const medium = LegacyBreakpoint(
    minWidth: 1240,
    maxWidth: 1439,
    margin: 200,
  );

  static const large = LegacyBreakpoint(
    minWidth: 1440,
    maxWidth: double.infinity,
    margin: 0,
    body: 1040,
  );
}

extension PaddingExtension on BuildContext {
  double get padBody => Breakpoints.mediumAndUp.isActive(this) ? 24 : 16;

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
