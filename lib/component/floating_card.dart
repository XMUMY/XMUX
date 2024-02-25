import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

/// Floating material design [Card].
class FloatingCard extends StatefulWidget {
  /// The empty space that surrounds the card.
  final EdgeInsets margin;

  /// The amount of space by which to inset the card.
  final EdgeInsets padding;

  /// The shape of the card's [Material].
  final ShapeBorder? shape;

  final VoidCallback? onTap;

  final VoidCallback? onLongPress;

  final Widget child;

  const FloatingCard({
    super.key,
    this.margin = const EdgeInsets.all(4),
    this.padding = const EdgeInsets.all(0),
    this.shape,
    this.onTap,
    this.onLongPress,
    required this.child,
  });

  @override
  State<FloatingCard> createState() => _FloatingCardState();
}

class _FloatingCardState extends State<FloatingCard> {
  double _elevation = 1;

  @override
  Widget build(BuildContext context) {
    Widget child = Padding(padding: widget.padding, child: widget.child);

    if (Theme.of(context).brightness == Brightness.dark) {
      child = InkWell(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: child,
      );
    } else {
      child = MouseRegion(
        onEnter: (_) => setState(() => _elevation = 4),
        onExit: (_) => setState(() => _elevation = 1),
        child: GestureDetector(
          onTap: widget.onTap,
          onTapDown: (_) => setState(() => _elevation = 4),
          onTapUp: (_) => setState(() => _elevation = 1),
          onTapCancel: () => setState(() => _elevation = 1),
          onLongPress: widget.onLongPress,
          behavior: HitTestBehavior.opaque,
          child: child,
        ),
      );
    }

    return Card(
      margin: widget.margin,
      shape: widget.shape,
      elevation: _elevation,
      clipBehavior: Clip.hardEdge,
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

  final OpenContainerBuilder openBuilder;

  final Widget child;

  const FloatingOpenContainer({
    super.key,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(4),
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    required this.child,
    required this.openBuilder,
  });

  @override
  State<FloatingOpenContainer> createState() => _FloatingOpenContainerState();
}

class _FloatingOpenContainerState extends State<FloatingOpenContainer> {
  double _elevation = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: OpenContainer(
        tappable: false,
        closedColor: Theme.of(context).cardColor,
        closedShape: widget.shape,
        closedElevation: _elevation,
        closedBuilder: (context, open) {
          Widget child = Padding(padding: widget.padding, child: widget.child);

          if (Theme.of(context).brightness == Brightness.dark) {
            child = InkWell(onTap: open, child: child);
          } else {
            child = MouseRegion(
              onEnter: (_) => setState(() => _elevation = 4),
              onExit: (_) => setState(() => _elevation = 1),
              child: GestureDetector(
                onTap: open,
                onTapDown: (_) => setState(() => _elevation = 4),
                onTapUp: (_) => setState(() => _elevation = 1),
                onTapCancel: () => setState(() => _elevation = 1),
                behavior: HitTestBehavior.opaque,
                child: child,
              ),
            );
          }

          return child;
        },
        openColor: Theme.of(context).canvasColor,
        openBuilder: widget.openBuilder,
      ),
    );
  }
}
