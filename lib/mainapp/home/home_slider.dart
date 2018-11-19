import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/modules/common/simple_slider.dart';
import 'package:xmux/redux/redux.dart';

class HomeSlider extends StatefulWidget {
  @override
  State createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  Widget _buildSlider(Map n) => n["isWebPage"]
      ? Stack(
          fit: StackFit.expand,
          children: [
            (n["imageURL"] as String).isEmpty
                ? SvgPicture.asset("res/home/news.svg")
                : CachedNetworkImage(
                    imageUrl: n["imageURL"],
                    fit: BoxFit.fill,
                  ),
            FlatButton(
                onPressed: (n["uri"] as String).isEmpty
                    ? null
                    : () => launch(n["uri"]),
                child: null),
          ],
        )
      : Stack(
          fit: StackFit.expand,
          children: [
            (n["imageURL"] as String).isEmpty
                ? SvgPicture.asset("res/home/news.svg")
                : CachedNetworkImage(
                    imageUrl: n["imageURL"],
                    fit: BoxFit.fill,
                  ),
            FlatButton(
                onPressed: (n["uri"] as String).isEmpty
                    ? null
                    : () => Navigator.of(context).pushNamed(n["uri"]),
                child: null),
          ],
        );

  @override
  Widget build(BuildContext context) =>
      StoreConnector<MainAppState, List<Widget>>(
        converter: (store) => store.state.uiState.news
            .map((n) => _buildSlider(n as Map))
            .toList()
            .reversed
            .toList(),
        builder: (_, _pages) => SimpleSlider(
              pages: _pages,
              autoPlayDuration: Duration(seconds: 4),
            ),
      );
}
