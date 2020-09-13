import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart' hide Slider;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart'
    if (dart.library.html) 'package:xmux/components/svg_web.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xmux/components/simple_slider.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/rpc/clients/news.pb.dart';
import 'package:xmux/redux/redux.dart';

class HomeSlider extends StatefulWidget {
  @override
  State createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  Widget _buildSlider(Slider n) => Stack(
        fit: StackFit.expand,
        children: [
          ExtendedImage.network(n.imageUrl, fit: BoxFit.fill),
          FlatButton(
              onLongPress: () {},
              onPressed: n.webviewUrl.isEmpty
                  ? null
                  : () => Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (_) => WebViewPage(n.webviewUrl))),
              child: null),
        ],
      );

  @override
  void initState() {
    store.dispatch(UpdateHomeSlidersAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      StoreConnector<MainAppState, List<Widget>>(
        converter: (store) => store.state.uiState.homeSliders.isNotEmpty
            ? store.state.uiState.homeSliders
                .map((n) => _buildSlider(n))
                .toList()
                .reversed
                .toList()
            : [SvgPicture.asset('res/home/news.svg')],
        builder: (_, pages) => SimpleSlider(
          pages: pages,
          autoPlayDuration: Duration(seconds: 4),
        ),
      );
}

class WebViewPage extends StatefulWidget {
  final String url;

  WebViewPage(this.url);

  @override
  State<StatefulWidget> createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.call_made),
            onPressed: () => launch(widget.url, forceWebView: false),
          )
        ],
      ),
      body: WebView(
        initialUrl: widget.url,
        onWebViewCreated: (c) => controller = c,
      ),
    );
  }
}
