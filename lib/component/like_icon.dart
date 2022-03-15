import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LikeIcon extends StatefulWidget {
  final double size;
  final bool liked;

  const LikeIcon({
    Key? key,
    this.size = 35,
    this.liked = false,
  }) : super(key: key);

  @override
  State<LikeIcon> createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      value: widget.liked ? 0.4 : 0.13,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LikeIcon oldWidget) {
    if (widget.liked != oldWidget.liked) {
      _controller.animateTo(widget.liked ? 0.4 : 0.13);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.network(
      'https://assets10.lottiefiles.com/private_files/lf30_huml8m4r.json',
      controller: _controller,
      width: widget.size,
      height: widget.size,
      repeat: false,
    );
  }
}
