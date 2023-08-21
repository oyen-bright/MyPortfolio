import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/constants.dart';

class ExpandMoreWidget extends StatefulWidget {
  const ExpandMoreWidget(
      {super.key, required this.onTap, required this.showDownArrow});

  final void Function()? onTap;
  final bool showDownArrow;

  @override
  State<ExpandMoreWidget> createState() => _ExpandMoreWidgetState();
}

class _ExpandMoreWidgetState extends State<ExpandMoreWidget>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;

  late final AnimationController _controller;
  late final Animation<Offset> _animation;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: 4.seconds);

    _animation = Tween<Offset>(
            begin: const Offset(0, 0), end: const Offset(0, -1))
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
    return InkWell(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) => setState(() {
          isHovered = true;
        }),
        onExit: (event) => setState(() {
          isHovered = false;
        }),
        child: AnimatedContainer(
          duration: Constants.kAnimationDuration,
          curve: Curves.easeInOutCubic,
          width: double.infinity,
          height: !widget.showDownArrow
              ? 0
              : Constants.kExpandButtonHeight +
                  (_animation.value.dy.abs() * 10), // Adjust the calculation
          child: SlideTransition(
            position: _animation,
            child: Image.asset(
              "assets/images/ios-down-arrow.png",
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}

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
            begin: const Offset(0, 0), end: const Offset(0, -1))
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
