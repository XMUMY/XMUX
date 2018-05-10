import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/state.dart';

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.5;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selected = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selected;
    return Container(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(itemCount, _buildDot),
      );
}

class HomeSlider extends StatefulWidget {
  @override
  State createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final _controller = PageController();
  Timer _autoSlider;

  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  Widget _buildSlider(Map n) => n["isWebPage"]
      ? DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(n["imageURL"]),
              fit: BoxFit.fill,
            ),
          ),
          child: FlatButton(onPressed: () => launch(n["uri"]), child: null),
        )
      : DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(n["imageURL"]),
              fit: BoxFit.fill,
            ),
          ),
          child: FlatButton(
              onPressed: () => Navigator.of(context).pushNamed(n["uri"]),
              child: null),
        );

  @override
  void initState() {
    // Register auto slider.
    _autoSlider = Timer.periodic(
        Duration(seconds: 5),
        (_) => _controller.animateToPage(
            _controller.page.toInt() >=
                    mainAppStore.state.uiState.news.length - 1
                ? 0
                : _controller.page.toInt() + 1,
            duration: _kDuration,
            curve: _kCurve));

    super.initState();
  }

  @override
  void dispose() {
    _autoSlider.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      StoreConnector<MainAppState, List<Widget>>(
        converter: (store) => store.state.uiState.news
            .map((n) => _buildSlider(n as Map))
            .toList(),
        builder: (_, _pages) => Stack(
              children: <Widget>[
                // Build sliders.
                PageView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: _controller,
                  itemBuilder: (BuildContext context, int index) =>
                      _pages[index],
                  itemCount: _pages.length,
                ),
                // Build dot indicators.
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: DotsIndicator(
                        controller: _controller,
                        itemCount: _pages.length,
                        onPageSelected: (int page) {
                          _controller.animateToPage(
                            page,
                            duration: _kDuration,
                            curve: _kCurve,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
      );
}
