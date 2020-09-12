import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

/// Floating material design [Card].
class FloatingCard extends StatefulWidget {
  /// The empty space that surrounds the card.
  final EdgeInsets margin;

  /// The amount of space by which to inset the card.
  final EdgeInsets padding;

  /// The shape of the card's [Material].
  final ShapeBorder shape;

  final Widget child;
  final VoidCallback onTap;

  const FloatingCard({
    Key key,
    @required this.child,
    this.onTap,
    this.shape,
    this.margin = const EdgeInsets.all(4),
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  _FloatingCardState createState() => _FloatingCardState();
}

class _FloatingCardState extends State<FloatingCard> {
  double _elevation = 1;

  @override
  Widget build(BuildContext context) {
    Widget child = Padding(padding: widget.padding, child: widget.child);

    if (Theme.of(context).brightness == Brightness.dark)
      child = InkWell(onTap: widget.onTap, child: child);
    else
      child = GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _elevation = 4),
        onTapUp: (_) => setState(() => _elevation = 1),
        onTapCancel: () => setState(() => _elevation = 1),
        child: child,
        behavior: HitTestBehavior.opaque,
      );

    child = Card(
      margin: widget.margin,
      shape: widget.shape,
      elevation: _elevation,
      clipBehavior: Clip.hardEdge,
      child: child,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _elevation = 4),
      onExit: (_) => setState(() => _elevation = 1),
      child: child,
    );
  }
}

/// Floating material design [OpenContainer].
class FloatingOpenContainer extends StatefulWidget {
  /// The empty space that surrounds the card.
  final EdgeInsets margin;

  /// The amount of space by which to inset the card.
  final EdgeInsets padding;

  /// The shape of the card's [Material].
  final ShapeBorder shape;

  final Widget child;
  final OpenContainerBuilder openBuilder;

  const FloatingOpenContainer({
    Key key,
    @required this.child,
    @required this.openBuilder,
    this.shape,
    this.margin = const EdgeInsets.all(4),
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  _FloatingOpenContainerState createState() => _FloatingOpenContainerState();
}

class _FloatingOpenContainerState extends State<FloatingOpenContainer> {
  double _elevation = 1;

  @override
  Widget build(BuildContext context) {
    CloseContainerBuilder childBuilder = (context, open) {
      Widget child = Padding(padding: widget.padding, child: widget.child);

      if (Theme.of(context).brightness == Brightness.dark)
        child = InkWell(onTap: open, child: child);
      else
        child = GestureDetector(
          onTap: open,
          onTapDown: (_) => setState(() => _elevation = 4),
          onTapUp: (_) => setState(() => _elevation = 1),
          onTapCancel: () => setState(() => _elevation = 1),
          child: child,
          behavior: HitTestBehavior.opaque,
        );

      return child;
    };

    return MouseRegion(
      onEnter: (_) => setState(() => _elevation = 4),
      onExit: (_) => setState(() => _elevation = 1),
      child: Padding(
        padding: widget.margin,
        child: OpenContainer(
          tappable: false,
          closedColor: Theme.of(context).cardColor,
          openColor: Theme.of(context).cardColor,
          closedBuilder: childBuilder,
          openBuilder: widget.openBuilder,
          closedShape: widget.shape,
          closedElevation: _elevation,
        ),
      ),
    );
  }
}
