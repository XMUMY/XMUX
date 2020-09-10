import 'package:flutter/material.dart';

/// Create a background image for init / login app.
class BackgroundImage extends StatelessWidget {
  final Color color;
  final BlendMode colorBlendMode;

  const BackgroundImage({
    Key key,
    this.color = Colors.black45,
    this.colorBlendMode = BlendMode.darken,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Image.asset(
        'res/initpage.jpg',
        fit: constraints.maxHeight / constraints.maxWidth > 16 / 9
            ? BoxFit.fitHeight
            : BoxFit.fitWidth,
        alignment: Alignment.bottomCenter,
        color: color,
        colorBlendMode: colorBlendMode,
      ),
    );
  }
}
