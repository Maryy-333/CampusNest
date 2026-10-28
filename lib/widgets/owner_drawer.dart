import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text.dart';
import '../core/constants/owner_destination.dart';
import '../core/utils/formatters.dart';
import '../models/owner_profile.dart';
import '../models/subscription_info.dart';
import 'drawer_item.dart';
import 'initials_avatar.dart';
import 'status_pill.dart';

const _appVersionLabel = 'CampusNest v1.0';

class OwnerDrawer extends StatelessWidget {
  const OwnerDrawer({
    super.key,
    required this.profile,
    required this.subscription,
    required this.selected,
    required this.onSelect,
    required this.onLogout,
  });

  final OwnerProfile profile;
  final SubscriptionInfo subscription;
  final OwnerDestination selected;
  final ValueChanged<OwnerDestination> onSelect;
  final VoidCallback onLogout;

  static IconData _iconFor(OwnerDestination d) {
    switch (d) {
      case OwnerDestination.dashboard:
        return Icons.grid_view_rounded;
      case OwnerDestination.myListings:
        return Icons.apartment_rounded;
      case OwnerDestination.messages:
        return Icons.chat_bubble_outline_rounded;
      case OwnerDestination.subscription:
        return Icons.credit_card_rounded;
      case OwnerDestination.profile:
        return Icons.person_outline_rounded;
      case OwnerDestination.help:
        return Icons.help_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = math.min(304.0, MediaQuery.sizeOf(context).width * 0.85);
    return Drawer(
      width: width,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          _Header(profile: profile, subscription: subscription),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                for (final d in OwnerDestination.values)
                  DrawerItem(
                    icon: _iconFor(d),
                    label: d.title,
                    selected: d == selected,
                    badgeCount: d == OwnerDestination.messages
                        ? profile.unreadMessages
                        : 0,
                    onTap: () {
                      Navigator.of(context).pop(); // close the drawer
                      onSelect(d);
                    },
                  ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.border),
          SafeArea(
            top: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                DrawerItem(
                  icon: Icons.logout_rounded,
                  label: 'Log out',
                  color: AppColors.rejected,
                  onTap: () {
                    Navigator.of(context).pop();
                    onLogout();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
                  child: Text(
                    _appVersionLabel,
                    style: AppText.body(size: 12, color: AppColors.textMuted),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.profile, required this.subscription});

  final OwnerProfile profile;
  final SubscriptionInfo subscription;

  @override
  Widget build(BuildContext context) {
    final active = subscription.isActive;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.inkStart, AppColors.inkEnd],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InitialsAvatar(
                    initials: initialsOf(profile.hostelName),
                    size: 56,
                    serif: true,
                    foreground: Colors.white,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.primaryLight, AppColors.primary],
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile.hostelName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.heading(size: 18, color: Colors.white),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          profile.email,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.body(
                            size: 13,
                            color: AppColors.onInkMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              StatusPill(
                label: active
                    ? 'Plan active · ${subscription.daysLeft} days left'
                    : 'Plan expired',
                color: active ? AppColors.verified : AppColors.rejected,
                background: active
                    ? AppColors.verifiedBg
                    : AppColors.rejectedBg,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
