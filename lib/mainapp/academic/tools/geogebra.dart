import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:xmux/translations/translation.dart';

class GeoGebraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WebviewScaffold(
        appBar: AppBar(
          title: Text(MainLocalizations
              .of(context)
              .get("Academic/Tools/GeoGebra/Title")),
          backgroundColor: Colors.lightBlue,
        ),
        url: "https://www.geogebra.org/classic",
      );
}
