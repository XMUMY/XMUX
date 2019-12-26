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
    this.margin = const EdgeInsets.all(8),
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  _FloatingCardState createState() => _FloatingCardState();
}

class _FloatingCardState extends State<FloatingCard> {
  double _elevation = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _elevation = 4),
      onTapUp: (_) => setState(() => _elevation = 1),
      onTapCancel: () => setState(() => _elevation = 1),
      child: Card(
        margin: widget.margin,
        shape: widget.shape,
        elevation: _elevation,
        child: Padding(
          padding: widget.padding,
          child: widget.child,
        ),
      ),
    );
  }
}
