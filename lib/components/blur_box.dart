import 'dart:ui';

import 'package:flutter/material.dart';

class GaussianBlurBox extends StatelessWidget {
  /// Sigma for gaussian blur.
  final double sigma;

  /// Back ground color. Default to transparent.
  final Color color;

  /// Whether place the child center or not.
  final bool centered;

  final Widget child;

  const GaussianBlurBox({
    Key key,
    @required this.sigma,
    this.color = Colors.transparent,
    this.centered = false,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: Container(
          decoration: BoxDecoration(color: color),
          child: centered ? Center(child: child) : child,
        ),
      ),
    );
  }
}
