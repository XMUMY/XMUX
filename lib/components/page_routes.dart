import 'package:flutter/material.dart';

/// Page route that provide a fade-in/out transition.
///
/// [child] and [pageBuilder] cannot be null simultaneously.
class FadePageRoute<T> extends PageRoute<T> {
  /// Used to build the route's primary contents.
  final Widget child;

  /// Used to build the route's primary contents.
  final RoutePageBuilder pageBuilder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  FadePageRoute({
    RouteSettings settings,
    bool fullscreenDialog = false,
    this.child,
    this.pageBuilder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  })  : assert(pageBuilder != null || child != null),
        assert(barrierDismissible != null),
        assert(maintainState != null),
        assert(opaque != null),
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    if (pageBuilder != null)
      return pageBuilder(context, animation, secondaryAnimation);
    return child;
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.2, end: 1.0).animate(animation),
      child: FadeTransition(
        opacity:
            Tween<double>(begin: 1.0, end: 0.5).animate(secondaryAnimation),
        child: child,
      ),
    );
  }
}
