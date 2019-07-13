import 'package:flutter/material.dart';

/// Display an empty error page.
class EmptyErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.hourglass_empty, size: 50),
        Divider(color: Colors.transparent),
        Text(
          'Oh! Nothing is here!\nPlease come later.',
          textAlign: TextAlign.center,
        ),
        Divider(color: Colors.transparent),
        Text(
          '噢！这里什么也没有！\n请稍后再来。',
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
