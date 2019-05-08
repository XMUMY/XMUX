import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EmptyErrorButton extends StatelessWidget {
  final AsyncCallback onRefresh;

  EmptyErrorButton({AsyncCallback onRefresh})
      : this.onRefresh = onRefresh ?? (() {});

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.all(20.0),
        child: FlatButton(
          onPressed: onRefresh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.hourglass_empty,
                size: 50.0,
                color: Theme.of(context).errorColor,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Text(
                'Oh! Nothing is here!\nPlease refresh or come later.',
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Text(
                '噢！这里什么也没有！\n请刷新或稍后再来。',
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
}
