import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    // Create animation.
    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addListener(() {
        setState(() {});
      });
    super.initState();

    // Play.
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(10.0),
        child: Opacity(
          opacity: animation.value,
          child: Image.asset(
            "res/logo.png",
            height: animation.value * 100.0,
            width: animation.value * 100.0,
          ),
        ),
      );
}
