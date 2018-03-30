import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    // Create animation.
    controller = new AnimationController(
        duration: new Duration(milliseconds: 500), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.addListener(() {
      setState(() {});
    });
    super.initState();

    // Play.
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Image.asset(
          "res/logo.png",
          height: animation.value * 80.0,
          width: animation.value * 80.0,
        ),
      );
}
