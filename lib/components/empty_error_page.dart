import 'package:flutter/material.dart';

class EmptyErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            Icons.hourglass_empty,
            size: 50.0,
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          Text(
            'Oh! Nothing is here!\nPlease come later.',
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          Text(
            '噢！这里什么也没有！\n请稍后再来。',
            textAlign: TextAlign.center,
          )
        ],
      );
}
