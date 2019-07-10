import 'dart:ui' as ui;

import 'package:flutter/material.dart';

part 'painter.dart';

class Sketch extends StatefulWidget {
  Sketch({Key key}) : super(key: key);

  @override
  SketchState createState() => SketchState();
}

class SketchState extends State<Sketch> {
  /// Points to paint.
  List<Offset> _points = [];

  /// Painter stored for image recording.
  _SingleBrushPainter _painter;

  /// Get [ui.Image] from current sketch.
  Future<ui.Image> get image => _painter.image;

  @override
  Widget build(BuildContext context) {
    _painter = _SingleBrushPainter(_points);

    return GestureDetector(
      onPanUpdate: (details) =>
          setState(() => _points.add(details.localPosition)),
      onPanStart: (details) =>
          setState(() => _points.add(details.localPosition)),
      onPanEnd: (details) => setState(() => _points.add(null)),
      child: CustomPaint(painter: _painter),
    );
  }
}
