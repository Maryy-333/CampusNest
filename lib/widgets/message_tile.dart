import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text.dart';
import '../core/utils/formatters.dart';
import '../models/message_preview.dart';
import 'initials_avatar.dart';
import 'tappable_card.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({super.key, required this.message, required this.onTap});

  final MessagePreview message;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TappableCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          InitialsAvatar(initials: initialsOf(message.senderName)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        message.senderName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.body(size: 15, weight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      timeAgoShort(message.sentAt),
                      style: AppText.body(size: 12, color: AppColors.textMuted),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  message.preview,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.body(size: 13, color: AppColors.textMuted),
                ),
              ],
            ),
          ),
          if (message.isUnread) ...[
            const SizedBox(width: 10),
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
