import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedDownwardArrow extends StatefulWidget {
  const AnimatedDownwardArrow({super.key});

  @override
  State<AnimatedDownwardArrow> createState() => _AnimatedDownwardArrowState();
}

class _AnimatedDownwardArrowState extends State<AnimatedDownwardArrow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: 4.seconds);

    _animation = Tween<Offset>(
            begin: const Offset(0, -2), end: const Offset(0, -3))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset(
        "assets/images/ios-down-arrow.png",
      ),
    );
  }
}
