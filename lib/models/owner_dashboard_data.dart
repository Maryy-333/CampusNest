import 'listing_summary.dart';
import 'message_preview.dart';
import 'owner_profile.dart';
import 'subscription_info.dart';

/// Everything the dashboard and drawer need, loaded in one call.
class OwnerDashboardData {
  const OwnerDashboardData({
    required this.profile,
    required this.subscription,
    required this.recentMessages,
    required this.listings,
  });

  final OwnerProfile profile;
  final SubscriptionInfo subscription;
  final List<MessagePreview> recentMessages;
  final List<ListingSummary> listings;
}
