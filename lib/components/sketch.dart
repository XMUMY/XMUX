import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// Create a sketch that allow user to draw on it.
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

  /// Clear the sketch.
  void clear() => mounted ? setState(() => _points.clear()) : null;

  /// Get [ui.Image] from current sketch.
  Future<ui.Image> get image => _painter.image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.localPosition > Offset.zero)
          setState(() => _points.add(details.localPosition));
      },
      onPanStart: (details) =>
          setState(() => _points.add(details.localPosition)),
      onPanEnd: (details) => setState(() => _points.add(null)),
      child: CustomPaint(painter: _SingleBrushPainter(_points)),
    );
  }
}

class _SingleBrushPainter extends CustomPainter {
  /// The [Paint] used to paint on canvas.
  final Paint _brush;

  /// Points need to paint.
  List<Offset> _points;

  /// Size stored for recording.
  Size _size;

  _SingleBrushPainter(
    this._points, {
    Paint brush,
  }) : this._brush = brush ?? Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 5;

  @override
  void paint(Canvas canvas, Size size) {
    _size = size;

    var path = Path();
    for (int i = 0; i < _points.length; i++) {
      if (i == 0 || _points[i - 1] == null)
        path.moveTo(_points[i].dx, _points[i].dy);
      else if (_points[i] != null &&
          _points[i].dx < size.width &&
          _points[i].dy < size.height)
        path.lineTo(_points[i].dx, _points[i].dy);
    }

    canvas.drawPath(path, _brush);
  }

  @override
  bool shouldRepaint(_SingleBrushPainter oldDelegate) => true;

  /// Record current paint to [ui.Image].
  Future<ui.Image> get image async {
    if (_size == null) return null;

    var recorder = ui.PictureRecorder();
    var paintBounds = Rect.fromPoints(
      _size.topLeft(Offset.zero),
      _size.bottomRight(Offset.zero),
    );
    // Paint to recorder.
    paint(Canvas(recorder, paintBounds), _size);

    return recorder
        .endRecording()
        .toImage(_size.width.round(), _size.height.round());
  }
}
