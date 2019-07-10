part of 'sketch.dart';

class _SingleBrushPainter extends CustomPainter {
  /// The [Paint] used to paint on canvas.
  final Paint brush;

  List<Offset> points;

  /// Size stored for recording.
  Size _size;

  _SingleBrushPainter(this.points, {Paint brush})
      : this.brush = brush ?? Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 5.0;

  @override
  void paint(Canvas canvas, Size size) {
    _size = size;

    var path = Path();
    for (int i = 0; i < points.length; i++) {
      if (i == 0 || points[i - 1] == null)
        path.moveTo(points[i].dx, points[i].dy);
      else if (points[i] != null) path.lineTo(points[i].dx, points[i].dy);
    }

    canvas.drawPath(path, brush);
  }

  // TODO: Implement object comparison.
  @override
  bool shouldRepaint(_SingleBrushPainter oldDelegate) => true;

  /// Record current paint to [ui.Image].
  Future<ui.Image> get image async {
    if (_size == null) return null;

    var recorder = ui.PictureRecorder();
    var origin = Offset.zero;
    var paintBounds =
        Rect.fromPoints(_size.topLeft(origin), _size.bottomRight(origin));
    paint(Canvas(recorder, paintBounds), _size);
    var picture = recorder.endRecording();

    return picture.toImage(_size.width.round(), _size.height.round());
  }
}
