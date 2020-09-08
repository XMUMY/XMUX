import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xmux/components/empty_error.dart';

/// A widget that hold refreshable data and integrate with [RefreshIndicator]
/// and [EmptyErrorList].
///
/// Data will be automatically refreshed during initialization.
class Refreshable<T> extends StatefulWidget {
  /// Builder to build the body.
  /// The child should contain a [Scrollable] widget in order to integrate with
  /// [RefreshIndicator].
  final Widget Function(BuildContext, T) builder;

  /// Handle refresh.
  final Future<T> Function() onRefresh;

  /// Determine if the data is empty.
  /// An empty error will be shown while data is empty.
  final bool Function(T) isEmpty;

  /// Indicator for initialization.
  final Widget placeholder;

  Refreshable({
    Key key,
    @required this.builder,
    @required this.onRefresh,
    this.isEmpty,
    Widget placeholder,
  })  : placeholder = placeholder ?? Center(child: CircularProgressIndicator()),
        super(key: key);

  @override
  RefreshableState createState() => RefreshableState<T>();
}

class RefreshableState<T> extends State<Refreshable<T>> {
  /// Data holds.
  T data;

  /// When initializing widget state, data will be automatically load.
  /// Flag will be true if first load has completed.
  var _initialized = false;

  Future<void> refresh() async => await widget
      .onRefresh()
      .then((v) => mounted ? setState(() => data = v) : null);

  @override
  void initState() {
    refresh().then((_) => _initialized = true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (data == null || (widget.isEmpty != null && widget.isEmpty(data))) {
      if (!_initialized)
        body = widget.placeholder;
      else
        body = EmptyErrorList();
    } else
      body = widget.builder(context, data);

    return RefreshIndicator(
      displacement: 40 + Scaffold.of(context).appBarMaxHeight,
      onRefresh: refresh,
      child: body,
    );
  }
}
