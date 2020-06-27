import 'dart:async';

import 'package:flutter/material.dart';

/// Display an empty error page.
class EmptyErrorPage extends StatefulWidget {
  @override
  _EmptyErrorPageState createState() => _EmptyErrorPageState();
}

class _EmptyErrorPageState extends State<EmptyErrorPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Timer _timer;

  void _resetTimer(bool forward) {
    if (forward)
      _controller.forward();
    else
      _controller.reverse();
    _timer = Timer(const Duration(seconds: 3), () => _resetTimer(!forward));
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      upperBound: 0.5,
      duration: const Duration(milliseconds: 300),
    );
    _resetTimer(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedBuilder(
          animation: _controller,
          child: Icon(Icons.hourglass_empty, size: 50),
          builder: (context, child) => RotationTransition(
            turns: _controller,
            child: child,
          ),
        ),
        Divider(color: Colors.transparent),
        Text(
          'Oh! Nothing is here!\nPlease refresh or come later.',
          textAlign: TextAlign.center,
        ),
        Divider(color: Colors.transparent),
        Text(
          '噢！这里什么也没有！\n请刷新或稍后再来。',
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
