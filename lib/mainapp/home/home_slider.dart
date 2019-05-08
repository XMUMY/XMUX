import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/components/simple_slider.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';

class HomeSlider extends StatefulWidget {
  @override
  State createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  Widget _buildSlider(News n) => Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(imageUrl: n.imageURL, fit: BoxFit.fill),
          FlatButton(
              onPressed: n.uri.isEmpty ? null : () => launch(n.uri),
              child: null),
        ],
      );

  @override
  void initState() {
    store.dispatch(UpdateHomepageNewsAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      StoreConnector<MainAppState, List<Widget>>(
        converter: (store) =>
            store.state.uiState.homepageNews
                ?.map((n) => _buildSlider(n))
                ?.toList()
                ?.reversed
                ?.toList() ??
            [SvgPicture.asset("res/home/news.svg")],
        builder: (_, pages) => SimpleSlider(
              pages: pages,
              autoPlayDuration: Duration(seconds: 4),
            ),
      );
}
