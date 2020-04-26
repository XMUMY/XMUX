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

  final VoidCallback onTap;
  final Widget child;

  const FloatingCard({
    Key key,
    @required this.child,
    this.shape,
    this.onTap,
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
    var card = Card(
      margin: widget.margin,
      shape: widget.shape,
      elevation: _elevation,
      child: Padding(
        padding: widget.padding,
        child: widget.child,
      ),
    );

    Widget child;
    if (Theme.of(context).brightness == Brightness.light)
      child = GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _elevation = 4),
        onTapUp: (_) => setState(() => _elevation = 1),
        onTapCancel: () => setState(() => _elevation = 1),
        child: card,
      );
    else
      child = InkWell(
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _elevation = 4),
        onTapCancel: () => setState(() => _elevation = 1),
        child: card,
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
    OpenContainerBuilder childBuilder;
    if (Theme.of(context).brightness == Brightness.light)
      childBuilder = (context, open) => GestureDetector(
            onTap: open,
            onTapDown: (_) => setState(() => _elevation = 4),
            onTapUp: (_) => setState(() => _elevation = 1),
            onTapCancel: () => setState(() => _elevation = 1),
            child: widget.child,
          );
    else
      childBuilder = (context, open) => InkWell(
            onTap: open,
            onTapDown: (_) => setState(() => _elevation = 4),
            onTapCancel: () => setState(() => _elevation = 1),
            child: widget.child,
          );

    return MouseRegion(
      onEnter: (_) => setState(() => _elevation = 4),
      onExit: (_) => setState(() => _elevation = 1),
      child: Padding(
        padding: widget.margin,
        child: OpenContainer(
          tappable: false,
          closedColor: Theme.of(context).cardColor,
          openColor: Theme.of(context).cardColor,
          closedShape: widget.shape,
          openShape: widget.shape,
          closedElevation: _elevation,
          closedBuilder: (context, open) => Padding(
            padding: widget.padding,
            child: childBuilder(context, open),
          ),
          openBuilder: widget.openBuilder,
        ),
      ),
    );
  }
}
