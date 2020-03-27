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

  /// Indicator for first loading.
  final Widget firstLoadingIndicator;

  Refreshable({
    Key key,
    @required this.builder,
    @required this.onRefresh,
    this.isEmpty,
    Widget firstLoadingIndicator,
  })  : this.firstLoadingIndicator =
            firstLoadingIndicator ?? CircularProgressIndicator(),
        super(key: key);

  @override
  RefreshableState createState() => RefreshableState<T>();
}

class RefreshableState<T> extends State<Refreshable<T>> {
  /// Data for builder.
  T data;

  /// When initializing widget state, data will be automatically load.
  /// Flag will be true if first load has been completed.
  var firstLoadCompleted = false;

  Future<void> refresh() async => await widget
      .onRefresh()
      .then((v) => mounted ? setState(() => data = v) : null);

  @override
  void initState() {
    refresh().then((_) => firstLoadCompleted = true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) if (!firstLoadCompleted)
      return Center(child: widget.firstLoadingIndicator);
    else
      return EmptyErrorButton(onRefresh: refresh);

    if (widget.isEmpty != null && widget.isEmpty(data)) return EmptyErrorPage();

    return RefreshIndicator(
      onRefresh: refresh,
      child: widget.builder(context, data),
    );
  }
}
