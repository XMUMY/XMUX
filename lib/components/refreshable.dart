import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xmux/components/empty_error_button.dart';
import 'package:xmux/components/empty_error_page.dart';

/// Handle [RefreshIndicator] and display error message automatically.
class Refreshable<T> extends StatefulWidget {
  /// Builder that build the body.
  /// Must contain a [Scrollable].
  final Widget Function(BuildContext, T) builder;

  /// Handle refresh.
  final Future<T> Function() onRefresh;

  /// If the data is empty, [EmptyErrorPage] will be displayed automatically.
  final bool Function(T) isEmpty;

  const Refreshable({
    Key key,
    @required this.builder,
    @required this.onRefresh,
    this.isEmpty,
  }) : super(key: key);

  @override
  RefreshableState createState() => RefreshableState<T>();
}

class RefreshableState<T> extends State<Refreshable<T>> {
  final _indicatorKey = GlobalKey<_BottomLoadingIndicatorState>();

  /// Data for builder.
  T data;

  /// When initializing widget state, data will be automatically load.
  /// Flag will be true if first load has been completed.
  var firstLoadCompleted = false;

  Future<void> refresh() async => await widget
      .onRefresh()
      .then((v) => mounted ? setState(() => data = v) : null);

  Future<void> showLoadingIndicator(Future future) async {
    _indicatorKey.currentState.controller.forward();
    await future;
    _indicatorKey.currentState.controller.reverse();
  }

  @override
  void initState() {
    refresh().then((_) => firstLoadCompleted = true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) if (!firstLoadCompleted)
      return Center(child: CircularProgressIndicator());
    else
      return EmptyErrorButton(onRefresh: refresh);

    if (widget.isEmpty != null && widget.isEmpty(data)) return EmptyErrorPage();

    return Stack(
      children: <Widget>[
        RefreshIndicator(
          onRefresh: refresh,
          child: widget.builder(context, data),
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
            padding: const EdgeInsets.only(bottom: 15),
            child: RefreshProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
