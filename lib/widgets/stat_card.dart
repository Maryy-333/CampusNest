import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text.dart';
import 'tappable_card.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.value,
    required this.label,
    this.valueColor = AppColors.textDark,
  });

  final String value;
  final String label;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return TappableCard(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: AppText.heading(size: 24, color: valueColor),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AppText.body(size: 12, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
