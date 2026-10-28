import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text.dart';
import '../core/utils/formatters.dart';
import '../models/subscription_info.dart';
import 'status_pill.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({
    super.key,
    required this.info,
    required this.onManage,
  });

  final SubscriptionInfo info;
  final VoidCallback onManage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.inkStart, AppColors.inkEnd],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  info.planName.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.body(
                    size: 11.5,
                    weight: FontWeight.w500,
                    color: AppColors.onInkMuted,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              info.isPaid
                  ? const StatusPill(
                      label: 'Paid',
                      color: AppColors.verified,
                      background: AppColors.verifiedBg,
                    )
                  : const StatusPill(
                      label: 'Unpaid',
                      color: AppColors.pending,
                      background: AppColors.pendingBg,
                    ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            info.statusLabel,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppText.heading(size: 20, color: Colors.white),
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: info.progress,
              minHeight: 4,
              backgroundColor: Colors.white.withValues(alpha: 0.15),
              valueColor: const AlwaysStoppedAnimation(AppColors.primaryLight),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Renews ${formatShortDate(info.renewsOn)} · '
                  '${formatRs(info.amount)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.body(size: 13, color: AppColors.onInkMuted),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: onManage,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'Manage →',
                    style: AppText.body(
                      size: 13,
                      weight: FontWeight.w700,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
