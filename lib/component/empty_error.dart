import 'dart:async';

import 'package:flutter/material.dart';

/// Display an empty error at the center of viewport.
/// Use [EmptyErrorList] if you want to use it with a [RefreshIndicator].
class EmptyErrorPage extends StatefulWidget {
  const EmptyErrorPage({super.key});

  @override
  State<EmptyErrorPage> createState() => _EmptyErrorPageState();
}

class _EmptyErrorPageState extends State<EmptyErrorPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Timer _timer;

  void _resetTimer(bool forward) {
    if (forward) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
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
    return Padding(
      padding: MediaQuery.of(context).padding,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              child: const Icon(Icons.hourglass_empty, size: 50),
              builder: (context, child) => RotationTransition(
                turns: _controller,
                child: child,
              ),
            ),
            const Divider(color: Colors.transparent),
            const Text(
              'Oh! Nothing is here!\nPlease refresh or come later.',
              textAlign: TextAlign.center,
            ),
            const Divider(color: Colors.transparent),
            const Text(
              '噢！这里什么也没有！\n请刷新或稍后再来。',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

/// Display an empty error at the center with an empty [ListView].
class EmptyErrorList extends StatelessWidget {
  const EmptyErrorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const EmptyErrorPage(),
        ListView(),
      ],
    );
  }
}
