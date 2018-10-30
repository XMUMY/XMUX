library common.blur_box;

import 'dart:ui';

import 'package:flutter/material.dart';

class GaussianBlurBox extends StatelessWidget {
  final double sigma;
  final Widget child;

  const GaussianBlurBox({Key key, this.sigma, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
      child: Container(
        decoration: BoxDecoration(color: Color(0)),
        child: child,
      ),
    );
  }
}
