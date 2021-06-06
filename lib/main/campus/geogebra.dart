import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../util/platform.dart';

class GeoGebraPage extends StatefulWidget {
  const GeoGebraPage({Key? key}) : super(key: key);

  @override
  State<GeoGebraPage> createState() => _GeoGebraPageState();
}

class _GeoGebraPageState extends State<GeoGebraPage> {
  static const url = 'https://www.geogebra.org/classic';

  var isLoading = true;
  var hasError = false;

  late WebViewController _controller;
  late Timer _retryTimer;

  void _retry(Timer timer) {
    if (hasError) {
      hasError = false;
      _controller.loadUrl(url);
    }
  }

  @override
  void initState() {
    if (isAndroid) WebView.platform = SurfaceAndroidWebView();
    _retryTimer = Timer.periodic(const Duration(seconds: 5), _retry);
    super.initState();
  }

  @override
  void dispose() {
    _retryTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeoGebra'),
      ),
      body: IndexedStack(
        index: isLoading || hasError ? 0 : 1,
        children: [
          const Center(
            child: CircularProgressIndicator(),
          ),
          WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (c) => _controller = c,
            onPageStarted: (e) => setState(() => isLoading = true),
            onPageFinished: (e) => setState(() => isLoading = false),
            onWebResourceError: (e) {
              if (e.errorType == WebResourceErrorType.hostLookup) {
                setState(() => hasError = true);
              }
            },
          ),
        ],
      ),
    );
  }
}
