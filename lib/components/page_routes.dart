library common.page_routes;

import 'package:flutter/material.dart';

class SlideLeftRoute extends PageRouteBuilder {
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

  SlideLeftRoute(WidgetBuilder builder)
      : super(
            pageBuilder: (BuildContext context, _, __) => builder(context),
            transitionsBuilder: _transitionsBuilder);
}

class FadeRoute<T> extends PageRouteBuilder<T> {
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

  FadeRoute(WidgetBuilder builder)
      : super(
            pageBuilder: (BuildContext context, _, __) => builder(context),
            transitionsBuilder: _transitionsBuilder);
}
