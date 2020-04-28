import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:xmux/components/blur_box.dart';

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
      opacity: Tween<double>(begin: 0.2, end: 1).animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(begin: 1, end: 0.5).animate(secondaryAnimation),
        child: child,
      ),
    );
  }
}

/// A modal route that replaces the entire screen when using a small screen
/// and show a window when using a large screen (width > 600).
class WindowPageRoute<T> extends PageRoute<T> {
  WindowPageRoute({
    RouteSettings settings,
    bool fullscreenDialog = false,
    @required this.builder,
    this.maintainState = true,
  }) : super(settings: settings, fullscreenDialog: fullscreenDialog);

  /// Builds the primary contents of the route.
  final WidgetBuilder builder;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  final bool maintainState;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final Widget result = builder(context);
    assert(() {
      if (result == null) {
        throw FlutterError(
            'The builder for route "${settings.name}" returned null.\n'
            'Route builders must never return null.');
      }
      return true;
    }());
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget content) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 600;

    Widget child;
    if (isWide)
      child = GaussianBlurBox(
        sigma: 10,
        color: Colors.black45,
        centered: true,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          width: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
          ),
          clipBehavior: Clip.hardEdge,
          child: FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: Theme(
              data: Theme.of(context).copyWith(
                appBarTheme: Theme.of(context).appBarTheme.copyWith(
                      color: Theme.of(context).canvasColor,
                      elevation: 0,
                      textTheme: Theme.of(context).textTheme,
                      iconTheme: Theme.of(context).iconTheme,
                    ),
              ),
              isMaterialAppTheme: true,
              child: content,
            ),
          ),
        ),
      );
    else
      child = Theme.of(context).pageTransitionsTheme.buildTransitions<T>(
          this, context, animation, secondaryAnimation, content);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: child,
    );
  }
}
