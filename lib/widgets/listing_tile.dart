import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text.dart';
import '../core/utils/formatters.dart';
import '../models/listing_summary.dart';
import 'status_pill.dart';
import 'tappable_card.dart';

class ListingTile extends StatelessWidget {
  const ListingTile({super.key, required this.listing, required this.onTap});

  final ListingSummary listing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isLive = listing.status == ListingStatus.live;
    return TappableCard(
      onTap: onTap,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // TODO(listings): show the listing's first photo here.
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.avatarBg, AppColors.border],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.apartment_rounded,
              color: AppColors.hint,
              size: 26,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listing.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.body(size: 15, weight: FontWeight.w700),
                ),
                const SizedBox(height: 2),
                Text(
                  '${formatRs(listing.monthlyRent)}/mo · '
                  '${listing.vacantCount} vacant',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.body(size: 13, color: AppColors.textMuted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          StatusPill(
            label: listing.status.label,
            color: isLive ? AppColors.verified : AppColors.pending,
            background: isLive ? AppColors.verifiedBg : AppColors.pendingBg,
          ),
        ],
      ),
    );
  }
}
