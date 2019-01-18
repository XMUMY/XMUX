import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xmux/globals.dart';

class GeoGebraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n('Academic/Tools/GeoGebra/Title', context)),
        backgroundColor: Colors.lightBlue,
      ),
      body: WebView(
        initialUrl: 'https://www.geogebra.org/classic',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
