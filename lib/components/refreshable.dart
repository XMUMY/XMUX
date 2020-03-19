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
  T data;

  /// When initializing widget state, data will be automatically load.
  /// Flag will be true if first load has been completed.
  var firstLoadCompleted = false;

  /// Flag to show a loading indicator at the bottom.
  var isLoadingMore = false;

  Future<void> refresh() async => await widget
      .onRefresh()
      .then((v) => mounted ? setState(() => data = v) : null);

  Future<void> showLoadingIndicator(Future future) async {
    if (mounted) setState(() => isLoadingMore = true);
    await future;
    if (mounted) setState(() => isLoadingMore = false);
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
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 100),
          crossFadeState: isLoadingMore
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: Container(),
          secondChild: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: RefreshProgressIndicator(),
            ),
          ),
        )
      ],
    );
  }
}
