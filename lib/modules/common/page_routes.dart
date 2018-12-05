library common.page_routes;

import 'package:flutter/material.dart';

class SlideLeftRoute extends PageRouteBuilder {
  final Widget widget;

  static Widget _transitionsBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  SlideLeftRoute(this.widget)
      : super(
            pageBuilder: (BuildContext context, _, __) => widget,
            transitionsBuilder: _transitionsBuilder);
}

class FadeRoute extends PageRouteBuilder {
  final Widget widget;

  static Widget _transitionsBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0.2,
        end: 1.0,
      ).animate(animation),
      child: child,
    );
  }

  FadeRoute(this.widget)
      : super(
            pageBuilder: (BuildContext context, _, __) => widget,
            transitionsBuilder: _transitionsBuilder);
}
