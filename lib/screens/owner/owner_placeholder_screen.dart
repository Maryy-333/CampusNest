import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';

/// Temporary screen for every owner page that is built in a later chat.
class OwnerPlaceholderScreen extends StatelessWidget {
  const OwnerPlaceholderScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textDark,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(title, style: AppText.heading(size: 20)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.construction_rounded,
                size: 44,
                color: AppColors.hint,
              ),
              const SizedBox(height: 12),
              Text(
                '$title is coming soon',
                textAlign: TextAlign.center,
                style: AppText.body(size: 16, color: AppColors.textMuted),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
