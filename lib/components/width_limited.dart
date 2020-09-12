import 'dart:math';

import 'package:flutter/widgets.dart';

/// Limit child's width.
/// Usually used in [ListView] for adapting wide screen devices.
class WidthLimited extends StatelessWidget {
  final Widget child;

  final double width;

  const WidthLimited({
    this.child,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width ?? min(MediaQuery.of(context).size.width, 600),
        child: child,
      ),
    );
  }
}
