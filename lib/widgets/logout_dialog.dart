import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text.dart';

/// Returns true if the user confirmed.
Future<bool> showLogoutDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      title: Text('Log out?', style: AppText.heading(size: 20)),
      content: Text(
        'You will need to log in again to manage your hostel.',
        style: AppText.body(size: 14, color: AppColors.textMuted),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: Text(
            'Cancel',
            style: AppText.body(
              weight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          child: Text(
            'Log out',
            style: AppText.body(
              weight: FontWeight.w700,
              color: AppColors.rejected,
            ),
          ),
        ),
      ],
    ),
  );
  return result ?? false;
}
