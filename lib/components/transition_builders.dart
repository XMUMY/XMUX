import 'package:flutter/material.dart';

/// FadePageTransitionsBuilder that used to replace default in ThemeData.
class FadePageTransitionsBuilder extends PageTransitionsBuilder {
  const FadePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(
        opacity: Tween<double>(begin: 0.2, end: 1).animate(animation),
        child: FadeTransition(
          opacity:
              Tween<double>(begin: 1, end: 0.5).animate(secondaryAnimation),
          child: child,
        ),
      );
}
