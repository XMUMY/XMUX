import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    @required this.controller,
    @required this.itemCount,
    @required this.onPageSelected,
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
  static const double _kDotSize = 5.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.8;

  // The distance between the center of each dot
  static const double _kDotSpacing = 20.0;

  Widget _buildDot(int index) {
    var selected = max(0.0, 1.0 - ((controller.page ?? 0) - index).abs());
    var zoom = 1.0 + (_kMaxZoom - 1.0) * selected;
    return Container(
      width: _kDotSpacing,
      height: _kDotSize * 2,
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

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(itemCount, _buildDot),
      );
}

/// A simple slider for full viewport display.
class SimpleSlider extends StatefulWidget {
  /// The pages of slider.
  final List<Widget> pages;

  /// If != null, slider will auto play with duration.
  final Duration autoPlayDuration;

  const SimpleSlider({@required this.pages, this.autoPlayDuration});

  @override
  State createState() => _SimpleSliderState();
}

class _SimpleSliderState extends State<SimpleSlider> {
  final _controller = PageController();

  /// Timer to control auto playing.
  Timer _autoPlayer;

  // Duration of sliding.
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.easeIn;

  @override
  void initState() {
    // Register auto player.
    if (widget.autoPlayDuration != null)
      _autoPlayer = Timer.periodic(
        widget.autoPlayDuration,
        (_) => _controller.animateToPage(
            _controller.page.round() >= widget.pages.length - 1
                ? 0
                : _controller.page.toInt() + 1,
            duration: _kDuration,
            curve: _kCurve),
      );

    super.initState();
  }

  @override
  void dispose() {
    if (widget.autoPlayDuration != null) _autoPlayer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          // Build sliders.
          PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            itemBuilder: (BuildContext context, int index) =>
                widget.pages[index],
            itemCount: widget.pages.length,
          ),

          // Build dot indicators.
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: EdgeInsets.all(7.0),
              child: Center(
                child: DotsIndicator(
                  controller: _controller,
                  itemCount: widget.pages.length,
                  onPageSelected: (page) => _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      ),
                ),
              ),
            ),
          ),
        ],
      );
}
