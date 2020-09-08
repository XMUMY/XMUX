import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/generated/l10n_keys.dart';

/// A widget that capture [OverscrollNotification] and display an indicator
/// while loading more.
class LazyLoader<T extends List> extends StatefulWidget {
  /// Builder to build the body.
  /// The child should contain a [Scrollable] widget.
  final Widget Function(BuildContext, T) builder;

  /// Callback to load more.
  /// Returns true/false if loading succeeded/failed.
  /// Returns null to disable loading more.
  final Future<bool> Function(T) onLoadMore;

  /// Controller of [ListView].
  ///
  /// For scrolling down automatically after loading complete.
  final ScrollController controller;

  const LazyLoader({
    Key key,
    @required this.builder,
    @required this.onLoadMore,
    this.controller,
  }) : super(key: key);

  @override
  LazyLoaderState createState() => LazyLoaderState<T>();
}

class LazyLoaderState<T extends List> extends State<LazyLoader<T>> {
  /// Get data from [Refreshable].
  T get data => context.findAncestorStateOfType<RefreshableState<T>>().data;

  final _indicatorKey = GlobalKey<_BottomLoadingIndicatorState>();

  bool _isLoadingMore = false;

  bool _canLoadMore = true;

  bool _handleNotification(OverscrollNotification notification) {
    if (!_canLoadMore) return false;

    if (_isLoadingMore == false &&
        notification.metrics.axisDirection == AxisDirection.down &&
        notification.metrics.extentAfter == 0) {
      _indicatorKey.currentState.controller.forward();
      _isLoadingMore = true;

      widget.onLoadMore(data).then((result) {
        if (result == null) {
          _canLoadMore = false;
        }

        if (result != null && result) {
          setState(() {});
          widget.controller?.animateTo(
            widget.controller.offset + 50,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        }

        _isLoadingMore = false;
        _indicatorKey.currentState.controller.reverse();
      }).catchError((e) {
        _isLoadingMore = false;
        _indicatorKey.currentState.controller.reverse();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(LocaleKeys.General_ErrorTip.tr(args: [e.toString()])),
        ));
      });
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        NotificationListener<OverscrollNotification>(
          child: widget.builder(context, data),
          onNotification: _handleNotification,
        ),
        _BottomLoadingIndicator(key: _indicatorKey),
      ],
    );
  }
}

class _BottomLoadingIndicator extends StatefulWidget {
  const _BottomLoadingIndicator({Key key}) : super(key: key);

  @override
  _BottomLoadingIndicatorState createState() => _BottomLoadingIndicatorState();
}

class _BottomLoadingIndicatorState extends State<_BottomLoadingIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> _fadeAnimation;
  Animation<Offset> _positionAnimation;

  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    _fadeAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo)
          ..addListener(() => setState(() {}));
    _positionAnimation = Tween<Offset>(begin: Offset(0, 50), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut))
          ..addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _fadeAnimation.value,
      child: Transform.translate(
        offset: _positionAnimation.value,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 15,
            ),
            child: RefreshProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
