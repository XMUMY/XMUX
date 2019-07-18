import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EmptyErrorButton extends StatelessWidget {
  /// Callback to refresh data.
  final AsyncCallback onRefresh;

  EmptyErrorButton({AsyncCallback onRefresh})
      : this.onRefresh = onRefresh ?? (() async {});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: FlatButton(
        onPressed: onRefresh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.hourglass_empty,
              size: 50,
              color: Theme.of(context).errorColor,
            ),
            Divider(color: Colors.transparent),
            Text(
              'Oh! Nothing is here!\nTap to refresh or come later.',
              textAlign: TextAlign.center,
            ),
            Divider(color: Colors.transparent),
            Text(
              '噢！这里什么也没有！\n点击刷新或稍后再来。',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
