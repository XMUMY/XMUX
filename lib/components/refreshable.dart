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

  Refreshable({
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

  @override
  void initState() {
    widget.onRefresh().then((v) => mounted ? setState(() => data = v) : null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) return EmptyErrorButton(onRefresh: widget.onRefresh);

    if (widget.isEmpty != null && widget.isEmpty(data)) return EmptyErrorPage();

    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: widget.builder(context, data),
    );
  }
}
