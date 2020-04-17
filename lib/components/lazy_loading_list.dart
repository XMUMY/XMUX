import 'package:flutter/material.dart';
import 'package:xmux/components/refreshable.dart';

class LazyLoadingList<T> extends StatefulWidget {
  /// Builder to build each element.
  /// Must contain a [Scrollable].
  final Widget Function(BuildContext, T, int) builder;

  /// Handle refresh.
  final Future<List<T>> Function() onRefresh;

  /// Callback to load more.
  /// Should return null if loading failed.
  final Future<List<T>> Function(List<T>) onLoadMore;

  /// If the data is empty, [EmptyErrorPage] will be displayed automatically.
  final bool Function(List<T>) isEmpty;

  /// Indicator for first loading.
  final Widget firstLoadingIndicator;

  /// Padding of [ListView].
  final EdgeInsets padding;

  /// Controller of [ListView].
  final ScrollController controller;

  LazyLoadingList({
    Key key,
    @required this.builder,
    @required this.onRefresh,
    this.onLoadMore,
    this.isEmpty,
    this.firstLoadingIndicator,
    this.padding,
    ScrollController controller,
  })  : this.controller = controller ?? ScrollController(),
        super(key: key);

  @override
  LazyLoadingListState createState() => LazyLoadingListState<T>();
}

class LazyLoadingListState<T> extends State<LazyLoadingList<T>> {
  final _indicatorKey = GlobalKey<_BottomLoadingIndicatorState>();
  final _refreshableKey = GlobalKey<RefreshableState<List<T>>>();

  List<T> get data => _refreshableKey.currentState.data;

  Future<void> refresh() async => await _refreshableKey.currentState.refresh();

  @override
  void initState() {
    if (widget.onLoadMore != null)
      widget.controller.addListener(() async {
        if (widget.controller.position.extentAfter == 0) {
          _indicatorKey.currentState.controller.forward();

          var loaded =
              await widget.onLoadMore(_refreshableKey.currentState.data);
          if (loaded != null && loaded.isNotEmpty) {
            _refreshableKey.currentState.setState(
                () => _refreshableKey.currentState.data.addAll(loaded));
            widget.controller.animateTo(widget.controller.offset + 50,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut);
          }

          _indicatorKey.currentState.controller.reverse();
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Refreshable<List<T>>(
          key: _refreshableKey,
          builder: (context, data) => ListView.builder(
            padding: widget.padding,
            controller: widget.controller,
            itemCount: data.length,
            itemBuilder: (context, i) => widget.builder(context, data[i], i),
          ),
          onRefresh: widget.onRefresh,
          isEmpty: widget.isEmpty,
          firstLoadingIndicator: widget.firstLoadingIndicator,
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
