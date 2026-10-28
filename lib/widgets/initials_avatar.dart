import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text.dart';

class InitialsAvatar extends StatelessWidget {
  const InitialsAvatar({
    super.key,
    required this.initials,
    this.size = 44,
    this.background = AppColors.avatarBg,
    this.foreground = AppColors.primary,
    this.gradient,
    this.serif = false,
  });

  final String initials;
  final double size;
  final Color background;
  final Color foreground;
  final Gradient? gradient;

  /// Use Fraunces (for the big drawer avatar) instead of Work Sans.
  final bool serif;

  @override
  Widget build(BuildContext context) {
    final style = serif
        ? AppText.heading(size: size * 0.36, color: foreground)
        : AppText.body(
            size: size * 0.31,
            weight: FontWeight.w700,
            color: foreground,
          );
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: gradient == null ? background : null,
        gradient: gradient,
      ),
      child: Text(initials, style: style),
    );
  }
}
