library common.blur_box;

import 'dart:ui';

import 'package:flutter/material.dart';

class GaussianBlurBox extends StatelessWidget {
  /// Sigma for gaussian blur.
  final double sigma;
  final Widget child;
  final Color color;

  const GaussianBlurBox({Key key, this.sigma, this.child, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0),
      body: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: Container(
            decoration: BoxDecoration(color: color ?? Color(0)),
            child: child,
          ),
        ),
      ),
    );
  }
}
