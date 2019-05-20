import 'package:flutter/material.dart';

typedef AnimatedInsertionBuilder = Widget Function(
    BuildContext context, Animation<double> animation);

class AnimatedInsertion extends StatefulWidget {
  final Duration duration;
  final Curve curve;
  final AnimatedInsertionBuilder builder;

  const AnimatedInsertion(this.builder,
      {this.duration = const Duration(milliseconds: 300),
      this.curve = Curves.easeIn});

  @override
  State<StatefulWidget> createState() => _AnimatedInsertionState();
}

class _AnimatedInsertionState extends State<AnimatedInsertion>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    // Create animation.
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = CurvedAnimation(parent: controller, curve: widget.curve)
      ..addListener(() => setState(() {}));
    super.initState();

    // Play.
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, animation);
  }
}
