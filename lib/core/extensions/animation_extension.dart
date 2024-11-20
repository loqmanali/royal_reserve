import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension AnimatedWidget on Widget {
  Widget animatedWidget({
    AnimationController? controller,
    Duration? duration,
    Curve? curve,
    required Duration delay,
    bool fadeIn = true,
    bool slideIn = true,
    bool scale = false,
    bool rotate = false,
  }) {
    var animation = animate(controller: controller);

    if (fadeIn) {
      animation = animation.fadeIn(
        duration: duration ?? 500.ms,
        curve: curve ?? Curves.fastOutSlowIn,
        delay: delay,
      );
    }

    if (slideIn) {
      animation = animation.move(
        begin: const Offset(0, 30),
        end: const Offset(0, 0),
        duration: duration ?? 500.ms,
        curve: curve ?? Curves.fastOutSlowIn,
        delay: delay,
      );
    }

    if (scale) {
      animation = animation.scale(
        begin: const Offset(0.8, 0.8),
        end: const Offset(1.0, 1.0),
        duration: duration ?? 500.ms,
        curve: curve ?? Curves.fastOutSlowIn,
        delay: delay,
      );
    }

    if (rotate) {
      animation = animation.rotate(
        begin: 0.1,
        end: 0,
        duration: duration ?? 500.ms,
        curve: curve ?? Curves.fastOutSlowIn,
        delay: delay,
      );
    }

    return animation;
  }

  Widget bounceIn({
    AnimationController? controller,
    Duration? duration,
    Duration? delay,
  }) {
    return animate(controller: controller)
        .scale(
          begin: const Offset(0.3, 0.3),
          end: const Offset(1, 1),
          duration: duration ?? const Duration(milliseconds: 500),
          curve: Curves.elasticOut,
          delay: delay ?? 0.ms,
        )
        .fade(
          begin: 0,
          end: 1,
          duration: (duration ?? 600.ms) ~/ 2,
          curve: Curves.easeOut,
          delay: delay ?? 0.ms,
        );
  }

  Widget shakeAnimation({
    AnimationController? controller,
    Duration? duration,
    Duration? delay,
  }) {
    return animate(controller: controller).shake(
      hz: 4,
      curve: Curves.easeInOut,
      duration: duration ?? 500.ms,
      delay: delay ?? 0.ms,
    );
  }
}
