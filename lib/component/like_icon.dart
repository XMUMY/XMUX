import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../util/platform.dart';

class LikeIcon extends StatelessWidget {
  final bool liked;

  const LikeIcon({
    super.key,
    this.liked = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      firstChild: const Icon(Icons.favorite_border),
      secondChild: const Icon(Icons.favorite, color: Colors.red),
      crossFadeState:
          liked ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }
}

class LottieLikeIcon extends StatefulWidget {
  final double size;
  final bool liked;

  const LottieLikeIcon({
    super.key,
    this.size = 35,
    this.liked = false,
  });

  @override
  State<LottieLikeIcon> createState() => _LottieLikeIconState();
}

class _LottieLikeIconState extends State<LottieLikeIcon>
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
  void didUpdateWidget(covariant LottieLikeIcon oldWidget) {
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
    final delegates = LottieDelegates(
      values: [
        ValueDelegate.color(
          const ['Empty', 'Group 1', 'Fill 1'],
          value: Theme.of(context).colorScheme.onSurface,
        ),
      ],
    );

    if (isWeb) {
      return LottieBuilder.network(
        'https://assets10.lottiefiles.com/private_files/lf30_huml8m4r.json',
        repeat: false,
        controller: _controller,
        width: widget.size,
        height: widget.size,
        delegates: delegates,
      );
    } else {
      return LottieBuilder.asset(
        'res/animation/like.json',
        repeat: false,
        controller: _controller,
        width: widget.size,
        height: widget.size,
        delegates: delegates,
      );
    }
  }
}
