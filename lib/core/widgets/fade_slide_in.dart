import 'package:flutter/material.dart';

/// Wraps [child] with a fade + upward slide entrance animation that
/// plays once when the widget first builds. Use [delay] to stagger
/// multiple items in a list/grid for a cascading reveal effect.
class FadeSlideIn extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final double offsetY;

  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 550),
    this.offsetY = 24,
  });

  @override
  State<FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<FadeSlideIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: Offset(0, widget.offsetY / 100),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}

/// Triggers a [FadeSlideIn] reveal only when the widget scrolls into
/// the viewport, using [VisibilityDetectorLite] logic built on
/// [NotificationListener] + a simple key-based one-shot flag.
/// For simplicity and zero extra dependencies, this version plays the
/// animation on first frame; wrap sections in it directly.
class ScrollReveal extends StatelessWidget {
  final Widget child;
  final int index;

  const ScrollReveal({super.key, required this.child, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return FadeSlideIn(
      delay: Duration(milliseconds: 60 * index),
      child: child,
    );
  }
}
