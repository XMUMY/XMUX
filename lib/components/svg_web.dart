import 'dart:convert';
import 'dart:html';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Use browser to render svg picture on web.
class SvgElement extends StatefulWidget {
  final String asset;
  final double width;
  final double height;

  const SvgElement.asset(this.asset, {Key key, this.width, this.height})
      : super(key: key);

  @override
  _SvgElementState createState() => _SvgElementState();
}

class _SvgElementState extends State<SvgElement> {
  String assetString;

  final hash =
      String.fromCharCodes(List.generate(64, (i) => Random().nextInt(256)));

  @override
  void initState() {
    rootBundle
        .loadString(widget.asset)
        .then((value) => mounted ? setState(() => assetString = value) : null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (assetString == null)
      return Container(
        width: widget.width,
        height: widget.height,
      );

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('img-svg-$hash', (viewId) {
      final base64 = base64Encode(utf8.encode(assetString));
      final base64String = 'data:image/svg+xml;base64,$base64';
      final element = ImageElement(
          src: base64String,
          width: widget.width?.toInt() ?? null,
          height: widget.height?.toInt() ?? null);
      return element;
    });

    return Container(
      alignment: Alignment.center,
      child: HtmlElementView(
        viewType: 'img-svg-$hash',
      ),
    );
  }
}
